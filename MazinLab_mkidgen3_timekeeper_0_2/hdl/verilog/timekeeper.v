// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="timekeeper,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=pipeline,HLS_SYN_CLOCK=1.454625,HLS_SYN_LAT=20,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=4,HLS_SYN_FF=1750,HLS_SYN_LUT=898,HLS_VERSION=2019_2_1}" *)

module timekeeper (
        ap_clk,
        ap_rst_n,
        pps,
        time_V,
        time_V_ap_vld,
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;
parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_AXILITES_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   pps;
output  [63:0] time_V;
output   time_V_ap_vld;
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1:0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1:0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1:0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;

reg time_V_ap_vld;

 reg    ap_rst_n_inv;
wire   [63:0] unixtime_V;
reg    pps_misalign_ap_vld;
reg   [15:0] misaligncount;
reg   [0:0] pps_last;
reg   [19:0] us_clk_tics_V;
reg   [8:0] hs_clk_tics_V;
reg  signed [63:0] unixtime_V_read_reg_239;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_state7_pp0_stage0_iter6;
wire    ap_block_state8_pp0_stage0_iter7;
wire    ap_block_state9_pp0_stage0_iter8;
wire    ap_block_state10_pp0_stage0_iter9;
wire    ap_block_state11_pp0_stage0_iter10;
wire    ap_block_state12_pp0_stage0_iter11;
wire    ap_block_state13_pp0_stage0_iter12;
wire    ap_block_state14_pp0_stage0_iter13;
wire    ap_block_state15_pp0_stage0_iter14;
wire    ap_block_state16_pp0_stage0_iter15;
wire    ap_block_state17_pp0_stage0_iter16;
wire    ap_block_state18_pp0_stage0_iter17;
wire    ap_block_state19_pp0_stage0_iter18;
wire    ap_block_state20_pp0_stage0_iter19;
wire    ap_block_state21_pp0_stage0_iter20;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] pps_read_reg_244;
reg   [0:0] pps_read_reg_244_pp0_iter1_reg;
reg   [0:0] pps_read_reg_244_pp0_iter2_reg;
reg   [0:0] pps_read_reg_244_pp0_iter3_reg;
reg   [0:0] pps_read_reg_244_pp0_iter4_reg;
reg   [0:0] pps_read_reg_244_pp0_iter5_reg;
reg   [0:0] pps_read_reg_244_pp0_iter6_reg;
reg   [0:0] pps_read_reg_244_pp0_iter7_reg;
reg   [0:0] pps_read_reg_244_pp0_iter8_reg;
reg   [0:0] pps_read_reg_244_pp0_iter9_reg;
reg   [0:0] pps_read_reg_244_pp0_iter10_reg;
reg   [0:0] pps_read_reg_244_pp0_iter11_reg;
reg   [0:0] pps_read_reg_244_pp0_iter12_reg;
reg   [0:0] pps_read_reg_244_pp0_iter13_reg;
reg   [0:0] pps_read_reg_244_pp0_iter14_reg;
reg   [0:0] pps_read_reg_244_pp0_iter15_reg;
reg   [0:0] pps_read_reg_244_pp0_iter16_reg;
reg   [0:0] pps_read_reg_244_pp0_iter17_reg;
wire   [8:0] add_ln700_fu_108_p2;
reg   [8:0] add_ln700_reg_250;
reg   [19:0] us_clk_tics_V_load_reg_256;
wire   [0:0] and_ln22_fu_151_p2;
reg   [0:0] and_ln22_reg_261;
reg   [0:0] and_ln22_reg_261_pp0_iter19_reg;
wire   [0:0] us_tic_time_fu_162_p2;
reg   [0:0] us_tic_time_reg_265;
wire   [19:0] select_ln38_fu_180_p3;
reg   [19:0] select_ln38_reg_269;
wire   [63:0] grp_fu_99_p2;
reg   [63:0] mul_ln214_reg_274;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0_subdone;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_enable_reg_pp0_iter16;
reg    ap_enable_reg_pp0_iter17;
reg    ap_enable_reg_pp0_iter18;
reg    ap_enable_reg_pp0_iter19;
reg    ap_enable_reg_pp0_iter20;
wire   [19:0] ap_phi_reg_pp0_iter0_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter1_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter2_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter3_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter4_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter5_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter6_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter7_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter8_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter9_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter10_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter11_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter12_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter13_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter14_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter15_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter16_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter17_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter18_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter19_empty_reg_90;
reg   [19:0] ap_phi_reg_pp0_iter20_empty_reg_90;
wire   [15:0] add_ln23_fu_217_p2;
wire    ap_block_pp0_stage0;
wire   [8:0] select_ln42_fu_194_p3;
reg   [8:0] ap_sig_allocacmp_t_V;
wire    ap_block_pp0_stage0_01001;
wire   [20:0] grp_fu_99_p1;
wire   [0:0] xor_ln20_fu_118_p2;
wire   [0:0] icmp_ln22_1_fu_139_p2;
wire   [0:0] icmp_ln22_fu_133_p2;
wire   [0:0] and_ln22_1_fu_145_p2;
wire   [0:0] pps_rising_fu_124_p2;
wire   [0:0] icmp_ln879_fu_157_p2;
wire   [0:0] icmp_ln879_1_fu_168_p2;
wire   [19:0] add_ln214_fu_174_p2;
wire   [63:0] zext_ln214_fu_229_p1;
reg   [0:0] ap_NS_fsm;
wire    ap_reset_idle_pp0;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 misaligncount = 16'd0;
#0 pps_last = 1'd0;
#0 us_clk_tics_V = 20'd0;
#0 hs_clk_tics_V = 9'd0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 ap_enable_reg_pp0_iter16 = 1'b0;
#0 ap_enable_reg_pp0_iter17 = 1'b0;
#0 ap_enable_reg_pp0_iter18 = 1'b0;
#0 ap_enable_reg_pp0_iter19 = 1'b0;
#0 ap_enable_reg_pp0_iter20 = 1'b0;
end

timekeeper_AXILiteS_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_AXILITES_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_AXILITES_DATA_WIDTH ))
timekeeper_AXILiteS_s_axi_U(
    .AWVALID(s_axi_AXILiteS_AWVALID),
    .AWREADY(s_axi_AXILiteS_AWREADY),
    .AWADDR(s_axi_AXILiteS_AWADDR),
    .WVALID(s_axi_AXILiteS_WVALID),
    .WREADY(s_axi_AXILiteS_WREADY),
    .WDATA(s_axi_AXILiteS_WDATA),
    .WSTRB(s_axi_AXILiteS_WSTRB),
    .ARVALID(s_axi_AXILiteS_ARVALID),
    .ARREADY(s_axi_AXILiteS_ARREADY),
    .ARADDR(s_axi_AXILiteS_ARADDR),
    .RVALID(s_axi_AXILiteS_RVALID),
    .RREADY(s_axi_AXILiteS_RREADY),
    .RDATA(s_axi_AXILiteS_RDATA),
    .RRESP(s_axi_AXILiteS_RRESP),
    .BVALID(s_axi_AXILiteS_BVALID),
    .BREADY(s_axi_AXILiteS_BREADY),
    .BRESP(s_axi_AXILiteS_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .unixtime_V(unixtime_V),
    .pps_misalign(misaligncount),
    .pps_misalign_ap_vld(pps_misalign_ap_vld)
);

timekeeper_mul_64bkb #(
    .ID( 1 ),
    .NUM_STAGE( 19 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 21 ),
    .dout_WIDTH( 64 ))
timekeeper_mul_64bkb_U1(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(unixtime_V_read_reg_239),
    .din1(grp_fu_99_p1),
    .ce(1'b1),
    .dout(grp_fu_99_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter16 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter16 <= ap_enable_reg_pp0_iter15;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter17 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter17 <= ap_enable_reg_pp0_iter16;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter18 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter18 <= ap_enable_reg_pp0_iter17;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter19 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter19 <= ap_enable_reg_pp0_iter18;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter20 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter20 <= ap_enable_reg_pp0_iter19;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter19 == 1'b1))) begin
        if ((us_tic_time_reg_265 == 1'd0)) begin
            ap_phi_reg_pp0_iter20_empty_reg_90 <= us_clk_tics_V_load_reg_256;
        end else if ((us_tic_time_reg_265 == 1'd1)) begin
            ap_phi_reg_pp0_iter20_empty_reg_90 <= select_ln38_reg_269;
        end else if ((1'b1 == 1'b1)) begin
            ap_phi_reg_pp0_iter20_empty_reg_90 <= ap_phi_reg_pp0_iter19_empty_reg_90;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln700_reg_250 <= add_ln700_fu_108_p2;
        and_ln22_reg_261 <= and_ln22_fu_151_p2;
        and_ln22_reg_261_pp0_iter19_reg <= and_ln22_reg_261;
        mul_ln214_reg_274 <= grp_fu_99_p2;
        pps_read_reg_244_pp0_iter10_reg <= pps_read_reg_244_pp0_iter9_reg;
        pps_read_reg_244_pp0_iter11_reg <= pps_read_reg_244_pp0_iter10_reg;
        pps_read_reg_244_pp0_iter12_reg <= pps_read_reg_244_pp0_iter11_reg;
        pps_read_reg_244_pp0_iter13_reg <= pps_read_reg_244_pp0_iter12_reg;
        pps_read_reg_244_pp0_iter14_reg <= pps_read_reg_244_pp0_iter13_reg;
        pps_read_reg_244_pp0_iter15_reg <= pps_read_reg_244_pp0_iter14_reg;
        pps_read_reg_244_pp0_iter16_reg <= pps_read_reg_244_pp0_iter15_reg;
        pps_read_reg_244_pp0_iter17_reg <= pps_read_reg_244_pp0_iter16_reg;
        pps_read_reg_244_pp0_iter2_reg <= pps_read_reg_244_pp0_iter1_reg;
        pps_read_reg_244_pp0_iter3_reg <= pps_read_reg_244_pp0_iter2_reg;
        pps_read_reg_244_pp0_iter4_reg <= pps_read_reg_244_pp0_iter3_reg;
        pps_read_reg_244_pp0_iter5_reg <= pps_read_reg_244_pp0_iter4_reg;
        pps_read_reg_244_pp0_iter6_reg <= pps_read_reg_244_pp0_iter5_reg;
        pps_read_reg_244_pp0_iter7_reg <= pps_read_reg_244_pp0_iter6_reg;
        pps_read_reg_244_pp0_iter8_reg <= pps_read_reg_244_pp0_iter7_reg;
        pps_read_reg_244_pp0_iter9_reg <= pps_read_reg_244_pp0_iter8_reg;
        us_clk_tics_V_load_reg_256 <= us_clk_tics_V;
        us_tic_time_reg_265 <= us_tic_time_fu_162_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter9 == 1'b1))) begin
        ap_phi_reg_pp0_iter10_empty_reg_90 <= ap_phi_reg_pp0_iter9_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
        ap_phi_reg_pp0_iter11_empty_reg_90 <= ap_phi_reg_pp0_iter10_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter11 == 1'b1))) begin
        ap_phi_reg_pp0_iter12_empty_reg_90 <= ap_phi_reg_pp0_iter11_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter12 == 1'b1))) begin
        ap_phi_reg_pp0_iter13_empty_reg_90 <= ap_phi_reg_pp0_iter12_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter13 == 1'b1))) begin
        ap_phi_reg_pp0_iter14_empty_reg_90 <= ap_phi_reg_pp0_iter13_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter14 == 1'b1))) begin
        ap_phi_reg_pp0_iter15_empty_reg_90 <= ap_phi_reg_pp0_iter14_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter15 == 1'b1))) begin
        ap_phi_reg_pp0_iter16_empty_reg_90 <= ap_phi_reg_pp0_iter15_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter16 == 1'b1))) begin
        ap_phi_reg_pp0_iter17_empty_reg_90 <= ap_phi_reg_pp0_iter16_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter17 == 1'b1))) begin
        ap_phi_reg_pp0_iter18_empty_reg_90 <= ap_phi_reg_pp0_iter17_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter18 == 1'b1))) begin
        ap_phi_reg_pp0_iter19_empty_reg_90 <= ap_phi_reg_pp0_iter18_empty_reg_90;
        hs_clk_tics_V <= select_ln42_fu_194_p3;
        pps_last <= pps_read_reg_244_pp0_iter17_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == 1'b1))) begin
        ap_phi_reg_pp0_iter1_empty_reg_90 <= ap_phi_reg_pp0_iter0_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_reg_pp0_iter2_empty_reg_90 <= ap_phi_reg_pp0_iter1_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_reg_pp0_iter3_empty_reg_90 <= ap_phi_reg_pp0_iter2_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_phi_reg_pp0_iter4_empty_reg_90 <= ap_phi_reg_pp0_iter3_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
        ap_phi_reg_pp0_iter5_empty_reg_90 <= ap_phi_reg_pp0_iter4_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        ap_phi_reg_pp0_iter6_empty_reg_90 <= ap_phi_reg_pp0_iter5_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter6 == 1'b1))) begin
        ap_phi_reg_pp0_iter7_empty_reg_90 <= ap_phi_reg_pp0_iter6_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
        ap_phi_reg_pp0_iter8_empty_reg_90 <= ap_phi_reg_pp0_iter7_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter8 == 1'b1))) begin
        ap_phi_reg_pp0_iter9_empty_reg_90 <= ap_phi_reg_pp0_iter8_empty_reg_90;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter20 == 1'b1) & (1'd1 == and_ln22_reg_261_pp0_iter19_reg))) begin
        misaligncount <= add_ln23_fu_217_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        pps_read_reg_244 <= pps;
        pps_read_reg_244_pp0_iter1_reg <= pps_read_reg_244;
        unixtime_V_read_reg_239 <= unixtime_V;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (us_tic_time_fu_162_p2 == 1'd1))) begin
        select_ln38_reg_269 <= select_ln38_fu_180_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter18 == 1'b1) & (us_tic_time_fu_162_p2 == 1'd1))) begin
        us_clk_tics_V <= select_ln38_fu_180_p3;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter20 == 1'b0) & (ap_enable_reg_pp0_iter19 == 1'b0) & (ap_enable_reg_pp0_iter18 == 1'b0) & (ap_enable_reg_pp0_iter17 == 1'b0) & (ap_enable_reg_pp0_iter16 == 1'b0) & (ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

assign ap_reset_idle_pp0 = 1'b0;

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter18 == 1'b1))) begin
        ap_sig_allocacmp_t_V = select_ln42_fu_194_p3;
    end else begin
        ap_sig_allocacmp_t_V = hs_clk_tics_V;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter20 == 1'b1))) begin
        pps_misalign_ap_vld = 1'b1;
    end else begin
        pps_misalign_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter20 == 1'b1))) begin
        time_V_ap_vld = 1'b1;
    end else begin
        time_V_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln214_fu_174_p2 = (us_clk_tics_V + 20'd1);

assign add_ln23_fu_217_p2 = (misaligncount + 16'd1);

assign add_ln700_fu_108_p2 = (ap_sig_allocacmp_t_V + 9'd1);

assign and_ln22_1_fu_145_p2 = (icmp_ln22_fu_133_p2 & icmp_ln22_1_fu_139_p2);

assign and_ln22_fu_151_p2 = (pps_rising_fu_124_p2 & and_ln22_1_fu_145_p2);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp0_stage0_iter9 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp0_stage0_iter10 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp0_stage0_iter11 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp0_stage0_iter12 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp0_stage0_iter13 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp0_stage0_iter14 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp0_stage0_iter15 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp0_stage0_iter16 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp0_stage0_iter17 = ~(1'b1 == 1'b1);

assign ap_block_state19_pp0_stage0_iter18 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state20_pp0_stage0_iter19 = ~(1'b1 == 1'b1);

assign ap_block_state21_pp0_stage0_iter20 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter8 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_phi_reg_pp0_iter0_empty_reg_90 = 'bx;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_fu_99_p1 = 64'd1000000;

assign icmp_ln22_1_fu_139_p2 = ((us_clk_tics_V > 20'd999) ? 1'b1 : 1'b0);

assign icmp_ln22_fu_133_p2 = ((us_clk_tics_V < 20'd999001) ? 1'b1 : 1'b0);

assign icmp_ln879_1_fu_168_p2 = ((us_clk_tics_V == 20'd1000000) ? 1'b1 : 1'b0);

assign icmp_ln879_fu_157_p2 = ((add_ln700_reg_250 == 9'd0) ? 1'b1 : 1'b0);

assign pps_rising_fu_124_p2 = (xor_ln20_fu_118_p2 & pps_read_reg_244_pp0_iter17_reg);

assign select_ln38_fu_180_p3 = ((icmp_ln879_1_fu_168_p2[0:0] === 1'b1) ? 20'd0 : add_ln214_fu_174_p2);

assign select_ln42_fu_194_p3 = ((pps_rising_fu_124_p2[0:0] === 1'b1) ? 9'd0 : add_ln700_reg_250);

assign time_V = (mul_ln214_reg_274 + zext_ln214_fu_229_p1);

assign us_tic_time_fu_162_p2 = (pps_rising_fu_124_p2 | icmp_ln879_fu_157_p2);

assign xor_ln20_fu_118_p2 = (pps_last ^ 1'd1);

assign zext_ln214_fu_229_p1 = ap_phi_reg_pp0_iter20_empty_reg_90;

endmodule //timekeeper