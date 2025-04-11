read_lib slow.lib
read_lib "memories/rf_2p_136d_74w_1m_4b.lib.gz \
          memories/rf_2p_256d_76w_1m_4b.lib.gz \
          memories/rf_2p_512d_76w_2m_4b.lib.gz \
          memories/sram_sp_512d_32w_4m_2b.lib.gz \
          memories/sram_sp_16384d_36w_16m_8b.lib.gz \
          memories/sram_sp_32768d_33w_16m_8b.lib.gz"
read_verilog cpu_sys.v
set load_netlist_ignore_undefined_cell true
set_top_module
read_sdc cpu_sys.sdc
