`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// mat_mul.v
//
// Uppsala University
// Yuan Yao <yuan.yao@it.uu.se>
// For the course 1DT109 Accelerating System with Programmable Logic Components
//
//////////////////////////////////////////////////////////////////////////////////


module mat_mul #
    (
        parameter integer DIM_LOG = 1,     /* matrix dimension in log2; e.g. A[8][8] has the DIM of 8, DIM_LOG of 3, and SIZE of 64; change this as desired;
                                              you will need to set this parameter in the testbench and the ARM software in the SDK. */
        parameter integer DIM = 2**DIM_LOG,
        parameter integer SIZE = DIM*DIM,
        parameter integer SIZE_LOG = 2*DIM_LOG,
        parameter integer DATA_WIDTH = 32
    )
    (
        // Clock and Reset shared with the AXI-Lite Slave Port
        input wire  s00_axi_aclk,
        input wire  s00_axi_aresetn,
        
        // AXI-Stream Slave
        output wire  s00_axis_tready,
        input  wire  [DATA_WIDTH-1 : 0] s00_axis_tdata,
        input  wire  s00_axis_tlast,
        input  wire  s00_axis_tvalid,
        
        // AXI-Stream Master
        output wire  m00_axis_tvalid,
        output wire  [DATA_WIDTH-1 : 0] m00_axis_tdata,
        output wire  [(DATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
        output wire  m00_axis_tlast,
        input  wire  m00_axis_tready,
        
        // Matrix-select and Start signals coming from the AXI-Lite Slave Port
        input wire sel,
        input wire start
    );

//TODO


wire en_A;
wire en_B;
wire en_R;
wire rw_A;
wire rw_B;
wire rw_R;
wire [SIZE_LOG-1 : 0] addr_A;
wire [SIZE_LOG-1 : 0] addr_B;
wire [SIZE_LOG-1 : 0] addr_R;
/*
input wire [DATA_WIDTH-1 : 0] data_A,
input wire [DATA_WIDTH-1 : 0] data_B,
output wire [DATA_WIDTH-1 : 0] data_R
*/
//wire [DATA_WIDTH-1 : 0] data_A_in;
//wire [DATA_WIDTH-1 : 0] data_B_in;
//wire [DATA_WIDTH-1 : 0] data_R_in;
wire [DATA_WIDTH-1 : 0] data_A_out;
wire [DATA_WIDTH-1 : 0] data_B_out;
wire [DATA_WIDTH-1 : 0] data_R_out;
wire [DATA_WIDTH-1 : 0] data_R_mac;

//reg s_tready;
//reg m_axis_tvalid;
//reg  [DATA_WIDTH-1 : 0] m_axis_tdata;
/*
initial begin
    s_tready <= 1'b0;
    m_axis_tvalid <= 1'b0;
end

assign s00_axis_tready = s_tready;
assign m00_axis_tvalid = m_axis_tvalid;
*/

AGU matr_agu (  .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .s00_axis_tready (s00_axis_tready),
                .s00_axis_tlast (s00_axis_tlast),
                .s00_axis_tvalid (s00_axis_tvalid),
                .m00_axis_tvalid (m00_axis_tvalid),
                .m00_axis_tlast (m00_axis_tlast),
                .m00_axis_tready (m00_axis_tready),
                .sel (sel),
                .start (start),
                .en_A (en_A),
                .en_B (en_B),
                .en_R (en_R),
                .rw_A (rw_A),
                .rw_B (rw_B),
                .rw_R (rw_R),
                .addr_A (addr_A),
                .addr_B (addr_B),
                .addr_R (addr_R)
            );

bram MatrA (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_A),
                .rw (rw_A),
                .addr (addr_A),
                .data_in (m00_axis_tdata),
                .data_out (data_A_out)
            );
bram MatrB (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_B),
                .rw (rw_B),
                .addr (addr_B),
                .data_in (m00_axis_tdata),
                .data_out (data_B_out)
            );
bram MatrR (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_R),
                .rw (rw_R),
                .addr (addr_R),
                .data_in (data_R_mac),
                .data_out (data_R_out)
            );



MAC matr_mac (  .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .data_A (data_A_out),
                .data_B (data_B_out),
                .data_R (data_R_mac)
             ); //missing connections where the data comes in


endmodule

module bram #
(
    parameter integer DIM_LOG = 1,
    parameter integer DIM = 2**DIM_LOG,
    parameter integer SIZE = DIM*DIM,
    parameter integer SIZE_LOG = 2*DIM_LOG,
    parameter integer DATA_WIDTH = 32
)
(
    input wire s00_axi_aclk,
    input wire s00_axi_aresetn,  
    input wire en,
    input wire rw, //read = 0, write = 1
    input wire [SIZE_LOG-1 : 0] addr,
    input wire [DATA_WIDTH-1 : 0] data_in,
    output reg [DATA_WIDTH-1 : 0] data_out
);

//TODO
//I would think I'd need one of these for each matr?
//data_out[addr] = data_in
reg [(DATA_WIDTH-1) * SIZE: 0] data_local;
integer i;
initial begin
    data_out = DATA_WIDTH-1'b0000000000000000000000000000000;
    for (i = 0; i < (DATA_WIDTH-1) * SIZE; i = i + 1) begin
      data_local[i] <= 1'b0;    //initialize local data to 0
    end
end


//keep in mind, data_width holds 4 numbers, so addr is always 0-3, and data_in/out is an array of 4 ints
always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (en == 1) begin
        if (rw == 1) begin
            data_local[addr] = data_in;
        end else begin
            data_out = data_local[addr];
        end
    end
    if (s00_axi_aresetn == 0) begin
        for (i = 0; i < (DATA_WIDTH-1) * SIZE; i = i + 1) begin
          data_local[i] <= 1'b0;    //initialize local data to 0
        end
        data_out = DATA_WIDTH-1'b0000000000000000000000000000000;
    end
end
endmodule

module MAC #
(
    parameter integer DIM_LOG = 1,
    parameter integer DIM = 2**DIM_LOG,
    parameter integer SIZE = DIM*DIM,
    parameter integer SIZE_LOG = 2*DIM_LOG,
    parameter integer DATA_WIDTH = 32
)
(
    input wire s00_axi_aclk,
    input wire s00_axi_aresetn,
    input wire clear, //not used I think
    input wire [DATA_WIDTH-1 : 0] data_A,
    input wire [DATA_WIDTH-1 : 0] data_B,
    output wire [DATA_WIDTH-1 : 0] data_R
);

reg [DATA_WIDTH-1 : 0] data_Result;
initial begin
    data_Result = DATA_WIDTH-1'b0000000000000000000000000000000;
end
assign data_R = data_Result;

always @ (clear) begin
    if (clear == 1'b1) begin
        data_Result = DATA_WIDTH-1'b0000000000000000000000000000000;
    end
end

always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (s00_axi_aresetn == 1'b0) begin
        //reset all registers... none are here though
    end else begin
        data_Result = (data_A * data_B) + data_Result;
    end
end
endmodule

module AGU #
(
    parameter integer DIM_LOG = 1,
    parameter integer DIM = 2**DIM_LOG,
    parameter integer SIZE = DIM*DIM,
    parameter integer SIZE_LOG = 2*DIM_LOG,
    parameter integer DATA_WIDTH = 32
)
(
    input wire  s00_axi_aclk,
    input wire  s00_axi_aresetn,
    
    // AXI-Stream Slave
    output reg  s00_axis_tready,
    input wire  s00_axis_tlast, //what is tlast??
    input wire  s00_axis_tvalid,
        
    // AXI-Stream Master
    output reg  m00_axis_tvalid,
    output reg  m00_axis_tlast,
    input wire  m00_axis_tready,
    
    input wire sel,
    input wire start,
    
    output reg en_A,
    output reg en_B,
    output reg en_R,
    output reg rw_A,
    output reg rw_B,
    output reg rw_R,
    output reg [SIZE_LOG-1 : 0] addr_A,
    output reg [SIZE_LOG-1 : 0] addr_B,
    output reg [SIZE_LOG-1 : 0] addr_R
);

//TODO

integer State; //start at 0
integer i;
initial begin
    State <= 0;
    m00_axis_tvalid <= 1'b0;
    m00_axis_tlast <= 1'b0;
    s00_axis_tready <= 1'b0;
    for (i = 0; i < SIZE_LOG-1; i = i + 1) begin
      addr_A[i] <= 1'b0;
      addr_B[i] <= 1'b0;
      addr_R[i] <= 1'b0;
    end
end

integer S_IDLE = 0;
integer S_LOAD_A = 1;
integer S_LOAD_B = 2;
integer S_CALCULATE = 3;
integer S_OUTPUT = 4;

always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (s00_axi_aresetn == 0) begin
        //reset all
    end else begin       
        case (State)
            S_IDLE : begin
                    if (s00_axis_tvalid == 1'b1) begin
                        State = S_LOAD_A;
                        s00_axis_tready = 1'b1; //start teh AXI stream of data
                    end
                end
            S_LOAD_A : begin 
                    en_A = 1'b1;
                    rw_A = 1'b1;
                    addr_A = addr_A + 1;
                    if (addr_A >= SIZE) begin
                        for (i = 0; i < SIZE_LOG-1; i = i + 1) begin
                          addr_A[i] <= 1'b0;
                        end
                        State = S_LOAD_B;
                    end
                end
            S_LOAD_B : begin
                    en_B = 1'b1;
                    rw_B = 1'b1;
                    addr_B = addr_B + 1;
                    if (addr_B >= SIZE) begin
                        for (i = 0; i < SIZE_LOG-1; i = i + 1) begin
                          addr_B[i] <= 1'b0;
                        end
                        State = S_CALCULATE;
                        s00_axis_tready = 1'b0; //stop the stream
                    end
                end
            S_CALCULATE : begin
                    //This is where we send things to MAC
                end
            S_OUTPUT : begin
                
                end
        endcase
    end
end

endmodule
