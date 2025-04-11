set sram_inst [sizeof_collection [get_cells -of_objects sram_sp_*]]
set rf_inst [sizeof_collection [get_cells -of_objects rf_2p_*]]
puts "Total memory cells = [expr {$sram_inst + $rf_inst}]"

set ff_count [sizeof_collection [all_registers -flops]]
puts "FF count : $ff_count"

reportVtInstCount

sizeof_collection [all_clocks]
report_clocks -generated >> clock_sources.rpt
