
#==========================================
#Formality equalvalence check for dc output
# and original RTL
fm_dct:
	fm_shell -x "set TOP $(TOP); set RUN_DIR_DCT ${RUN_DIR_DCT}" -f ./script/fm_dct.tcl | tee ./fm_dct.log

#==========================================
#Formality equalvalence check for dc output
#and APR result
fm_apr:
	fm_shell -x "set TOP $(TOP)" -f ./script/fm_apr.tcl | tee fm_apr.log


#==========================================
#Clear the equalvalence check for dc output
clean:
	rm -rf FM_WORK* fm_shell_command*.*\
		   formality*
