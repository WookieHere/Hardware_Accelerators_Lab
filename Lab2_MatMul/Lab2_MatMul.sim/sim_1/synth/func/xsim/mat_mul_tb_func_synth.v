// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
// Date        : Tue Nov  4 04:50:33 2025
// Host        : luke-MS-7E57 running 64-bit Linux Mint 22.1
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/luke/Vivado_Bunker/Lab_2/Lab2_handout/Lab2_MatMul/Lab2_MatMul.sim/sim_1/synth/func/xsim/mat_mul_tb_func_synth.v
// Design      : MatMul_v1_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AGU
   (s00_axis_tready_OBUF,
    s00_axis_tvalid_IBUF,
    s00_axi_aresetn_IBUF);
  output s00_axis_tready_OBUF;
  input s00_axis_tvalid_IBUF;
  input s00_axi_aresetn_IBUF;

  wire [0:0]State;
  wire s00_axi_aresetn_IBUF;
  wire s00_axis_tready0_out;
  wire s00_axis_tready_OBUF;
  wire s00_axis_tvalid_IBUF;

  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    \State_reg[0] 
       (.CLR(1'b0),
        .D(1'b1),
        .G(s00_axis_tready0_out),
        .GE(1'b1),
        .Q(State));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:GE GND:CLR" *) 
  LDCE #(
    .INIT(1'b0)) 
    s00_axis_tready_reg
       (.CLR(1'b0),
        .D(s00_axis_tvalid_IBUF),
        .G(s00_axis_tready0_out),
        .GE(1'b1),
        .Q(s00_axis_tready_OBUF));
  LUT3 #(
    .INIT(8'h20)) 
    s00_axis_tready_reg_i_1
       (.I0(s00_axi_aresetn_IBUF),
        .I1(State),
        .I2(s00_axis_tvalid_IBUF),
        .O(s00_axis_tready0_out));
endmodule

(* C_M00_AXIS_START_COUNT = "32" *) (* C_M00_AXIS_TDATA_WIDTH = "32" *) (* C_S00_AXIS_TDATA_WIDTH = "32" *) 
(* C_S00_AXI_ADDR_WIDTH = "4" *) (* C_S00_AXI_DATA_WIDTH = "32" *) (* MATRIX_DATA_WIDTH = "32" *) 
(* MATRIX_DIMENSION_LOG_2 = "1" *) 
(* NotValidForBitStream *)
module MatMul_v1_0
   (s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready,
    s00_axis_aclk,
    s00_axis_aresetn,
    s00_axis_tready,
    s00_axis_tdata,
    s00_axis_tstrb,
    s00_axis_tlast,
    s00_axis_tvalid,
    m00_axis_aclk,
    m00_axis_aresetn,
    m00_axis_tvalid,
    m00_axis_tdata,
    m00_axis_tstrb,
    m00_axis_tlast,
    m00_axis_tready);
  input s00_axi_aclk;
  input s00_axi_aresetn;
  input [3:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [3:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axis_aclk;
  input s00_axis_aresetn;
  output s00_axis_tready;
  input [31:0]s00_axis_tdata;
  input [3:0]s00_axis_tstrb;
  input s00_axis_tlast;
  input s00_axis_tvalid;
  input m00_axis_aclk;
  input m00_axis_aresetn;
  output m00_axis_tvalid;
  output [31:0]m00_axis_tdata;
  output [3:0]m00_axis_tstrb;
  output m00_axis_tlast;
  input m00_axis_tready;

  wire [31:0]m00_axis_tdata;
  wire m00_axis_tlast;
  wire [3:0]m00_axis_tstrb;
  wire m00_axis_tvalid;
  wire s00_axi_aclk;
  wire s00_axi_aclk_IBUF;
  wire s00_axi_aclk_IBUF_BUFG;
  wire [3:0]s00_axi_araddr;
  wire [3:2]s00_axi_araddr_IBUF;
  wire s00_axi_aresetn;
  wire s00_axi_aresetn_IBUF;
  wire s00_axi_arready;
  wire s00_axi_arready_OBUF;
  wire s00_axi_arvalid;
  wire s00_axi_arvalid_IBUF;
  wire [3:0]s00_axi_awaddr;
  wire [3:2]s00_axi_awaddr_IBUF;
  wire s00_axi_awready;
  wire s00_axi_awready_OBUF;
  wire s00_axi_awvalid;
  wire s00_axi_awvalid_IBUF;
  wire s00_axi_bready;
  wire s00_axi_bready_IBUF;
  wire [1:0]s00_axi_bresp;
  wire s00_axi_bvalid;
  wire s00_axi_bvalid_OBUF;
  wire [31:0]s00_axi_rdata;
  wire [31:0]s00_axi_rdata_OBUF;
  wire s00_axi_rready;
  wire s00_axi_rready_IBUF;
  wire [1:0]s00_axi_rresp;
  wire s00_axi_rvalid;
  wire s00_axi_rvalid_OBUF;
  wire [31:0]s00_axi_wdata;
  wire [31:0]s00_axi_wdata_IBUF;
  wire s00_axi_wready;
  wire s00_axi_wready_OBUF;
  wire [3:0]s00_axi_wstrb;
  wire [3:0]s00_axi_wstrb_IBUF;
  wire s00_axi_wvalid;
  wire s00_axi_wvalid_IBUF;
  wire s00_axis_tready;
  wire s00_axis_tready_OBUF;
  wire s00_axis_tvalid;
  wire s00_axis_tvalid_IBUF;

  MatMul_v1_0_S00_AXI MatMul_v1_0_S00_AXI_inst
       (.CLK(s00_axi_aclk_IBUF_BUFG),
        .D(s00_axi_araddr_IBUF),
        .Q(s00_axi_rdata_OBUF),
        .\axi_awaddr_reg[3]_0 (s00_axi_awaddr_IBUF),
        .s00_axi_aresetn_IBUF(s00_axi_aresetn_IBUF),
        .s00_axi_arready_OBUF(s00_axi_arready_OBUF),
        .s00_axi_arvalid_IBUF(s00_axi_arvalid_IBUF),
        .s00_axi_awready_OBUF(s00_axi_awready_OBUF),
        .s00_axi_awvalid_IBUF(s00_axi_awvalid_IBUF),
        .s00_axi_bready_IBUF(s00_axi_bready_IBUF),
        .s00_axi_bvalid_OBUF(s00_axi_bvalid_OBUF),
        .s00_axi_rready_IBUF(s00_axi_rready_IBUF),
        .s00_axi_rvalid_OBUF(s00_axi_rvalid_OBUF),
        .s00_axi_wready_OBUF(s00_axi_wready_OBUF),
        .s00_axi_wstrb_IBUF(s00_axi_wstrb_IBUF),
        .s00_axi_wvalid_IBUF(s00_axi_wvalid_IBUF),
        .\slv_reg1_reg[31]_0 (s00_axi_wdata_IBUF));
  mat_mul accelerator
       (.s00_axi_aresetn_IBUF(s00_axi_aresetn_IBUF),
        .s00_axis_tready_OBUF(s00_axis_tready_OBUF),
        .s00_axis_tvalid_IBUF(s00_axis_tvalid_IBUF));
  OBUF \m00_axis_tdata_OBUF[0]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[0]));
  OBUFT \m00_axis_tdata_OBUF[10]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[10]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[11]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[11]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[12]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[12]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[13]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[13]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[14]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[14]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[15]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[15]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[16]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[16]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[17]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[17]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[18]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[18]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[19]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[19]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[1]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[1]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[20]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[20]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[21]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[21]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[22]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[22]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[23]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[23]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[24]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[24]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[25]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[25]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[26]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[26]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[27]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[27]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[28]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[28]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[29]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[29]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[2]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[2]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[30]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[30]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[31]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[31]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[3]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[3]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[4]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[4]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[5]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[5]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[6]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[6]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[7]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[7]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[8]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[8]),
        .T(1'b1));
  OBUFT \m00_axis_tdata_OBUF[9]_inst 
       (.I(1'b0),
        .O(m00_axis_tdata[9]),
        .T(1'b1));
  OBUF m00_axis_tlast_OBUF_inst
       (.I(1'b0),
        .O(m00_axis_tlast));
  OBUFT \m00_axis_tstrb_OBUF[0]_inst 
       (.I(1'b0),
        .O(m00_axis_tstrb[0]),
        .T(1'b1));
  OBUFT \m00_axis_tstrb_OBUF[1]_inst 
       (.I(1'b0),
        .O(m00_axis_tstrb[1]),
        .T(1'b1));
  OBUFT \m00_axis_tstrb_OBUF[2]_inst 
       (.I(1'b0),
        .O(m00_axis_tstrb[2]),
        .T(1'b1));
  OBUFT \m00_axis_tstrb_OBUF[3]_inst 
       (.I(1'b0),
        .O(m00_axis_tstrb[3]),
        .T(1'b1));
  OBUF m00_axis_tvalid_OBUF_inst
       (.I(1'b0),
        .O(m00_axis_tvalid));
  BUFG s00_axi_aclk_IBUF_BUFG_inst
       (.I(s00_axi_aclk_IBUF),
        .O(s00_axi_aclk_IBUF_BUFG));
  IBUF s00_axi_aclk_IBUF_inst
       (.I(s00_axi_aclk),
        .O(s00_axi_aclk_IBUF));
  IBUF \s00_axi_araddr_IBUF[2]_inst 
       (.I(s00_axi_araddr[2]),
        .O(s00_axi_araddr_IBUF[2]));
  IBUF \s00_axi_araddr_IBUF[3]_inst 
       (.I(s00_axi_araddr[3]),
        .O(s00_axi_araddr_IBUF[3]));
  IBUF s00_axi_aresetn_IBUF_inst
       (.I(s00_axi_aresetn),
        .O(s00_axi_aresetn_IBUF));
  OBUF s00_axi_arready_OBUF_inst
       (.I(s00_axi_arready_OBUF),
        .O(s00_axi_arready));
  IBUF s00_axi_arvalid_IBUF_inst
       (.I(s00_axi_arvalid),
        .O(s00_axi_arvalid_IBUF));
  IBUF \s00_axi_awaddr_IBUF[2]_inst 
       (.I(s00_axi_awaddr[2]),
        .O(s00_axi_awaddr_IBUF[2]));
  IBUF \s00_axi_awaddr_IBUF[3]_inst 
       (.I(s00_axi_awaddr[3]),
        .O(s00_axi_awaddr_IBUF[3]));
  OBUF s00_axi_awready_OBUF_inst
       (.I(s00_axi_awready_OBUF),
        .O(s00_axi_awready));
  IBUF s00_axi_awvalid_IBUF_inst
       (.I(s00_axi_awvalid),
        .O(s00_axi_awvalid_IBUF));
  IBUF s00_axi_bready_IBUF_inst
       (.I(s00_axi_bready),
        .O(s00_axi_bready_IBUF));
  OBUF \s00_axi_bresp_OBUF[0]_inst 
       (.I(1'b0),
        .O(s00_axi_bresp[0]));
  OBUF \s00_axi_bresp_OBUF[1]_inst 
       (.I(1'b0),
        .O(s00_axi_bresp[1]));
  OBUF s00_axi_bvalid_OBUF_inst
       (.I(s00_axi_bvalid_OBUF),
        .O(s00_axi_bvalid));
  OBUF \s00_axi_rdata_OBUF[0]_inst 
       (.I(s00_axi_rdata_OBUF[0]),
        .O(s00_axi_rdata[0]));
  OBUF \s00_axi_rdata_OBUF[10]_inst 
       (.I(s00_axi_rdata_OBUF[10]),
        .O(s00_axi_rdata[10]));
  OBUF \s00_axi_rdata_OBUF[11]_inst 
       (.I(s00_axi_rdata_OBUF[11]),
        .O(s00_axi_rdata[11]));
  OBUF \s00_axi_rdata_OBUF[12]_inst 
       (.I(s00_axi_rdata_OBUF[12]),
        .O(s00_axi_rdata[12]));
  OBUF \s00_axi_rdata_OBUF[13]_inst 
       (.I(s00_axi_rdata_OBUF[13]),
        .O(s00_axi_rdata[13]));
  OBUF \s00_axi_rdata_OBUF[14]_inst 
       (.I(s00_axi_rdata_OBUF[14]),
        .O(s00_axi_rdata[14]));
  OBUF \s00_axi_rdata_OBUF[15]_inst 
       (.I(s00_axi_rdata_OBUF[15]),
        .O(s00_axi_rdata[15]));
  OBUF \s00_axi_rdata_OBUF[16]_inst 
       (.I(s00_axi_rdata_OBUF[16]),
        .O(s00_axi_rdata[16]));
  OBUF \s00_axi_rdata_OBUF[17]_inst 
       (.I(s00_axi_rdata_OBUF[17]),
        .O(s00_axi_rdata[17]));
  OBUF \s00_axi_rdata_OBUF[18]_inst 
       (.I(s00_axi_rdata_OBUF[18]),
        .O(s00_axi_rdata[18]));
  OBUF \s00_axi_rdata_OBUF[19]_inst 
       (.I(s00_axi_rdata_OBUF[19]),
        .O(s00_axi_rdata[19]));
  OBUF \s00_axi_rdata_OBUF[1]_inst 
       (.I(s00_axi_rdata_OBUF[1]),
        .O(s00_axi_rdata[1]));
  OBUF \s00_axi_rdata_OBUF[20]_inst 
       (.I(s00_axi_rdata_OBUF[20]),
        .O(s00_axi_rdata[20]));
  OBUF \s00_axi_rdata_OBUF[21]_inst 
       (.I(s00_axi_rdata_OBUF[21]),
        .O(s00_axi_rdata[21]));
  OBUF \s00_axi_rdata_OBUF[22]_inst 
       (.I(s00_axi_rdata_OBUF[22]),
        .O(s00_axi_rdata[22]));
  OBUF \s00_axi_rdata_OBUF[23]_inst 
       (.I(s00_axi_rdata_OBUF[23]),
        .O(s00_axi_rdata[23]));
  OBUF \s00_axi_rdata_OBUF[24]_inst 
       (.I(s00_axi_rdata_OBUF[24]),
        .O(s00_axi_rdata[24]));
  OBUF \s00_axi_rdata_OBUF[25]_inst 
       (.I(s00_axi_rdata_OBUF[25]),
        .O(s00_axi_rdata[25]));
  OBUF \s00_axi_rdata_OBUF[26]_inst 
       (.I(s00_axi_rdata_OBUF[26]),
        .O(s00_axi_rdata[26]));
  OBUF \s00_axi_rdata_OBUF[27]_inst 
       (.I(s00_axi_rdata_OBUF[27]),
        .O(s00_axi_rdata[27]));
  OBUF \s00_axi_rdata_OBUF[28]_inst 
       (.I(s00_axi_rdata_OBUF[28]),
        .O(s00_axi_rdata[28]));
  OBUF \s00_axi_rdata_OBUF[29]_inst 
       (.I(s00_axi_rdata_OBUF[29]),
        .O(s00_axi_rdata[29]));
  OBUF \s00_axi_rdata_OBUF[2]_inst 
       (.I(s00_axi_rdata_OBUF[2]),
        .O(s00_axi_rdata[2]));
  OBUF \s00_axi_rdata_OBUF[30]_inst 
       (.I(s00_axi_rdata_OBUF[30]),
        .O(s00_axi_rdata[30]));
  OBUF \s00_axi_rdata_OBUF[31]_inst 
       (.I(s00_axi_rdata_OBUF[31]),
        .O(s00_axi_rdata[31]));
  OBUF \s00_axi_rdata_OBUF[3]_inst 
       (.I(s00_axi_rdata_OBUF[3]),
        .O(s00_axi_rdata[3]));
  OBUF \s00_axi_rdata_OBUF[4]_inst 
       (.I(s00_axi_rdata_OBUF[4]),
        .O(s00_axi_rdata[4]));
  OBUF \s00_axi_rdata_OBUF[5]_inst 
       (.I(s00_axi_rdata_OBUF[5]),
        .O(s00_axi_rdata[5]));
  OBUF \s00_axi_rdata_OBUF[6]_inst 
       (.I(s00_axi_rdata_OBUF[6]),
        .O(s00_axi_rdata[6]));
  OBUF \s00_axi_rdata_OBUF[7]_inst 
       (.I(s00_axi_rdata_OBUF[7]),
        .O(s00_axi_rdata[7]));
  OBUF \s00_axi_rdata_OBUF[8]_inst 
       (.I(s00_axi_rdata_OBUF[8]),
        .O(s00_axi_rdata[8]));
  OBUF \s00_axi_rdata_OBUF[9]_inst 
       (.I(s00_axi_rdata_OBUF[9]),
        .O(s00_axi_rdata[9]));
  IBUF s00_axi_rready_IBUF_inst
       (.I(s00_axi_rready),
        .O(s00_axi_rready_IBUF));
  OBUF \s00_axi_rresp_OBUF[0]_inst 
       (.I(1'b0),
        .O(s00_axi_rresp[0]));
  OBUF \s00_axi_rresp_OBUF[1]_inst 
       (.I(1'b0),
        .O(s00_axi_rresp[1]));
  OBUF s00_axi_rvalid_OBUF_inst
       (.I(s00_axi_rvalid_OBUF),
        .O(s00_axi_rvalid));
  IBUF \s00_axi_wdata_IBUF[0]_inst 
       (.I(s00_axi_wdata[0]),
        .O(s00_axi_wdata_IBUF[0]));
  IBUF \s00_axi_wdata_IBUF[10]_inst 
       (.I(s00_axi_wdata[10]),
        .O(s00_axi_wdata_IBUF[10]));
  IBUF \s00_axi_wdata_IBUF[11]_inst 
       (.I(s00_axi_wdata[11]),
        .O(s00_axi_wdata_IBUF[11]));
  IBUF \s00_axi_wdata_IBUF[12]_inst 
       (.I(s00_axi_wdata[12]),
        .O(s00_axi_wdata_IBUF[12]));
  IBUF \s00_axi_wdata_IBUF[13]_inst 
       (.I(s00_axi_wdata[13]),
        .O(s00_axi_wdata_IBUF[13]));
  IBUF \s00_axi_wdata_IBUF[14]_inst 
       (.I(s00_axi_wdata[14]),
        .O(s00_axi_wdata_IBUF[14]));
  IBUF \s00_axi_wdata_IBUF[15]_inst 
       (.I(s00_axi_wdata[15]),
        .O(s00_axi_wdata_IBUF[15]));
  IBUF \s00_axi_wdata_IBUF[16]_inst 
       (.I(s00_axi_wdata[16]),
        .O(s00_axi_wdata_IBUF[16]));
  IBUF \s00_axi_wdata_IBUF[17]_inst 
       (.I(s00_axi_wdata[17]),
        .O(s00_axi_wdata_IBUF[17]));
  IBUF \s00_axi_wdata_IBUF[18]_inst 
       (.I(s00_axi_wdata[18]),
        .O(s00_axi_wdata_IBUF[18]));
  IBUF \s00_axi_wdata_IBUF[19]_inst 
       (.I(s00_axi_wdata[19]),
        .O(s00_axi_wdata_IBUF[19]));
  IBUF \s00_axi_wdata_IBUF[1]_inst 
       (.I(s00_axi_wdata[1]),
        .O(s00_axi_wdata_IBUF[1]));
  IBUF \s00_axi_wdata_IBUF[20]_inst 
       (.I(s00_axi_wdata[20]),
        .O(s00_axi_wdata_IBUF[20]));
  IBUF \s00_axi_wdata_IBUF[21]_inst 
       (.I(s00_axi_wdata[21]),
        .O(s00_axi_wdata_IBUF[21]));
  IBUF \s00_axi_wdata_IBUF[22]_inst 
       (.I(s00_axi_wdata[22]),
        .O(s00_axi_wdata_IBUF[22]));
  IBUF \s00_axi_wdata_IBUF[23]_inst 
       (.I(s00_axi_wdata[23]),
        .O(s00_axi_wdata_IBUF[23]));
  IBUF \s00_axi_wdata_IBUF[24]_inst 
       (.I(s00_axi_wdata[24]),
        .O(s00_axi_wdata_IBUF[24]));
  IBUF \s00_axi_wdata_IBUF[25]_inst 
       (.I(s00_axi_wdata[25]),
        .O(s00_axi_wdata_IBUF[25]));
  IBUF \s00_axi_wdata_IBUF[26]_inst 
       (.I(s00_axi_wdata[26]),
        .O(s00_axi_wdata_IBUF[26]));
  IBUF \s00_axi_wdata_IBUF[27]_inst 
       (.I(s00_axi_wdata[27]),
        .O(s00_axi_wdata_IBUF[27]));
  IBUF \s00_axi_wdata_IBUF[28]_inst 
       (.I(s00_axi_wdata[28]),
        .O(s00_axi_wdata_IBUF[28]));
  IBUF \s00_axi_wdata_IBUF[29]_inst 
       (.I(s00_axi_wdata[29]),
        .O(s00_axi_wdata_IBUF[29]));
  IBUF \s00_axi_wdata_IBUF[2]_inst 
       (.I(s00_axi_wdata[2]),
        .O(s00_axi_wdata_IBUF[2]));
  IBUF \s00_axi_wdata_IBUF[30]_inst 
       (.I(s00_axi_wdata[30]),
        .O(s00_axi_wdata_IBUF[30]));
  IBUF \s00_axi_wdata_IBUF[31]_inst 
       (.I(s00_axi_wdata[31]),
        .O(s00_axi_wdata_IBUF[31]));
  IBUF \s00_axi_wdata_IBUF[3]_inst 
       (.I(s00_axi_wdata[3]),
        .O(s00_axi_wdata_IBUF[3]));
  IBUF \s00_axi_wdata_IBUF[4]_inst 
       (.I(s00_axi_wdata[4]),
        .O(s00_axi_wdata_IBUF[4]));
  IBUF \s00_axi_wdata_IBUF[5]_inst 
       (.I(s00_axi_wdata[5]),
        .O(s00_axi_wdata_IBUF[5]));
  IBUF \s00_axi_wdata_IBUF[6]_inst 
       (.I(s00_axi_wdata[6]),
        .O(s00_axi_wdata_IBUF[6]));
  IBUF \s00_axi_wdata_IBUF[7]_inst 
       (.I(s00_axi_wdata[7]),
        .O(s00_axi_wdata_IBUF[7]));
  IBUF \s00_axi_wdata_IBUF[8]_inst 
       (.I(s00_axi_wdata[8]),
        .O(s00_axi_wdata_IBUF[8]));
  IBUF \s00_axi_wdata_IBUF[9]_inst 
       (.I(s00_axi_wdata[9]),
        .O(s00_axi_wdata_IBUF[9]));
  OBUF s00_axi_wready_OBUF_inst
       (.I(s00_axi_wready_OBUF),
        .O(s00_axi_wready));
  IBUF \s00_axi_wstrb_IBUF[0]_inst 
       (.I(s00_axi_wstrb[0]),
        .O(s00_axi_wstrb_IBUF[0]));
  IBUF \s00_axi_wstrb_IBUF[1]_inst 
       (.I(s00_axi_wstrb[1]),
        .O(s00_axi_wstrb_IBUF[1]));
  IBUF \s00_axi_wstrb_IBUF[2]_inst 
       (.I(s00_axi_wstrb[2]),
        .O(s00_axi_wstrb_IBUF[2]));
  IBUF \s00_axi_wstrb_IBUF[3]_inst 
       (.I(s00_axi_wstrb[3]),
        .O(s00_axi_wstrb_IBUF[3]));
  IBUF s00_axi_wvalid_IBUF_inst
       (.I(s00_axi_wvalid),
        .O(s00_axi_wvalid_IBUF));
  OBUF s00_axis_tready_OBUF_inst
       (.I(s00_axis_tready_OBUF),
        .O(s00_axis_tready));
  IBUF s00_axis_tvalid_IBUF_inst
       (.I(s00_axis_tvalid),
        .O(s00_axis_tvalid_IBUF));
endmodule

module MatMul_v1_0_S00_AXI
   (s00_axi_awready_OBUF,
    s00_axi_wready_OBUF,
    s00_axi_arready_OBUF,
    s00_axi_bvalid_OBUF,
    s00_axi_rvalid_OBUF,
    Q,
    CLK,
    s00_axi_aresetn_IBUF,
    s00_axi_awvalid_IBUF,
    s00_axi_wvalid_IBUF,
    s00_axi_bready_IBUF,
    s00_axi_arvalid_IBUF,
    s00_axi_rready_IBUF,
    D,
    \axi_awaddr_reg[3]_0 ,
    \slv_reg1_reg[31]_0 ,
    s00_axi_wstrb_IBUF);
  output s00_axi_awready_OBUF;
  output s00_axi_wready_OBUF;
  output s00_axi_arready_OBUF;
  output s00_axi_bvalid_OBUF;
  output s00_axi_rvalid_OBUF;
  output [31:0]Q;
  input CLK;
  input s00_axi_aresetn_IBUF;
  input s00_axi_awvalid_IBUF;
  input s00_axi_wvalid_IBUF;
  input s00_axi_bready_IBUF;
  input s00_axi_arvalid_IBUF;
  input s00_axi_rready_IBUF;
  input [1:0]D;
  input [1:0]\axi_awaddr_reg[3]_0 ;
  input [31:0]\slv_reg1_reg[31]_0 ;
  input [3:0]s00_axi_wstrb_IBUF;

  wire CLK;
  wire [1:0]D;
  wire [31:0]Q;
  wire [3:2]axi_araddr;
  wire axi_arready0;
  wire [1:0]\axi_awaddr_reg[3]_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire [1:0]p_0_in;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire s00_axi_aresetn_IBUF;
  wire s00_axi_arready_OBUF;
  wire s00_axi_arvalid_IBUF;
  wire s00_axi_awready_OBUF;
  wire s00_axi_awvalid_IBUF;
  wire s00_axi_bready_IBUF;
  wire s00_axi_bvalid_OBUF;
  wire s00_axi_rready_IBUF;
  wire s00_axi_rvalid_OBUF;
  wire s00_axi_wready_OBUF;
  wire [3:0]s00_axi_wstrb_IBUF;
  wire s00_axi_wvalid_IBUF;
  wire [31:0]slv_reg0;
  wire \slv_reg0[1]_i_1_n_0 ;
  wire [31:0]slv_reg1;
  wire \slv_reg1[15]_i_1_n_0 ;
  wire \slv_reg1[23]_i_1_n_0 ;
  wire \slv_reg1[31]_i_1_n_0 ;
  wire \slv_reg1[7]_i_1_n_0 ;
  wire [31:0]\slv_reg1_reg[31]_0 ;
  wire [31:0]slv_reg2;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire [31:0]slv_reg3;
  wire \slv_reg3[15]_i_1_n_0 ;
  wire \slv_reg3[23]_i_1_n_0 ;
  wire \slv_reg3[31]_i_1_n_0 ;
  wire \slv_reg3[7]_i_1_n_0 ;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[2] 
       (.C(CLK),
        .CE(axi_arready0),
        .D(D[0]),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[3] 
       (.C(CLK),
        .CE(axi_arready0),
        .D(D[1]),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid_IBUF),
        .I1(s00_axi_arready_OBUF),
        .O(axi_arready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arready_reg
       (.C(CLK),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(s00_axi_arready_OBUF),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[2] 
       (.C(CLK),
        .CE(axi_awready0),
        .D(\axi_awaddr_reg[3]_0 [0]),
        .Q(p_0_in[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[3] 
       (.C(CLK),
        .CE(axi_awready0),
        .D(\axi_awaddr_reg[3]_0 [1]),
        .Q(p_0_in[1]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn_IBUF),
        .O(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_2
       (.I0(s00_axi_awvalid_IBUF),
        .I1(s00_axi_wvalid_IBUF),
        .I2(s00_axi_awready_OBUF),
        .O(axi_awready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_awready_reg
       (.C(CLK),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(s00_axi_awready_OBUF),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid_IBUF),
        .I1(s00_axi_wvalid_IBUF),
        .I2(s00_axi_awready_OBUF),
        .I3(s00_axi_wready_OBUF),
        .I4(s00_axi_bready_IBUF),
        .I5(s00_axi_bvalid_OBUF),
        .O(axi_bvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_reg
       (.C(CLK),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid_OBUF),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg1[0]),
        .I1(slv_reg0[0]),
        .I2(slv_reg3[0]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[0]),
        .O(reg_data_out[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg1[10]),
        .I1(slv_reg0[10]),
        .I2(slv_reg3[10]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[10]),
        .O(reg_data_out[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg1[11]),
        .I1(slv_reg0[11]),
        .I2(slv_reg3[11]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[11]),
        .O(reg_data_out[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg1[12]),
        .I1(slv_reg0[12]),
        .I2(slv_reg3[12]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[12]),
        .O(reg_data_out[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg1[13]),
        .I1(slv_reg0[13]),
        .I2(slv_reg3[13]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[13]),
        .O(reg_data_out[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg1[14]),
        .I1(slv_reg0[14]),
        .I2(slv_reg3[14]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[14]),
        .O(reg_data_out[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg1[15]),
        .I1(slv_reg0[15]),
        .I2(slv_reg3[15]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[15]),
        .O(reg_data_out[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg1[16]),
        .I1(slv_reg0[16]),
        .I2(slv_reg3[16]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[16]),
        .O(reg_data_out[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg1[17]),
        .I1(slv_reg0[17]),
        .I2(slv_reg3[17]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[17]),
        .O(reg_data_out[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg1[18]),
        .I1(slv_reg0[18]),
        .I2(slv_reg3[18]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[18]),
        .O(reg_data_out[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg1[19]),
        .I1(slv_reg0[19]),
        .I2(slv_reg3[19]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg1[1]),
        .I1(slv_reg0[1]),
        .I2(slv_reg3[1]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[1]),
        .O(reg_data_out[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg1[20]),
        .I1(slv_reg0[20]),
        .I2(slv_reg3[20]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[20]),
        .O(reg_data_out[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg1[21]),
        .I1(slv_reg0[21]),
        .I2(slv_reg3[21]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[21]),
        .O(reg_data_out[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg1[22]),
        .I1(slv_reg0[22]),
        .I2(slv_reg3[22]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[22]),
        .O(reg_data_out[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg1[23]),
        .I1(slv_reg0[23]),
        .I2(slv_reg3[23]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[23]),
        .O(reg_data_out[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg1[24]),
        .I1(slv_reg0[24]),
        .I2(slv_reg3[24]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[24]),
        .O(reg_data_out[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg1[25]),
        .I1(slv_reg0[25]),
        .I2(slv_reg3[25]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[25]),
        .O(reg_data_out[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg1[26]),
        .I1(slv_reg0[26]),
        .I2(slv_reg3[26]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[26]),
        .O(reg_data_out[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg1[27]),
        .I1(slv_reg0[27]),
        .I2(slv_reg3[27]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[27]),
        .O(reg_data_out[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg1[28]),
        .I1(slv_reg0[28]),
        .I2(slv_reg3[28]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[28]),
        .O(reg_data_out[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg1[29]),
        .I1(slv_reg0[29]),
        .I2(slv_reg3[29]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[29]),
        .O(reg_data_out[29]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg1[2]),
        .I1(slv_reg0[2]),
        .I2(slv_reg3[2]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[2]),
        .O(reg_data_out[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg1[30]),
        .I1(slv_reg0[30]),
        .I2(slv_reg3[30]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[30]),
        .O(reg_data_out[30]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg1[31]),
        .I1(slv_reg0[31]),
        .I2(slv_reg3[31]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[31]),
        .O(reg_data_out[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg1[3]),
        .I1(slv_reg0[3]),
        .I2(slv_reg3[3]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[3]),
        .O(reg_data_out[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg1[4]),
        .I1(slv_reg0[4]),
        .I2(slv_reg3[4]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[4]),
        .O(reg_data_out[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg1[5]),
        .I1(slv_reg0[5]),
        .I2(slv_reg3[5]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[5]),
        .O(reg_data_out[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg1[6]),
        .I1(slv_reg0[6]),
        .I2(slv_reg3[6]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[6]),
        .O(reg_data_out[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg1[7]),
        .I1(slv_reg0[7]),
        .I2(slv_reg3[7]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[7]),
        .O(reg_data_out[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg1[8]),
        .I1(slv_reg0[8]),
        .I2(slv_reg3[8]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[8]),
        .O(reg_data_out[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg1[9]),
        .I1(slv_reg0[9]),
        .I2(slv_reg3[9]),
        .I3(axi_araddr[3]),
        .I4(axi_araddr[2]),
        .I5(slv_reg2[9]),
        .O(reg_data_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[0] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(Q[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[10] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(Q[10]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[11] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(Q[11]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[12] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(Q[12]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[13] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(Q[13]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[14] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(Q[14]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[15] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(Q[15]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[16] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(Q[16]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[17] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(Q[17]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[18] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(Q[18]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[19] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(Q[19]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[1] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(Q[1]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[20] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(Q[20]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[21] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(Q[21]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[22] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(Q[22]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[23] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(Q[23]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[24] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(Q[24]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[25] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(Q[25]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[26] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(Q[26]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[27] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(Q[27]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[28] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(Q[28]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[29] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(Q[29]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[2] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(Q[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[30] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(Q[30]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[31] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(Q[31]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[3] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(Q[3]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[4] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(Q[4]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[5] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(Q[5]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[6] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(Q[6]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[7] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(Q[7]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[8] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(Q[8]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[9] 
       (.C(CLK),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(Q[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0F88)) 
    axi_rvalid_i_1
       (.I0(s00_axi_arready_OBUF),
        .I1(s00_axi_arvalid_IBUF),
        .I2(s00_axi_rready_IBUF),
        .I3(s00_axi_rvalid_OBUF),
        .O(axi_rvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_reg
       (.C(CLK),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid_OBUF),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid_IBUF),
        .I1(s00_axi_wvalid_IBUF),
        .I2(s00_axi_wready_OBUF),
        .O(axi_wready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_reg
       (.C(CLK),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(s00_axi_wready_OBUF),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb_IBUF[1]),
        .O(p_1_in[15]));
  LUT6 #(
    .INIT(64'hFFFB000000080000)) 
    \slv_reg0[1]_i_1 
       (.I0(\slv_reg1_reg[31]_0 [1]),
        .I1(s00_axi_wstrb_IBUF[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .I4(slv_reg_wren__0),
        .I5(slv_reg0[1]),
        .O(\slv_reg0[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb_IBUF[2]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb_IBUF[3]),
        .O(p_1_in[31]));
  LUT4 #(
    .INIT(16'h0200)) 
    \slv_reg0[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(p_0_in[0]),
        .I3(s00_axi_wstrb_IBUF[0]),
        .O(p_1_in[7]));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[0] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [0]),
        .Q(slv_reg0[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[10] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [10]),
        .Q(slv_reg0[10]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[11] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [11]),
        .Q(slv_reg0[11]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[12] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [12]),
        .Q(slv_reg0[12]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[13] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [13]),
        .Q(slv_reg0[13]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[14] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [14]),
        .Q(slv_reg0[14]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[15] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [15]),
        .Q(slv_reg0[15]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[16] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [16]),
        .Q(slv_reg0[16]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[17] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [17]),
        .Q(slv_reg0[17]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[18] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [18]),
        .Q(slv_reg0[18]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[19] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [19]),
        .Q(slv_reg0[19]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\slv_reg0[1]_i_1_n_0 ),
        .Q(slv_reg0[1]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[20] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [20]),
        .Q(slv_reg0[20]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[21] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [21]),
        .Q(slv_reg0[21]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[22] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [22]),
        .Q(slv_reg0[22]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[23] 
       (.C(CLK),
        .CE(p_1_in[23]),
        .D(\slv_reg1_reg[31]_0 [23]),
        .Q(slv_reg0[23]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[24] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [24]),
        .Q(slv_reg0[24]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[25] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [25]),
        .Q(slv_reg0[25]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[26] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [26]),
        .Q(slv_reg0[26]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[27] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [27]),
        .Q(slv_reg0[27]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[28] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [28]),
        .Q(slv_reg0[28]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[29] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [29]),
        .Q(slv_reg0[29]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[2] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [2]),
        .Q(slv_reg0[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[30] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [30]),
        .Q(slv_reg0[30]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[31] 
       (.C(CLK),
        .CE(p_1_in[31]),
        .D(\slv_reg1_reg[31]_0 [31]),
        .Q(slv_reg0[31]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[3] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [3]),
        .Q(slv_reg0[3]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[4] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [4]),
        .Q(slv_reg0[4]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[5] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [5]),
        .Q(slv_reg0[5]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[6] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [6]),
        .Q(slv_reg0[6]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[7] 
       (.C(CLK),
        .CE(p_1_in[7]),
        .D(\slv_reg1_reg[31]_0 [7]),
        .Q(slv_reg0[7]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[8] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [8]),
        .Q(slv_reg0[8]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg0_reg[9] 
       (.C(CLK),
        .CE(p_1_in[15]),
        .D(\slv_reg1_reg[31]_0 [9]),
        .Q(slv_reg0[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2000)) 
    \slv_reg1[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg1[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[0] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [0]),
        .Q(slv_reg1[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[10] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [10]),
        .Q(slv_reg1[10]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[11] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [11]),
        .Q(slv_reg1[11]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[12] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [12]),
        .Q(slv_reg1[12]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[13] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [13]),
        .Q(slv_reg1[13]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[14] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [14]),
        .Q(slv_reg1[14]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[15] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [15]),
        .Q(slv_reg1[15]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[16] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [16]),
        .Q(slv_reg1[16]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[17] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [17]),
        .Q(slv_reg1[17]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[18] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [18]),
        .Q(slv_reg1[18]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[19] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [19]),
        .Q(slv_reg1[19]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[1] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [1]),
        .Q(slv_reg1[1]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[20] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [20]),
        .Q(slv_reg1[20]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[21] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [21]),
        .Q(slv_reg1[21]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[22] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [22]),
        .Q(slv_reg1[22]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[23] 
       (.C(CLK),
        .CE(\slv_reg1[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [23]),
        .Q(slv_reg1[23]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[24] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [24]),
        .Q(slv_reg1[24]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[25] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [25]),
        .Q(slv_reg1[25]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[26] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [26]),
        .Q(slv_reg1[26]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[27] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [27]),
        .Q(slv_reg1[27]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[28] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [28]),
        .Q(slv_reg1[28]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[29] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [29]),
        .Q(slv_reg1[29]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[2] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [2]),
        .Q(slv_reg1[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[30] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [30]),
        .Q(slv_reg1[30]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[31] 
       (.C(CLK),
        .CE(\slv_reg1[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [31]),
        .Q(slv_reg1[31]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[3] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [3]),
        .Q(slv_reg1[3]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[4] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [4]),
        .Q(slv_reg1[4]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[5] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [5]),
        .Q(slv_reg1[5]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[6] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [6]),
        .Q(slv_reg1[6]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[7] 
       (.C(CLK),
        .CE(\slv_reg1[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [7]),
        .Q(slv_reg1[7]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[8] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [8]),
        .Q(slv_reg1[8]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg1_reg[9] 
       (.C(CLK),
        .CE(\slv_reg1[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [9]),
        .Q(slv_reg1[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[1]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[2]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[3]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(p_0_in[1]),
        .I2(s00_axi_wstrb_IBUF[0]),
        .I3(p_0_in[0]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[0] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [0]),
        .Q(slv_reg2[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[10] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [10]),
        .Q(slv_reg2[10]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[11] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [11]),
        .Q(slv_reg2[11]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[12] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [12]),
        .Q(slv_reg2[12]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[13] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [13]),
        .Q(slv_reg2[13]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[14] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [14]),
        .Q(slv_reg2[14]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[15] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [15]),
        .Q(slv_reg2[15]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[16] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [16]),
        .Q(slv_reg2[16]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[17] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [17]),
        .Q(slv_reg2[17]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[18] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [18]),
        .Q(slv_reg2[18]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[19] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [19]),
        .Q(slv_reg2[19]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[1] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [1]),
        .Q(slv_reg2[1]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[20] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [20]),
        .Q(slv_reg2[20]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[21] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [21]),
        .Q(slv_reg2[21]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[22] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [22]),
        .Q(slv_reg2[22]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[23] 
       (.C(CLK),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [23]),
        .Q(slv_reg2[23]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[24] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [24]),
        .Q(slv_reg2[24]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[25] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [25]),
        .Q(slv_reg2[25]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[26] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [26]),
        .Q(slv_reg2[26]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[27] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [27]),
        .Q(slv_reg2[27]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[28] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [28]),
        .Q(slv_reg2[28]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[29] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [29]),
        .Q(slv_reg2[29]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[2] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [2]),
        .Q(slv_reg2[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[30] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [30]),
        .Q(slv_reg2[30]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[31] 
       (.C(CLK),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [31]),
        .Q(slv_reg2[31]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[3] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [3]),
        .Q(slv_reg2[3]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[4] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [4]),
        .Q(slv_reg2[4]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[5] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [5]),
        .Q(slv_reg2[5]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[6] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [6]),
        .Q(slv_reg2[6]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[7] 
       (.C(CLK),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [7]),
        .Q(slv_reg2[7]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[8] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [8]),
        .Q(slv_reg2[8]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg2_reg[9] 
       (.C(CLK),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [9]),
        .Q(slv_reg2[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb_IBUF[1]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg3[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb_IBUF[2]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg3[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb_IBUF[3]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg3[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_2 
       (.I0(s00_axi_wready_OBUF),
        .I1(s00_axi_awready_OBUF),
        .I2(s00_axi_awvalid_IBUF),
        .I3(s00_axi_wvalid_IBUF),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(s00_axi_wstrb_IBUF[0]),
        .I2(p_0_in[0]),
        .I3(p_0_in[1]),
        .O(\slv_reg3[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[0] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[10] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[11] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[12] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[13] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[14] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[15] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[16] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[17] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[18] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[19] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[1] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[20] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[21] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[22] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[23] 
       (.C(CLK),
        .CE(\slv_reg3[23]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[24] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[25] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[26] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[27] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[28] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[29] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[2] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[30] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[31] 
       (.C(CLK),
        .CE(\slv_reg3[31]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[3] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[4] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[5] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[6] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[7] 
       (.C(CLK),
        .CE(\slv_reg3[7]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[8] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \slv_reg3_reg[9] 
       (.C(CLK),
        .CE(\slv_reg3[15]_i_1_n_0 ),
        .D(\slv_reg1_reg[31]_0 [9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid_IBUF),
        .I1(s00_axi_rvalid_OBUF),
        .I2(s00_axi_arready_OBUF),
        .O(slv_reg_rden__0));
endmodule

module mat_mul
   (s00_axis_tready_OBUF,
    s00_axis_tvalid_IBUF,
    s00_axi_aresetn_IBUF);
  output s00_axis_tready_OBUF;
  input s00_axis_tvalid_IBUF;
  input s00_axi_aresetn_IBUF;

  wire s00_axi_aresetn_IBUF;
  wire s00_axis_tready_OBUF;
  wire s00_axis_tvalid_IBUF;

  AGU matr_agu
       (.s00_axi_aresetn_IBUF(s00_axi_aresetn_IBUF),
        .s00_axis_tready_OBUF(s00_axis_tready_OBUF),
        .s00_axis_tvalid_IBUF(s00_axis_tvalid_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
