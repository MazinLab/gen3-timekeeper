// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTIMEKEEPER_H
#define XTIMEKEEPER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtimekeeper_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axilites_BaseAddress;
} XTimekeeper_Config;
#endif

typedef struct {
    u32 Axilites_BaseAddress;
    u32 IsReady;
} XTimekeeper;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTimekeeper_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTimekeeper_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTimekeeper_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTimekeeper_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTimekeeper_Initialize(XTimekeeper *InstancePtr, u16 DeviceId);
XTimekeeper_Config* XTimekeeper_LookupConfig(u16 DeviceId);
int XTimekeeper_CfgInitialize(XTimekeeper *InstancePtr, XTimekeeper_Config *ConfigPtr);
#else
int XTimekeeper_Initialize(XTimekeeper *InstancePtr, const char* InstanceName);
int XTimekeeper_Release(XTimekeeper *InstancePtr);
#endif


void XTimekeeper_Set_unixtime_V(XTimekeeper *InstancePtr, u64 Data);
u64 XTimekeeper_Get_unixtime_V(XTimekeeper *InstancePtr);
u32 XTimekeeper_Get_pps_misalign(XTimekeeper *InstancePtr);
u32 XTimekeeper_Get_pps_misalign_vld(XTimekeeper *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
