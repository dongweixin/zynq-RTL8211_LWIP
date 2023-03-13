connect -url tcp:127.0.0.1:3121
source D:/RCJ/RCJ14E/RCJ14E_pro_wending/rcj21E_lwip_2019/rcj21E_lwip_2019.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870" && level==0} -index 1
fpga -file D:/RCJ/RCJ14E/RCJ14E_pro_wending/rcj21E_lwip_2019/rcj21E_lwip_2019.sdk/design_1_wrapper_hw_platform_0/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
loadhw -hw D:/RCJ/RCJ14E/RCJ14E_pro_wending/rcj21E_lwip_2019/rcj21E_lwip_2019.sdk/design_1_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent JTAG-SMT2 210251A08870"} -index 0
dow D:/RCJ/RCJ14E/RCJ14E_pro_wending/rcj21E_lwip_2019/rcj21E_lwip_2019.sdk/main/Debug/main.elf
configparams force-mem-access 0
bpadd -addr &main
