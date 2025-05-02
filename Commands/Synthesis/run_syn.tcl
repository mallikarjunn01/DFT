#Sets a variable VERILOG to the value s298
set VERILOG s298 

#Defines the TOP_MODULE variable as s298
set TOP_MODULE s298 

#Creates directories
mkdir REPORTS  
mkdir OUTPUTS 

#reads .lib file
read_libs INPUTS/NangateOpenCellLibrary_slow_conditional_ccs.lib 

#reads .lef file 
read_physical -lef INPUTS/NangateOpenCellLibrary.lef 

#reads the verilog RTL file 
read_hdl INPUTS/${VERILOG}.v  

#processes the RTL, checks for syntax errors and infers registers/multiplexers.
elaborate ${TOP_MODULE} 

#writes the elaborated design to elaborate.v
write_hdl > OUTPUTS/elaborate.v 

#loads timing constraints
read_sdc INPUTS/constraints.sdc 

#optimizes the design without binding to a specific cell library
syn_generic 
write_hdl > OUTPUTS/syn.v

#converts the design into cells available in the target library
syn_map  
write_hdl > OUTPUTS/map.v

#performs technology-dependent optimizations
syn_opt 
write_hdl > OUTPUTS/opt.v

#Reports
report_area > REPORTS/${TOP_MODULE}_area.rep
report_power > REPORTS/${TOP_MODULE}_power.rep
report_gates > REPORTS/${TOP_MODULE}_gates.rep
report_timing > REPORTS/${TOP_MODULE}_timing.rep
