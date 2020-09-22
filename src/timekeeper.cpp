#include "timekeeper.hpp"
#include <iostream>
using namespace std;


void timekeeper(bool pps, tktime_t unixtime, tktime_t &time, unsigned short &pps_misalign) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE s_axilite port=unixtime// clock=ctrl_clk
#pragma HLS INTERFACE s_axilite port=pps_misalign// clock=ctrl_clk

	static ap_uint<9> hs_clk_tics;
	static ap_uint<20> us_clk_tics;
	static unsigned short misaligncount;
	static bool pps_last=false;
	bool pps_rising, us_tic_time;

	pps_misalign=misaligncount;

	pps_rising = pps & !pps_last;

	if (pps_rising &!(us_clk_tics<US_PPS_WINDOW_LOW | us_clk_tics>US_PPS_WINDOW_HIGH)) {
		misaligncount++;
	}

	hs_clk_tics++; // @512MHZ  each tick is .0019 us, 512 per us

	us_tic_time=hs_clk_tics==0 | pps_rising;



//	cout<<"Core hs:"<<hs_clk_tics<<" us:"<<us_clk_tics;
	if (us_tic_time) {
//		cout<<" tick";
//		if (pps) cout<<" pps";
//		if (hs_clk_tics==0) cout<<" hs:";
//		cout<<endl;
		us_clk_tics = us_clk_tics == 1000000 ? ap_uint<20>(0): ap_uint<20>(us_clk_tics+1);
	}
//	else cout<<endl;

	if (pps_rising) hs_clk_tics=0;

	time = unixtime*1000000+us_clk_tics;
	pps_last=pps;
}
