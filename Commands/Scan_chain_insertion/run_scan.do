# Defines the TOP_MODULE variable as s298
set TOP_MODULE s298

#Switches the tool to DFT mode, specifically for scan insertion
set_context dft -scan  

#Reads the post-synthesis gate-level netlist
read_verilog INPUTS/opt.v 

#Loads a test-specific cell library 
read_cell_library INPUTS/test_Nangate.mdt 

#Sets the current working design to the top module 
set_current_design ${TOP_MODULE} 	
analyze_control_signals -auto

#Checks if the design meets DFT requirements 
check_design_rules 

#Analyzes the design to plan scan chain configurations
analyze_scan_chains 

#Inserts scan cells 
insert_test_logic 

#Reports
report_scan_elements > REPORTS/${TOP_MODULE}_scan_elements.txt
report_scan_chains > REPORTS/${TOP_MODULE}_scan_chains.txt
report_scan_cells > REPORTS/${TOP_MODULE}_scan_cells.txt
report_scan_enable > REPORTS/${TOP_MODULE}_scan_enable.txt

#Writes the modified netlist with scan logic to s298_tessent_scan_net.v.
write_design -output_file OUTPUTS/${TOP_MODULE}_tessent_scan_net.v -replace
set_system_mode setup
open_visualizer
