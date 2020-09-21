#include "timekeeper.hpp"



void timekeeper(bool pps, tktime_t unixtime, tktime_t &time, unsigned short &pps_misalign) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=unixtime clock=ctrl_clk
#pragma HLS INTERFACE s_axilite port=pps_misalign clock=ctrl_clk

	static ap_uint<9> hs_clk_tics;
	static ap_uint<20> us_clk_tics;
	static unsigned short misaligncount;

	pps_misalign=misaligncount;
	if (pps &!(us_clk_tics<US_PPS_WINDOW_LOW | us_clk_tics>US_PPS_WINDOW_HIGH)) {
		misaligncount++;
	}

	hs_clk_tics++; // @512MHZ  each tick is .0019 us, 512 per us
	if (hs_clk_tics==TICS_PER_US-1 | pps) {
		us_clk_tics = us_clk_tics == 1000000 ? ap_uint<20>(0): ap_uint<20>(us_clk_tics+1);
	}

	time = unixtime*1000000+us_clk_tics;
}
