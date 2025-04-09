read_lib NangateOpenCellLibrary_slow_conditional_ccs.lib
read_lib -lef NangateOpenCellLibrary.lef
read_verilog momal_scan.v
set_top_module momal
read_def momal_scan.def
read_sdc momal.sdc
