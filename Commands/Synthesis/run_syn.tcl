set VERILOG s298 #Sets a variable VERILOG to the value s298
set TOP_MODULE s298 #Defines the TOP_MODULE variable as s298
mkdir REPORTS #Creates directories REPORTS
mkdir OUTPUTS #Creates directories OUTPUTS
 
read_libs INPUTS/NangateOpenCellLibrary_slow_conditional_ccs.lib #reads .lib file 
read_physical -lef INPUTS/NangateOpenCellLibrary.lef  #reads .lef file
read_hdl INPUTS/${VERILOG}.v  #reads the verilog RTL file

elaborate ${TOP_MODULE} #processes the RTL, checks for syntax errors and infers registers/multiplexers.
write_hdl > OUTPUTS/elaborate.v #writes the elaborated design to elaborate.v
read_sdc INPUTS/constraints.sdc #loads timing constraints

syn_generic #optimizes the design without binding to a specific cell library
write_hdl > OUTPUTS/syn.v

syn_map  #converts the design into cells available in the target library
write_hdl > OUTPUTS/map.v

syn_opt #performs technology-dependent optimizations
write_hdl > OUTPUTS/opt.v

report_area > REPORTS/${TOP_MODULE}_area.rep
report_power > REPORTS/${TOP_MODULE}_power.rep
report_gates > REPORTS/${TOP_MODULE}_gates.rep
report_timing > REPORTS/${TOP_MODULE}_timing.rep
