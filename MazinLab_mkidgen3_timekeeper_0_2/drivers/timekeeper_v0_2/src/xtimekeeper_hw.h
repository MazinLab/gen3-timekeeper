// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of unixtime_V
//        bit 31~0 - unixtime_V[31:0] (Read/Write)
// 0x14 : Data signal of unixtime_V
//        bit 31~0 - unixtime_V[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of pps_misalign
//        bit 15~0 - pps_misalign[15:0] (Read)
//        others   - reserved
// 0x20 : Control signal of pps_misalign
//        bit 0  - pps_misalign_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_DATA   0x10
#define XTIMEKEEPER_AXILITES_BITS_UNIXTIME_V_DATA   64
#define XTIMEKEEPER_AXILITES_ADDR_PPS_MISALIGN_DATA 0x1c
#define XTIMEKEEPER_AXILITES_BITS_PPS_MISALIGN_DATA 16
#define XTIMEKEEPER_AXILITES_ADDR_PPS_MISALIGN_CTRL 0x20

