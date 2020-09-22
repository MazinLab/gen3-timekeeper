// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtimekeeper.h"

extern XTimekeeper_Config XTimekeeper_ConfigTable[];

XTimekeeper_Config *XTimekeeper_LookupConfig(u16 DeviceId) {
	XTimekeeper_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTIMEKEEPER_NUM_INSTANCES; Index++) {
		if (XTimekeeper_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTimekeeper_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTimekeeper_Initialize(XTimekeeper *InstancePtr, u16 DeviceId) {
	XTimekeeper_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTimekeeper_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTimekeeper_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

