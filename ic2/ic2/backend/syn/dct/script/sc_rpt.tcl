write_scan_def -output $OUTPUT/${TOP}_dft_scandef.def
write_test_protocol -test_mode Internal_scan -output $OUTPUT/${TOP}.spf
write_test_model -format ctl -output $OUTPUT/$TOP.ctl

check_scan_def  > $REPORTS_DIR/dftcmp_chkscan_$TOP.rpt
report_dft_signal > $REPORTS_DIR/dftcmp_sig_$TOP.rpt
current_test_mode Internal_scan
dft_drc > ${REPORTS_DIR}/dftcmp_drc_$TOP.rpt

