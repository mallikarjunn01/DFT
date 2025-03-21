set TOP_MODULE s298

set_context dft -scan
read_verilog INPUTS/opt.v
read_cell_library INPUTS/test_Nangate.mdt 
set_current_design ${TOP_MODULE}
analyze_control_signals -auto
check_design_rules
analyze_scan_chains 
insert_test_logic

report_scan_elements > REPORTS/${TOP_MODULE}_scan_elements.txt
report_scan_chains > REPORTS/${TOP_MODULE}_scan_chains.txt
report_scan_cells > REPORTS/${TOP_MODULE}_scan_cells.txt
report_scan_enable > REPORTS/${TOP_MODULE}_scan_enable.txt

write_design -output_file OUTPUTS/${TOP_MODULE}_tessent_scan_net.v -replace
set_system_mode setup
open_visualizer
