#include "ap_int.h"
#define TICS_PER_S 512000000//512MHz

typedef ap_uint<64> tktime_t;

void timekeeper(bool pps, tktime_t &unixtime, tktime_t &time);
