set PROC_PATH    [concat /home/app/PDK/SMIC/SMIC55LL/Stdcell/SCC55NLL_VHS_RVT_V2.1/SCC55NLL_VHS_RVT_V2p1/liberty/1.2v /home/app/PDK/SMIC/SMIC55LL/Stdcell/SCC55NLL_VHS_LVT_V2.1/SCC55NLL_VHS_LVT_V2p1/liberty/1.2v]

set SYNOPSYS_ROOT [concat /app/synopsys/dc1409/libraries/syn]

set SYMBOL_LIBRARY_PATH [concat /home/app/PDK/SMIC/SMIC55LL/Stdcell/SCC55NLL_VHS_RVT_V2.1/SCC55NLL_VHS_RVT_V2p1/symbol /home/app/PDK/SMIC/SMIC55LL/Stdcell/SCC55NLL_VHS_LVT_V2.1/SCC55NLL_VHS_LVT_V2p1/symbol]

set IO_PATH [concat /home/app/PDK/SMIC/SMIC55LL/IO/SP55NLLD2P_3P3V_V0p5/SP55NLLD2P_3P3V_V0p5/syn/3p3v]

set MEM_PATH [concat /home/lyh/Desktop/qua_backend/power/smic_lib/scheduler128x32/db /home/lyh/Desktop/qua_backend/power/smic_lib/sram127x1024/db /home/lyh/Desktop/qua_backend/power/smic_lib/sum8x1024/db]

set PARA_PATH [concat /home/lyh/Desktop/qua_backend/power/rtl/quantization_rtl]

set_app_var search_path   [concat ${search_path} ${SYNOPSYS_ROOT} ${PROC_PATH} ${SYNOPSYS_ROOT}/sdb ${SYMBOL_LIBRARY_PATH} ${PARA_PATH} ${IO_PATH} ${MEM_PATH}]

set rvt_stb_lib  "scc55nll_vhs_rvt_ss_v1p08_125c_basic"
set lvt_stb_lib  "scc55nll_vhs_lvt_ss_v1p08_125c_basic"

#############################################################################################################################################################
set_app_var target_library [concat ${rvt_stb_lib}.db ${lvt_stb_lib}.db]
set_app_var synthetic_library "dw_foundation.sldb"
set_app_var symbol_library "scc55nll_vhs_rvt.sdb"

set std_libs [join "
scc55nll_vhs_rvt_ss_v1p08_125c_basic.db
scc55nll_vhs_rvt_ff_v1p32_-40c_basic.db
scc55nll_vhs_lvt_ss_v1p08_125c_basic.db
scc55nll_vhs_lvt_ff_v1p32_-40c_basic.db
"]
set io_libs "SP55NLLD2P_3P3V_V0p3_ss_v1p08_125C.db SP55NLLD2P_3P3V_V0p3_ff_v1p32_-40C.db"
set mem_libs "scheduler128x32_ss_1.08_125.db \
scheduler128x32_ff_1.32_0.db \
sram127x1024_ss_1.08_-40.db \
sram127x1024_ff_1.32_0.db \
sum8x1024_ss_1.08_125.db \
sum8x1024_ff_1.32_-40.db"

#  List of max min library pairs "max1 min1 max2 min2 max3 min3"...
set MIN_LIBRARY_FILES             "${std_libs} ${io_libs} ${mem_libs}"

set_app_var link_library  [concat "*" ${target_library} ${synthetic_library} ${MIN_LIBRARY_FILES}]

foreach {max_library min_library} ${MIN_LIBRARY_FILES} {
set_min_library ${max_library} -min_version ${min_library}
}


