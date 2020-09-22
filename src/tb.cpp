#include "timekeeper.hpp"
#include <iostream>

using namespace std;

#define MAX_TICKS 3000
int main (void){

	bool fail=false;

	bool pps=false;
	unsigned short pps_misalign=0, pps_misalign_last=0;
	unsigned int us_ticks=0, pps_ticks=0, _i=0;
	tktime_t unixtime=30;
	tktime_t time=0, expected_time=0;

	for (unsigned int i=0;i<MAX_TICKS;i++) {

		pps=i%1337==0 &&i>0;
		_i++;
		_i=(_i%TICS_PER_US);
		us_ticks+=_i==0;
		pps_ticks+=pps;
		expected_time=unixtime*1e6 +us_ticks+pps_ticks;
		timekeeper(pps, unixtime, time, pps_misalign);
		if (pps) _i=0;
		if ((pps_misalign!=pps_misalign_last)|(time!=expected_time))
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
