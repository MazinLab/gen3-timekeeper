#include "ap_int.h"


#define TICS_PER_US 512
#define US_PPS_WINDOW_LOW 1000
#define US_PPS_WINDOW_HIGH 1000000-1000

typedef ap_uint<64> tktime_t;

void timekeeper(bool pps, tktime_t unixtime, tktime_t &time, unsigned short &pps_misalign);
