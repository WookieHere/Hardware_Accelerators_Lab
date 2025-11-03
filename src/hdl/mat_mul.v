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
/*    output reg en_A,
    output reg en_B,
    output reg en_R,
    output reg rw_A,
    output reg rw_B,
    output reg rw_R,
    output reg [SIZE_LOG-1 : 0] addr_A,
    output reg [SIZE_LOG-1 : 0] addr_B,
    output reg [SIZE_LOG-1 : 0] addr_R
    */
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
wire [DATA_WIDTH-1 : 0] data_A_in;
wire [DATA_WIDTH-1 : 0] data_B_in;
wire [DATA_WIDTH-1 : 0] data_R_in;
wire [DATA_WIDTH-1 : 0] data_A_out;
wire [DATA_WIDTH-1 : 0] data_B_out;
wire [DATA_WIDTH-1 : 0] data_R_out;



AGU matr_agu (  .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .s00_axis_tlast (s00_axis_tlast),
                .s00_axis_tvalid (s00_axis_tlast),
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
            ); //none of the outputs are mapped yet...

bram MatrA (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_A),
                .rw (rw_A),
                .addr (addr_A),
                .data_in (data_A_in),
                .data_out (data_A_out)
            );
bram MatrB (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_B),
                .rw (rw_B),
                .addr (addr_B),
                .data_in (data_B_in),
                .data_out (data_B_out)
            );
bram MatrR (    .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn),
                .en (en_R),
                .rw (rw_R),
                .addr (addr_R),
                .data_in (data_R_in),
                .data_out (data_R_out)
            );



MAC matr_mac (  .s00_axi_aclk (s00_axi_aclk),
                .s00_axi_aresetn (s00_axi_aresetn)
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

//keep in mind, data_width holds 4 numbers, so addr is always 0-3, and data_in/out is an array of 4 ints
always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (en == 1) begin
        if (rw == 1) begin
            //write data_in to data_out
        end else begin
            //simply read data_out[addr]
        end
    end
    if (s00_axi_aresetn == 1) begin
        //reset all registers
        //data_out = DATA_WIDTH-1'0000000000000000000000000000000;
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
    input wire clear, 
    input wire [DATA_WIDTH-1 : 0] data_A,
    input wire [DATA_WIDTH-1 : 0] data_B,
    output wire [DATA_WIDTH-1 : 0] data_R
);

//TODO
integer A;
integer B;
integer R;
integer Temp;

assign data_A = A; //may need to get indexes/partial data if the matricies are big
assign data_B = B;
assign data_R = R;
assign data_R = Temp;


always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (s00_axi_aresetn == 1) begin
        //reset everything... No registers are present though?
    end else begin
        //do the MAC
        // R = (A * B) + R
        R = (A * B) + Temp;
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

integer State = 0; //start at 0

//states:
/*
S_IDLE: The idle state. All controlling signals reset to default.

S_LOAD_A: Load matrix A from the AXI stream bus. This state should
    generate controlling signals for the AXI stream slave interface in Figure 2 as
    well as addresses for matA during matrix loading.
        Why should we generate address on the slave-side when loading
        matries using AXI-stream interface?

S_LOAD_B: Load matrix B from the AXI stream bus. Again, this state should
    generate controlling signals for the AXI stream slave interface in Figure 2 as
    well as address for matB during matrix loading.
        The AXI-stream is a streaming bus. In order to fully use that property,
        what kind of addresses should you generate in state S_LOAD_A and
        S_LOAD_B?
S_CALCULATE: Launch matrix calculation. Read all operands loaded in matA
    and matB and write results to matR.
        What kind of addresses should you generate in S_CALCULATE?
S_OUTPUT: Output matR to the AXI stream master interface in Figure 2 after
    the whole matrix multiplication is done.
        Why should we output matR only after the whole matrix multiplication
        is done? Why should not we output partial results in matR on the fly
*/

integer S_IDLE = 0;
integer S_LOAD_A = 1;
integer S_LOAD_B = 2;
integer S_CALCULATE = 3;
integer S_OUTPUT = 4;

//AXI slave states:
// TREADY = 0: Busy
// TREADY = 1, TVALID = 0: Stop
// TREADY = 1, TVALID = 1; Recieve

//AXI master states:
// TVALID = 0: Waiting Data
// TVALID = 1, TREADY = 0: Stop
// TVALID = 1, TREADY = 1; Send

always @ (s00_axi_aclk, s00_axi_aresetn) begin
    if (s00_axi_aresetn == 1) begin
        //reset everything
    end else begin
        //Cycle AGU
        //set State first?
        case (State)
            S_IDLE : begin
                s00_axis_tready = 1; //say we are ready to recieve data
                end
            S_LOAD_A : begin 
                    if (s00_axis_tvalid == 1) begin
                        //lead values into A
                        //send data + addr pairs to bram somehow
                    end
                end
            S_LOAD_B : begin
                    //similar to LOAD_A
                end
            S_CALCULATE : begin
                    //This is where we send things to MAC
                end
            S_OUTPUT : //do idle
        endcase
    end
end

endmodule
