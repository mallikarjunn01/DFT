set VERILOG s298
set TOP_MODULE s298
mkdir REPORTS
mkdir OUTPUTS
read_libs NangateOpenCellLibrary_slow_conditional_ccs.lib
read_physical -lef NangateOpenCellLibrary.lef
read_hdl INPUTS/${VERILOG}.v   

elaborate ${TOP_MODULE}
write_hdl > OUTPUTS/elaborate.v
read_sdc INPUTS/constraints.sdc

syn_generic
write_hdl > OUTPUTS/syn.v
syn_map
write_hdl > OUTPUTS/map.v
syn_opt
write_hdl > OUTPUTS/opt.v

report_area > REPORTS/${TOP_MODULE}_area.rep
report_power > REPORTS/${TOP_MODULE}_power.rep
report_gates > REPORTS/${TOP_MODULE}_gates.rep
report_timing > REPORTS/${TOP_MODULE}_timing.rep
