create_clock [get_ports clk] -name clk -domain clk -period 41.6667 -waveform {0 20.83}
set_input_delay 0 -clock clk  [get_ports {clk start rst change_mode_rsc_z* Comp_rsc_singleport_data_out* Src_rsc_singleport_data_out* Vga_rsc_singleport_data_out* nblevels_rsc_z*}]
set_input_delay 2.46 -clock clk  [get_ports Src_rsc_singleport_data_out(7:0)]
set_input_delay 2.46 -clock clk  [get_ports Comp_rsc_singleport_data_out(7:0)]
set_input_delay 2.46 -clock clk  [get_ports Vga_rsc_singleport_data_out(7:0)]
set_input_delay 0 -clock clk  [get_ports start]
set_input_delay 0 -clock clk  [get_ports nblevels_rsc_z(3:0)]
set_input_delay 0 -clock clk  [get_ports change_mode_rsc_z(3:0)]
set_output_delay 0 -clock clk  [get_ports {done nblevels_triosy_lz change_mode_triosy_lz Src_triosy_lz Vga_triosy_lz Comp_triosy_lz Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz Src_rsc_singleport_re Src_rsc_singleport_we Comp_rsc_singleport_re Comp_rsc_singleport_we Vga_rsc_singleport_re Vga_rsc_singleport_we Vga_rsc_singleport_data_in* Src_rsc_singleport_data_in* Comp_rsc_singleport_data_in* Src_rsc_singleport_addr* Comp_rsc_singleport_addr* Vga_rsc_singleport_addr*}]
set_output_delay 0.1 -clock clk  [get_ports Src_rsc_singleport_data_in(7:0)]
set_output_delay 0.1 -clock clk  [get_ports Src_rsc_singleport_addr(16:0)]
set_output_delay 0.1 -clock clk  [get_ports Src_rsc_singleport_re]
set_output_delay 0.1 -clock clk  [get_ports Src_rsc_singleport_we]
set_output_delay 0.1 -clock clk  [get_ports Comp_rsc_singleport_data_in(7:0)]
set_output_delay 0.1 -clock clk  [get_ports Comp_rsc_singleport_addr(16:0)]
set_output_delay 0.1 -clock clk  [get_ports Comp_rsc_singleport_re]
set_output_delay 0.1 -clock clk  [get_ports Comp_rsc_singleport_we]
set_output_delay 0.1 -clock clk  [get_ports Vga_rsc_singleport_data_in(7:0)]
set_output_delay 0.1 -clock clk  [get_ports Vga_rsc_singleport_addr(16:0)]
set_output_delay 0.1 -clock clk  [get_ports Vga_rsc_singleport_re]
set_output_delay 0.1 -clock clk  [get_ports Vga_rsc_singleport_we]
set_output_delay 0 -clock clk  [get_ports done]
set_output_delay 0 -clock clk  [get_ports Src_triosy_lz]
set_output_delay 0 -clock clk  [get_ports Comp_triosy_lz]
set_output_delay 0 -clock clk  [get_ports Vga_triosy_lz]
set_output_delay 0 -clock clk  [get_ports nblevels_triosy_lz]
set_output_delay 0 -clock clk  [get_ports change_mode_triosy_lz]
set_output_delay 0 -clock clk  [get_ports Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz]
set_clock_uncertainty [get_clocks clk]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Src_rsc_singleport_re]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Src_rsc_singleport_we]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Comp_rsc_singleport_re]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Comp_rsc_singleport_we]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Vga_rsc_singleport_re]
set_max_delay 41.6667 -from [get_ports start] -to [get_ports Vga_rsc_singleport_we]
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_addr(16:0)}
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_addr(16:0)}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Src_rsc_singleport_addr(16:0)}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_data_in(7:0)}
set_max_delay 41.6667 -from {start} -to {done}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start}
set_max_delay 41.6667 -from {start} -to {Src_triosy_lz}
set_max_delay 41.6667 -from {start} -to {Comp_triosy_lz}
set_max_delay 41.6667 -from {start} -to {Vga_triosy_lz}
set_max_delay 41.6667 -from {start} -to {nblevels_triosy_lz}
set_max_delay 41.6667 -from {start} -to {change_mode_triosy_lz}
set_max_delay 41.6667 -from {start} -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_max_delay 41.6667 -to {done}
set_max_delay 41.6667 -to {Src_rsc_singleport_re}
set_max_delay 41.6667 -to {Src_rsc_singleport_we}
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Comp_rsc_singleport_re}
set_max_delay 41.6667 -to {Comp_rsc_singleport_we}
# set_max_delay 41.6667 -from {Src_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Vga_rsc_singleport_re}
set_max_delay 41.6667 -to {Vga_rsc_singleport_we}
set_max_delay 41.6667 -to {Src_triosy_lz}
set_max_delay 41.6667 -to {Comp_triosy_lz}
set_max_delay 41.6667 -to {Vga_triosy_lz}
set_max_delay 41.6667 -to {nblevels_triosy_lz}
set_max_delay 41.6667 -to {change_mode_triosy_lz}
set_max_delay 41.6667 -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_max_delay 41.6667 -to {done}
set_max_delay 41.6667 -to {Src_rsc_singleport_re}
set_max_delay 41.6667 -to {Src_rsc_singleport_we}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Comp_rsc_singleport_re}
set_max_delay 41.6667 -to {Comp_rsc_singleport_we}
# set_max_delay 41.6667 -from {Comp_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Vga_rsc_singleport_re}
set_max_delay 41.6667 -to {Vga_rsc_singleport_we}
set_max_delay 41.6667 -to {Src_triosy_lz}
set_max_delay 41.6667 -to {Comp_triosy_lz}
set_max_delay 41.6667 -to {Vga_triosy_lz}
set_max_delay 41.6667 -to {nblevels_triosy_lz}
set_max_delay 41.6667 -to {change_mode_triosy_lz}
set_max_delay 41.6667 -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_max_delay 41.6667 -to {done}
set_max_delay 41.6667 -to {Src_rsc_singleport_re}
set_max_delay 41.6667 -to {Src_rsc_singleport_we}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Comp_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Comp_rsc_singleport_re}
set_max_delay 41.6667 -to {Comp_rsc_singleport_we}
# set_max_delay 41.6667 -from {Vga_rsc_singleport_data_out(7:0)} -to {Vga_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Vga_rsc_singleport_re}
set_max_delay 41.6667 -to {Vga_rsc_singleport_we}
set_max_delay 41.6667 -to {Src_triosy_lz}
set_max_delay 41.6667 -to {Comp_triosy_lz}
set_max_delay 41.6667 -to {Vga_triosy_lz}
set_max_delay 41.6667 -to {nblevels_triosy_lz}
set_max_delay 41.6667 -to {change_mode_triosy_lz}
set_max_delay 41.6667 -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_max_delay 41.6667 -to {done}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Src_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Src_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Src_rsc_singleport_re}
set_max_delay 41.6667 -to {Src_rsc_singleport_we}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Comp_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Comp_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Comp_rsc_singleport_re}
set_max_delay 41.6667 -to {Comp_rsc_singleport_we}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Vga_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {nblevels_rsc_z(3:0)} -to {Vga_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Vga_rsc_singleport_re}
set_max_delay 41.6667 -to {Vga_rsc_singleport_we}
set_max_delay 41.6667 -to {Src_triosy_lz}
set_max_delay 41.6667 -to {Comp_triosy_lz}
set_max_delay 41.6667 -to {Vga_triosy_lz}
set_max_delay 41.6667 -to {nblevels_triosy_lz}
set_max_delay 41.6667 -to {change_mode_triosy_lz}
set_max_delay 41.6667 -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_max_delay 41.6667 -to {done}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Src_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Src_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Src_rsc_singleport_re}
set_max_delay 41.6667 -to {Src_rsc_singleport_we}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Comp_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Comp_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Comp_rsc_singleport_re}
set_max_delay 41.6667 -to {Comp_rsc_singleport_we}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Vga_rsc_singleport_data_in(7:0)}
# set_max_delay 41.6667 -from {change_mode_rsc_z(3:0)} -to {Vga_rsc_singleport_addr(16:0)}
set_max_delay 41.6667 -to {Vga_rsc_singleport_re}
set_max_delay 41.6667 -to {Vga_rsc_singleport_we}
set_max_delay 41.6667 -to {Src_triosy_lz}
set_max_delay 41.6667 -to {Comp_triosy_lz}
set_max_delay 41.6667 -to {Vga_triosy_lz}
set_max_delay 41.6667 -to {nblevels_triosy_lz}
set_max_delay 41.6667 -to {change_mode_triosy_lz}
set_max_delay 41.6667 -to {Main_Comp_Decomp_tot_Main_Fonction_return_triosy_lz}
set_multicycle_path 6 -through [list [get_pins div_mgc_div/z[0]] [get_pins div_mgc_div/z[1]] [get_pins div_mgc_div/z[2]] [get_pins div_mgc_div/z[3]] [get_pins div_mgc_div/z[4]] [get_pins div_mgc_div/z[5]] [get_pins div_mgc_div/z[6]] [get_pins div_mgc_div/z[7]] [get_pins div_mgc_div/z[8]] [get_pins div_mgc_div/z[9]] [get_pins div_mgc_div/z[10]] [get_pins div_mgc_div/z[11]] [get_pins div_mgc_div/z[12]] [get_pins div_mgc_div/z[13]] [get_pins div_mgc_div/z[14]] [get_pins div_mgc_div/z[15]] [get_pins div_mgc_div/z[16]] [get_pins div_mgc_div/z[17]] [get_pins div_mgc_div/z[18]] [get_pins div_mgc_div/z[19]] [get_pins div_mgc_div/z[20]] [get_pins div_mgc_div/z[21]] [get_pins div_mgc_div/z[22]] [get_pins div_mgc_div/z[23]] [get_pins div_mgc_div/z[24]] [get_pins div_mgc_div/z[25]] [get_pins div_mgc_div/z[26]] [get_pins div_mgc_div/z[27]] [get_pins div_mgc_div/z[28]] [get_pins div_mgc_div/z[31]] [get_pins div_mgc_div/z[29]] [get_pins div_mgc_div/z[30]] [get_cells div_mgc_div] ]
set_multicycle_path 5 -through [list [get_pins div_mgc_div_1/z[25]] [get_pins div_mgc_div_1/z[26]] [get_pins div_mgc_div_1/z[27]] [get_pins div_mgc_div_1/z[28]] [get_pins div_mgc_div_1/z[29]] [get_pins div_mgc_div_1/z[30]] [get_pins div_mgc_div_1/z[31]] [get_pins div_mgc_div_1/z[0]] [get_pins div_mgc_div_1/z[1]] [get_pins div_mgc_div_1/z[2]] [get_pins div_mgc_div_1/z[3]] [get_pins div_mgc_div_1/z[4]] [get_pins div_mgc_div_1/z[5]] [get_pins div_mgc_div_1/z[6]] [get_pins div_mgc_div_1/z[7]] [get_pins div_mgc_div_1/z[8]] [get_pins div_mgc_div_1/z[9]] [get_pins div_mgc_div_1/z[10]] [get_pins div_mgc_div_1/z[21]] [get_pins div_mgc_div_1/z[11]] [get_pins div_mgc_div_1/z[12]] [get_pins div_mgc_div_1/z[13]] [get_pins div_mgc_div_1/z[14]] [get_pins div_mgc_div_1/z[15]] [get_pins div_mgc_div_1/z[22]] [get_pins div_mgc_div_1/z[23]] [get_pins div_mgc_div_1/z[16]] [get_pins div_mgc_div_1/z[17]] [get_pins div_mgc_div_1/z[24]] [get_pins div_mgc_div_1/z[18]] [get_pins div_mgc_div_1/z[19]] [get_pins div_mgc_div_1/z[20]] [get_cells div_mgc_div_1] ]
set_attribute -name HIERARCHY -value preserve -type default [get_cells div_mgc_div]
set_attribute -name HIERARCHY -value preserve -type default [get_cells div_mgc_div_1]
