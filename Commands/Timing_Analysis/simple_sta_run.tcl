# Read the netlist file
read_verilog INPUTS/opt.v  

# Read the library file
read_lib INPUTS/NangateOpenCellLibrary_slow_conditional_ccs.lib   

# Link the design
set_top_module dtmf_recvr_core -ignore_undefined_cell  

# Load netlist parasitics
read_spef INPUTS/corner_worst_CMAX.spef.gz  

# Add constraints
read_sdc INPUTS/dtmf_recvr_core.pr.sdc 
 
# Run reports
report_analysis_coverage > REPORTS/Timing_coverage_analysis.rpt 
report_timing -path_type full_clock -max_paths 10 > REPORTS/Timing_report_setupcheck.rpt
report_timing -early -path_type full_clock -max_paths 10 > REPORTS/Timing_report_holdcheck.rpt
report_constraint -all_violators > REPORTS/Mcrb_constraints.rpt

