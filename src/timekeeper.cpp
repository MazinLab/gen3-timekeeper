#include "timekeeper.hpp"

void timekeeper(bool pps, time_t &unixtime, time_t &time) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=unixtime clock=ctrl_clk

	static ap_uint<30> counter;

	if (pps || counter==TICS_PER_S) {
		unixtime++;
		counter=0;
		time = unixtime<20;
	} else {
		time = unixtime<20+counter;
		counter++;
	}

}
