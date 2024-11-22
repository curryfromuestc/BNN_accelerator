set rvt_stb_lib  "gsmc13_ss_1p08v_125c"
set PROC_PATH    [concat /home/zxt/GSMC13/GSMC13/FEView_STDIO/VS-GSMC-13-Design-Kit-V1.001/STD/Synopsys]
set SYNOPSYS_ROOT [concat /app/synopsys/dc_1409/libraries/syn]
set SYMBOL_LIBRARY_PATH [concat /home/zxt/GSMC13/GSMC13/FEView_STDIO/VS-GSMC-13-Design-Kit-V1.001/STD/Symbol/synopsys]

set search_path   [concat $search_path \
                          $SYNOPSYS_ROOT \
                          $PROC_PATH \
                          ${SYNOPSYS_ROOT}/sdb \
                          $SYMBOL_LIBRARY_PATH 
                       ]
                    
set target_library [concat ${rvt_stb_lib}.db]
set_min_library gsmc13_ss_1p08v_125c.db -min_version gsmc13_ff_1p32v_-40c.db
set link_path   ""
#Always memory library path
#always design ware path if used
set synthetic_library "dw_foundation.sldb"

set link_library  [concat "*" $target_library $synthetic_library ]

set symbol_library "gsmc13.sdb"

set MAX_COND    ss_1p08v_125c
set MAX_LIB     gsmc13_ss_1p08v_125c
set MIN_COND    ff_1p32v_-40c
set MIN_LIB     gsmc13_ff_1p32v_-40c

set TECH_FILE     "/home/zxt/GSMC13/GSMC13/BEView_STDIO/VS-HG-13-Tapeout-Kit-V1.003/TECH/gsmc13_apollo_m6.tf"
set TLUPLUS_MAP   "/home/zxt/GSMC13/itf2TLUPlus_cell/tech2itf.map"
set TLUPLUS_CMAX  "/home/zxt/GSMC13/itf2TLUPlus_cell/GSMC_R013S6G0_cell_max.tluplus"
set TLUPLUS_CMIN   "/home/zxt/GSMC13/itf2TLUPlus_cell/GSMC_R013S6G0_cell_min.tluplus"

set stdcel_mws "
/home/zxt/GSMC13/GSMC13/BEView_STDIO/VS-GSMC-13-Tapeout-Kit-V1.001/STD/Milkyway/GSMC13STDLIBM6
"

set MW_REFERENCE_LIB_DIRS "$stdcel_mws"
set MW_DESIGN_LIBRARY "./mw/${TOP}_rtl_LIB"
#set_dont_use $stb_lib/DFF*_X2_A9TH 
#set_dont_use $stb_lib/DFF*_X1_A9TH 
#set_dont_use $stb_lib/DFF*_XL_A9TH 
#set_dont_use $stb_lib/*BUF*
#set_dont_use $stb_lib/XNOR*
#set_dont_use $stb_lib/DLY*
#set_dont_use $stb_lib/*_XL_A9TH 
#set_dont_use $stb_lib/*BUF*
#set_dont_use $stb_lib/TIEHI*
#set_dont_use $stb_lib/TIELO*

