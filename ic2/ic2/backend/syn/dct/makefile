# ============================== backend Variables define========================= #
FP_FILE = ./inputs/icc2dct.fp

SCAN = 0
FILE_LIST = ./inputs/backend_file.list
SPG_PLACEMENT_DEF =./inputs/${TOP}.placed.def
SAIF_FILE =./inputs/${TOP}.saif

# Variables setting for dc scripts
CMD = -x "set FUNC_SDC  ./inputs/${TOP}.func.sdc;\
		  set ID_SDC ./inputs/io.sdc; \
	  	  set RTL ./inputs/$(TOP).v;\
		  set TOP $(TOP); \
		  set SCAN $(SCAN); \
		  set FP_FILE $(FP_FILE); \
          set FILE_LIST $(FILE_LIST); \
          set SPG_PLACEMENT_DEF $(SPG_PLACEMENT_DEF); \
          set SAIF_FILE ${SAIF_FILE}"
#====================================================================
# Update sdc and netlist to inputs/ directory
update:
	cp ../../sdc/*.func.sdc  ./inputs/${TOP}.func.sdc
	cp ../../sdc/io.sdc ./inputs/
	cp ../../rel/*.v       ./inputs/
	sed 's/\(^`define.*SIM\)/\/\/\1/' -i ./inputs/*.v

# Backup dct outputs file and reports file
IS_EXIST  := exist
DIR_BP_R  := 

exist := $(shell if [ -d $(DIR_BP) ]; then echo "exist"; else echo "noexist"; fi;)

ifeq ($(exist), ${IS_EXIST})
DIR_BP_R := ${DIR_BP}_new
else
DIR_BP_R := ${DIR_BP}
endif

backup:
	mkdir ${DIR_BP_R}
	cp -rf ./inputs ${DIR_BP_R}
	cp -rf ./outputs ${DIR_BP_R}
	cp -rf ./reports ${DIR_BP_R}
	@echo "DCT backup finished!"

# DC synthesis
dc:
	dc_shell-xg-t -topo -no_gui $(CMD) -f ./script/dc.tcl | tee dc.log

# Clean redundant files
clean:
	rm -rf .DC_log* command.log dc.log default.svf *.log MODULE_ALL.v lib \
		   reports/*  outputs/*  crte* *.svf *.html *.log novas.* *.syn *.pvl *.mr \
		   clogBmBmNp *.csh