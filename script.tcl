open_project gen3-timekeeper
set_top timekeeper
add_files src/timekeeper.cpp
add_files src/timekeeper.hpp
add_files -tb src/tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Maintain an accurate photon timestamp} -display_name "Timekeeper" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.1
csim_design
csynth_design
#cosim_design -tool xsim

