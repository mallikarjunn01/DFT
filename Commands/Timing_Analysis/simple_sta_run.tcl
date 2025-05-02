mkdir REPORTS #Creates directories REPORTS
mkdir OUTPUTS #Creates directories OUTPUTS
read_verilog INPUTS/opt.v  # Read the netlist file

read_lib INPUTS/NangateOpenCellLibrary_slow_conditional_ccs.lib   # Read the library file

set_top_module dtmf_recvr_core -ignore_undefined_cell  # Link the design

read_spef INPUTS/corner_worst_CMAX.spef.gz  # Load netlist parasitics

read_sdc INPUTS/dtmf_recvr_core.pr.sdc  # Add constraints

# Run reports
report_analysis_coverage > REPORTS/Timing_coverage_analysis.rpt 

report_timing -path_type full_clock -max_paths 10 > REPORTS/Timing_report_setupcheck.rpt
report_timing -early -path_type full_clock -max_paths 10 > REPORTS/Timing_report_holdcheck.rpt

report_constraint -all_violators > REPORTS/Mcrb_constraints.rpt

