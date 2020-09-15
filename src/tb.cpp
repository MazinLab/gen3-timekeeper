#include "timekeeper.hpp"
#include <iostream>

int main (void){

	bool fail=false;

	bool pps;
	tktime_t unixtime;
	tktime_t time;
	timekeeper(false, unixtime, time);
	if (time!=(unixtime<<20)) fail=true;
	timekeeper(false, unixtime, time);
	if (time!=(unixtime<<20)+1) fail=true;
	timekeeper(false, unixtime, time);
	if (time!=(unixtime<<20)+2) fail=true;



	if (fail) {
		std::cout << "Test failed" << std::endl;
	} else {
		std::cout << "Test passed" << std::endl;
	}
	return(fail);
}
