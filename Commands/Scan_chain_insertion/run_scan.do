set_context dft -scan
read_verilog opt.v
read_cell_library test_Nangate.mdt 
set_current_design mcrb
analyze_control_signals -auto
check_design_rules
analyze_scan_chains 
insert_test_logic

report_scan_elements > mcrb_scan_elements.txt
report_scan_chains > mcrb_scan_chains.txt
report_scan_cells > mcrb_scan_cells.txt
report_scan_enable > mcrb_scan_enable.txt

write_design -output_file ./output/mcrb_tessent_scan_net.v -replace
set_system_mode setup
open_visualizer
