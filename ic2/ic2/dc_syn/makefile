#=====================================================================
# Variables setting
TOP      	= conv
SCAN     	= 0
FILE_LIST 	= ./inputs/simfile_list.f
TOP_SDC 	= ./inputs/$(TOP).sdc
SAIF_FILE 	= ./inputs/tb.fsdb.saif
SAIF_INST 	= <tb_module_name>/<instan_level_name>

#====================================================================
# Variables setting for dc scripts
CMD = -x "set TOP_SDC  $(TOP_SDC); \
		  set TOP $(TOP); \
		  set SCAN $(SCAN); \
		  set FILE_LIST $(FILE_LIST); \
		  set SAIF_FILE $(SAIF_FILE); \
		  set SAIF_INST $(SAIF_INST); \
		  "
#====================================================================
# DC synthesis
dc:
	dc_shell-xg-t  -no_gui $(CMD) -f scr/dc.tcl | tee dc.log

#====================================================================
# Clean redundant files
clean:
	rm -rf command.log dc.log default.svf *.log MODULE_ALL.v lib \
		   reports/*  outputs/*  crte* *.svf *.html *.log novas.* *.syn *.pvl *.mr \
		   clogBmBmNp *.csh .*

BACKUP  = BACKUP.`date "+%m_%d_%H_%M"`
backup:
	rm -rf $(BACKUP)
	mkdir -p $(BACKUP)
	cp -rf ./inputs ./mw ./outputs ./reports ./scr $(BACKUP)

#====================================================================
# Clean redundant files
help:
	echo "================================================================"
	echo "DC synthesis environment:             "
	echo "  make update: Update rtl and netlists"
	echo "  make dc:     Run dc synthesis scripts"
	echo "  make clean:  Clean redundant files"
	echo "================================================================"
