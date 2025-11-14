`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Yuan Yao
// yuan.yao@it.uu.se
// For the course 1DT109 - Accelerating Systems with Programmable Logic Components
//////////////////////////////////////////////////////////////////////////////////




module mat_mul_tb # 
    (
        parameter integer DATA_WIDTH = 32,        
        parameter integer MATRIX_DIMENSION_LOG_2 = 6, // for debug use a smaller size
        parameter integer MATR_BIT_LENGTH = (2**MATRIX_DIMENSION_LOG_2)**2-1
    )
    (

    );
    class tb;
        //const int DATA_WIDTH = 32,        
        //const int MATRIX_DIMENSION_LOG_2 = 6 // for debug use a smaller size
        rand bit [DATA_WIDTH-1:0] matr_val;   //use .randomize() to set this to a new value
        
        
        
        int matA [0 : MATR_BIT_LENGTH];
        int matB [0 : MATR_BIT_LENGTH];
        int matRSW [0 : MATR_BIT_LENGTH];
        int matRHW [0 : MATR_BIT_LENGTH];
    
    function new();
        begin
            for (int i = 0; i < MATR_BIT_LENGTH; i = i + 1) begin
                this.matA[i] = 1'b0;
                $display("matA[%d] = %d", i, this.matA[i]);
                this.matB[i] = 0;
                this.matRSW[i] = 0;
                this.matRHW[i] = 0;
            end
            $display("tb init complete");
            
        end
        //initialize all integers and whatnot
    endfunction
    
    task matr_init();
        begin
            int count = 0;
            int row = 0;
            int column = 0;
            // initialise the matrices; for debug use $urandom%10 to have unsigned values less than 10;
            // $srandom(12345); // Uncomment for debug, which will always generates the same random numbers
            for (row = 0; row < 2**MATRIX_DIMENSION_LOG_2; row = row + 1) begin
                for (column = 0; column < 2**MATRIX_DIMENSION_LOG_2; column = column + 1) begin
                    randomize(matr_val);
                    $display("matA[%d] = %d", (2**MATRIX_DIMENSION_LOG_2)*row + column, this.matA[(2**MATRIX_DIMENSION_LOG_2)*row + column]);
                    this.matA [(2**MATRIX_DIMENSION_LOG_2)*row + column] = this.matr_val; //change this to our random int
                    $display("matA[%d] = %d", (2**MATRIX_DIMENSION_LOG_2)*row + column, this.matA[(2**MATRIX_DIMENSION_LOG_2)*row + column]);
                    randomize(matr_val);
                    this.matB [(2**MATRIX_DIMENSION_LOG_2)*row + column] = this.matr_val;
                    randomize(matr_val);
                    this.matRSW [(2**MATRIX_DIMENSION_LOG_2)*row + column] = 0;
                    this.matRHW [(2**MATRIX_DIMENSION_LOG_2)*row + column] = 0;
                end
            end
        end
    endtask
    
    task mult_matr();
        begin
            int count = 0;
            int row = 0;
            int column = 0;
            // multiply the matrices for comparison with hardware result
            for (row = 0; row < 2**MATRIX_DIMENSION_LOG_2; row = row + 1)
                for (column = 0; column < 2**MATRIX_DIMENSION_LOG_2; column = column + 1)
                    for (count = 0; count < 2**MATRIX_DIMENSION_LOG_2; count = count + 1)
                        this.matRSW [(2**MATRIX_DIMENSION_LOG_2)*row + column] = this.matRSW [(2**MATRIX_DIMENSION_LOG_2)*row + column] + this.matA [(2**MATRIX_DIMENSION_LOG_2)*row + count] * this.matB [(2**MATRIX_DIMENSION_LOG_2)*count + column];
            #20
            s00_axi_aresetn = 1;
            count = 0;
        end     
    endtask
    
    task send_and_rec_matr();
        begin
            int count = 0;
            int row = 0;
            int column = 0;
                    // send the two matrices using the AXI Stream protocol
            repeat (2) begin
                #20
                s00_axis_tvalid = 1;
                for (row = 0; row < 2**MATRIX_DIMENSION_LOG_2; row = row + 1) begin
                    for (column = 0; column < 2**MATRIX_DIMENSION_LOG_2; column = column + 1) begin
                        // Should use non-blocking assignment here
                        s00_axis_tdata <= (sel == 0) ? this.matA [(2**MATRIX_DIMENSION_LOG_2)*row + column] : this.matB [(2**MATRIX_DIMENSION_LOG_2)*row + column];
                        
                        // set the last signal when sending the last data item
                        if (row == 2**MATRIX_DIMENSION_LOG_2 - 1 && column == 2**MATRIX_DIMENSION_LOG_2 - 1)
                            s00_axis_tlast = 1;
                        #20;
                        
                        // wait until the slave is ready to read the data
                        while (!s00_axis_tready) begin
                            #20;
                        end
                    end
                end
                
                s00_axis_tlast = 0;
                s00_axis_tvalid = 0;
                
                // send the other matrix
                sel = 1;
            end
            // start the accelerator
            #20
            start = 1;
            #20
            start = 0;
            
            // wait for the reslt to arrive from the accelerator
            m00_axis_tready = 1;
            
            row = 0;
            column = 0;
            
            while (!m00_axis_tlast) begin // exit if last data already received
                #20;
                if (m00_axis_tvalid == 1) begin // valid data on the bus
                    this.matRHW [(2**MATRIX_DIMENSION_LOG_2)*row + column] = m00_axis_tdata;
                    column = column + 1;
                    //assert something?
                end
                if (column == 2**MATRIX_DIMENSION_LOG_2) begin
                    column = 0;
                    row = row + 1;
                end
            end
            assert(!m00_axis_tlast); //for the concurrent assertion req, and the fsm one
        end
    endtask
    
    task comp_matr();
        begin
            // compare the hardware and software results
            for (row = 0; row < 2**MATRIX_DIMENSION_LOG_2; row = row + 1)
                for (column = 0; column < 2**MATRIX_DIMENSION_LOG_2; column = column + 1)
                    if (this.matRSW [(2**MATRIX_DIMENSION_LOG_2)*row + column] != this.matRHW [(2**MATRIX_DIMENSION_LOG_2)*row + column] 
                         || ^this.matRHW [(2**MATRIX_DIMENSION_LOG_2)*row + column] === 1'bX) begin
                        count = count + 1;
                        $display ("HW/SW result mismatch! A[%d][%d]=%d; B[%d][%d]=%d; res_sw=%d; res_hw=%d", row, column, this.matA[(2**MATRIX_DIMENSION_LOG_2)*row + column], 
                                                                                                             row, column, this.matB[(2**MATRIX_DIMENSION_LOG_2)*row + column], 
                                                                                                             this.matRSW[(2**MATRIX_DIMENSION_LOG_2)*row + column], 
                                                                                                             this.matRHW[(2**MATRIX_DIMENSION_LOG_2)*row + column]);
                    end
           if (count == 0)
                $display ("HW/SW result match!");
           
           $stop;
       end
    endtask
    
endclass

    reg  s00_axi_aclk;
    reg  s00_axi_aresetn;

    // Ports of Axi Slave Bus Interface S00_AXIS
    wire  s00_axis_tready;
    reg [DATA_WIDTH-1 : 0] s00_axis_tdata;
    reg [(DATA_WIDTH/8)-1 : 0] s00_axis_tstrb;
    reg  s00_axis_tlast;
    reg  s00_axis_tvalid;

    // Ports of Axi Master Bus Interface M00_AXIS
    wire  m00_axis_tvalid;
    wire [DATA_WIDTH-1 : 0] m00_axis_tdata;
    wire [(DATA_WIDTH/8)-1 : 0] m00_axis_tstrb;
    wire  m00_axis_tlast;
    reg  m00_axis_tready;
    
    reg sel;
    reg start;
    
    tb new_test;
    
    integer row;
    integer column;
    integer count;
    
    integer matA [0 : (2**MATRIX_DIMENSION_LOG_2)**2-1];
    integer matB [0 : (2**MATRIX_DIMENSION_LOG_2)**2-1];
    integer matRSW [0 : (2**MATRIX_DIMENSION_LOG_2)**2-1];
    integer matRHW [0 : (2**MATRIX_DIMENSION_LOG_2)**2-1];
    
    mat_mul # (
    .DIM_LOG(MATRIX_DIMENSION_LOG_2),
    .DATA_WIDTH(DATA_WIDTH)
    ) accelerator (
    .s00_axi_aclk(s00_axi_aclk),
    .s00_axi_aresetn(s00_axi_aresetn),
    .s00_axis_tready(s00_axis_tready),
    .s00_axis_tdata(s00_axis_tdata),
    .s00_axis_tlast(s00_axis_tlast),
    .s00_axis_tvalid(s00_axis_tvalid),
    .m00_axis_tvalid(m00_axis_tvalid),
    .m00_axis_tdata(m00_axis_tdata),
    .m00_axis_tstrb(m00_axis_tstrb),
    .m00_axis_tlast(m00_axis_tlast),
    .m00_axis_tready(m00_axis_tready),
    .sel(sel),
    .start(start)
    );
    
    always
        #10 s00_axi_aclk = ~s00_axi_aclk;
        
    initial begin
        s00_axi_aclk = 1;
        s00_axi_aresetn = 0;
        s00_axis_tdata = 0;
        s00_axis_tstrb = 4'hf;
        s00_axis_tlast = 0;
        s00_axis_tvalid = 0;
        m00_axis_tready = 0;
        sel = 0;
        start = 0;
        row = 0;
        column = 0;
        count = 0;
        new_test = new;
        new_test.matr_init();
        new_test.mult_matr();
        new_test.send_and_rec_matr();
        new_test.comp_matr();

    
        m00_axis_tready = 0;
        count = 0;

    end
    
endmodule

//rand bit [3:0] addr; (randc is the same but without repititions)
//assert (A == C); 
//  $display("some error"); is the syntax for assertions
//  can use else with assert (must be tabbed to same is display

