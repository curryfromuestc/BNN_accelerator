##=========================================================
##   File name : sc_cfg.tcl
##   Author: Wuhongyan
##   Date: 2015-08-13 08:56
##   Modified date : 2015-10-10 10:11
##   Usage: 
##     insert scan chain script 
##=========================================================    
###############################################################################
#    Scan Configuration                                                        
###############################################################################

set_dft_insertion_configuration -preserve_design_name true
set_dft_insertion_configuration -synthesis_optimization none

#set_dft_configuration  -fix_clock enable \
                       -fix_reset enable \
                       -fix_set   enable \
                       -test_points disable

set_scan_configuration -chain_count 4 -clock_mixing mix_clocks

set test_default_scan_style multiplexed_flip_flop
set_dft_signal -view existing_dft -type ScanClock   -port [get_ports ext_clkspi_c] -timing [list 5 11]
set_dft_signal -view existing_dft -type Reset       -port [get_ports rsta2d]       -active_state 0
set_dft_signal -view existing_dft -type ScanEnable  -port [get_ports test_se_c]    -active_state 1
set_dft_signal -view existing_dft -type TestMode    -port [get_ports test_mode_c]  -active_state 1

#set_dft_signal -view existing_dft -type ScanDataIn  -port [get_ports PINMX_SPI_SDAI]
#set_dft_signal -view existing_dft -type ScanDataOut -port [get_ports scan_so0]
set_dft_signal -view existing_dft -type ScanDataIn  -port [get_ports spi_cs]
set_dft_signal -view existing_dft -type ScanDataIn  -port [get_ports spi_sclk]
set_dft_signal -view existing_dft -type ScanDataIn  -port [get_ports test_si3_c]
set_dft_signal -view existing_dft -type ScanDataIn  -port [get_ports test_si4_c]
set_dft_signal -view existing_dft -type ScanDataOut -port [get_ports spi_sdo]
set_dft_signal -view existing_dft -type ScanDataOut -port [get_ports gpio_adc_eoc]
set_dft_signal -view existing_dft -type ScanDataOut -port [get_ports test_so3_i]
set_dft_signal -view existing_dft -type ScanDataOut -port [get_ports test_so4_i]

#set_scan_path chain0 -view existing_dft\
#                     -scan_data_in  [get_ports spi_cs] \
#                     -scan_data_out [get_ports spi_sdo]
#
#set_scan_path chain1 -view existing_dft\
#                     -scan_data_in  [get_ports spi_sclk] \
#                     -scan_data_out [get_ports dout_ich_ref_sync]
#
create_test_protocol 
dft_drc                   > $REPORTS_DIR/dftprecmp_drc_$TOP.rpt
dft_drc -verbose          > $REPORTS_DIR/dftprecmp_drc_verbose_$TOP.rpt
report_scan_configuration > $REPORTS_DIR/dftprecmp_cfg_$TOP.rpt
report_dft_insertion_configuration > $REPORTS_DIR/dftins_$TOP.rpt

preview_dft > $REPORTS_DIR/dftprecmp_prv_$TOP.rpt
preview_dft -show all -test_points all > $REPORTS_DIR/dftprecmp_prv_$TOP.rpt
insert_dft
