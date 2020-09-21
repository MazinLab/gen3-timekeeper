#include "timekeeper.hpp"
#include <iostream>

using namespace std;

#define MAX_TICKS 3000
int main (void){

	bool fail=false;

	bool pps=false;
	unsigned short pps_misalign=0, pps_misalign_last=0;
	int us_ticks;
	tktime_t unixtime=30;
	tktime_t time=0, expected_time=0;


	timekeeper(false, unixtime, time, pps_misalign);

	for (unsigned int i=0;i<MAX_TICKS;i++) {
		pps=i%100==0 &&i>0;
		us_ticks=i/TICS_PER_US + pps;
		expected_time=unixtime*1e6 +us_ticks;
		timekeeper(pps, unixtime, time, pps_misalign);
		cout<<i<<"/"<<us_ticks<<" Time:"<<unixtime<<" pps="<<pps<<" misalign:"<<pps_misalign<<" Time out:"<<time<<" Expected:"<<expected_time<<endl;
		if (time!=expected_time) {
			cout<<"Time mismatch\n";
			fail=true;
		}
		if (pps_misalign!=pps_misalign_last) {
			pps_misalign_last=pps_misalign;
			cout<<"ppsmismatch\n";
		}
	}



	if (fail) {
		cout << "Test failed" << std::endl;
	} else {
		cout << "Test passed" << std::endl;
	}
	return(fail);
}
