// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtimekeeper.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTimekeeper_CfgInitialize(XTimekeeper *InstancePtr, XTimekeeper_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTimekeeper_Set_unixtime_V_i(XTimekeeper *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTimekeeper_WriteReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_I_DATA, (u32)(Data));
    XTimekeeper_WriteReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_I_DATA + 4, (u32)(Data >> 32));
}

u64 XTimekeeper_Get_unixtime_V_i(XTimekeeper *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTimekeeper_ReadReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_I_DATA);
    Data += (u64)XTimekeeper_ReadReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_I_DATA + 4) << 32;
    return Data;
}

u64 XTimekeeper_Get_unixtime_V_o(XTimekeeper *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTimekeeper_ReadReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_O_DATA);
    Data += (u64)XTimekeeper_ReadReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_O_DATA + 4) << 32;
    return Data;
}

u32 XTimekeeper_Get_unixtime_V_o_vld(XTimekeeper *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTimekeeper_ReadReg(InstancePtr->Axilites_BaseAddress, XTIMEKEEPER_AXILITES_ADDR_UNIXTIME_V_O_CTRL);
    return Data & 0x1;
}

