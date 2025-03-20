mkdir tempus_report
read_verilog opt.v
read_lib NangateOpenCellLibrary_slow_conditional_ccs.lib
set_global timing_apply_default_primary_input_assertion false
set_top_module mcrb
create_clock -name sclk -period 3 [get_ports "mc_rb_ef1_sclk_i"]
set_clock_transition 0.2 -rise [get_clocks sclk]
set_clock_transition 0.2 -fall [get_clocks sclk]
set_clock_uncertainty 0.3 -setup [get_clocks sclk]
set_clock_uncertainty 0.3 -hold [get_clocks sclk]
set_global report_timing_format {hpin cell arc slew load delay arrival}
report_timing -max_paths 10
report_timing -max_paths 10 > ./tempus_report/Timing_report_all_paths_setup.rpt
report_timing -early -max_paths 10
report_timing -early -max_paths 10 > ./tempus_report/Timing_report_setupcheck.rpt
report_timing -early -max_paths 10 > ./tempus_report/Timing_report_holdcheck.rpt
report_timing -max_paths 10 > ./tempus_report/Timing_report_setupcheck.rpt
report_analysis_coverage
report_analysis_coverage > ./tempus_report/Timing_coverage_analysis.rpt
check_timing
report_timing -path_type full_clock
report_timing -path_type full_clock -max_paths 10
report_timing -early -path_type full_clock -max_paths 10
report_timing -path_type full_clock -max_paths 10 > ./tempus_report/Timing_report_setupcheck.rpt
report_timing -early -path_type full_clock -max_paths 10 > ./tempus_report/Timing_report_holdcheck.rpt
report_constraint -all_violators
report_constraint
report_constraint -all_violators
report_clocks -groups
report_clock_timing -type summary
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > ./tempus_report/check_timing_verbose.rpt
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock
check_timing -check_only {clock_crossing} -verbose
check_timing -check_only {clock_crossing} -verbose > ./tempus_report/Mcrb_timing_report_clockCrossing.rpt
report_clock_timing -type summary > ./tempus_report/Mcrb_clock_timing.rpt
report_constraint -all_violators > ./tempus_report/Mcrb_constraints.rpt
report_clocks -groups > ./tempus_report/Mcrb_clock_groups.rpt
check_timing -verbose -type {loops inputs endpoints clocks constant_collision clock_gating_inferred clock_clipping} -include_warning clocks_masked_by_another_clock > ./tempus_report/Mcrb_report.rp
