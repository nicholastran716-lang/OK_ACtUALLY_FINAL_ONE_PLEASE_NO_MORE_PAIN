#! /usr/bin/vvp
:ivl_version "12.0 (stable)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision - 12;
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/system.vpi";
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/vhdl_sys.vpi";
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/vhdl_textio.vpi";
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/v2005_math.vpi";
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/va_math.vpi";
:vpi_module "/usr/lib/aarch64-linux-gnu/ivl/v2009.vpi";
S_0xaaaae57b8740 .scope package, "$unit" "$unit" 2 1;
 .timescale 0 0;
S_0xaaaae57b88d0 .scope module, "wave_button_auto_repeat" "wave_button_auto_repeat" 3 2;
 .timescale -9 -12;
v0xaaaae57dffe0_0 .var "button", 0 0;
v0xaaaae57e0080_0 .var "clk", 0 0;
v0xaaaae57e0140_0 .net "pulse", 0 0, L_0xaaaae57e0900;  1 drivers
S_0xaaaae57b3ea0 .scope module, "dut" "button_auto_repeat" 3 14, 4 6 0, S_0xaaaae57b88d0;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "button";
    .port_info 2 /OUTPUT 1 "pulse";
P_0xaaaae579f800 .param/l "HOLD_CYCLES" 0 4 7, +C4<00000000000000000000000000001000>;
P_0xaaaae579f840 .param/l "REPEAT_CYCLES" 0 4 10, +C4<00000000000000000000000000000011>;
L_0xaaaae57e0890 .functor AND 1, v0xaaaae57dffe0_0, L_0xaaaae57e0780, C4<1>, C4<1>;
L_0xaaaae57e0900 .functor OR 1, L_0xaaaae57a44c0, L_0xaaaae57e0890, C4<0>, C4<0>;
v0xaaaae57dfa10_0 .net *"_ivl_0", 0 0, L_0xaaaae57e0890;  1 drivers
v0xaaaae57dfaf0_0 .net "button", 0 0, v0xaaaae57dffe0_0;  1 drivers
v0xaaaae57dfc00_0 .net "clk", 0 0, v0xaaaae57e0080_0;  1 drivers
v0xaaaae57dfca0_0 .net "held", 0 0, L_0xaaaae57e0360;  1 drivers
v0xaaaae57dfd90_0 .net "pulse", 0 0, L_0xaaaae57e0900;  alias, 1 drivers
v0xaaaae57dfe80_0 .net "pulse_train", 0 0, L_0xaaaae57e0780;  1 drivers
v0xaaaae57dff20_0 .net "rise", 0 0, L_0xaaaae57a44c0;  1 drivers
S_0xaaaae57b4120 .scope module, "u_bhd" "button_hold_detect" 4 29, 5 4 0, S_0xaaaae57b3ea0;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "button";
    .port_info 2 /OUTPUT 1 "held";
P_0xaaaae57b8a60 .param/l "CountMax" 1 5 12, +C4<00000000000000000000000000001000>;
P_0xaaaae57b8aa0 .param/l "CountWidth" 1 5 13, +C4<00000000000000000000000000000100>;
P_0xaaaae57b8ae0 .param/l "HOLD_CYCLES" 0 5 5, +C4<00000000000000000000000000001000>;
L_0xffff8e896018 .functor BUFT 1, C4<1000>, C4<0>, C4<0>, C4<0>;
v0xaaaae57dd6f0_0 .net/2u *"_ivl_0", 3 0, L_0xffff8e896018;  1 drivers
v0xaaaae57dd7f0_0 .net "button", 0 0, v0xaaaae57dffe0_0;  alias, 1 drivers
v0xaaaae57dd8b0_0 .net "clk", 0 0, v0xaaaae57e0080_0;  alias, 1 drivers
v0xaaaae57dd950_0 .net "count", 3 0, v0xaaaae57a72a0_0;  1 drivers
v0xaaaae57dda20_0 .var "count_enable", 0 0;
v0xaaaae57ddb10_0 .var "count_rst", 0 0;
v0xaaaae57ddbe0_0 .net "held", 0 0, L_0xaaaae57e0360;  alias, 1 drivers
E_0xaaaae57c1480 .event anyedge, v0xaaaae57dd7f0_0, v0xaaaae57a72a0_0;
L_0xaaaae57e0360 .cmp/eq 4, v0xaaaae57a72a0_0, L_0xffff8e896018;
S_0xaaaae57bbb40 .scope module, "u_counter" "mod_n_counter" 5 24, 6 3 0, S_0xaaaae57b4120;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "enable";
    .port_info 2 /INPUT 1 "rst";
    .port_info 3 /OUTPUT 4 "count";
P_0xaaaae57bbd20 .param/l "MaxCount" 1 6 12, C4<1000>;
P_0xaaaae57bbd60 .param/l "N" 0 6 4, +C4<00000000000000000000000000001001>;
P_0xaaaae57bbda0 .param/l "WIDTH" 0 6 5, +C4<00000000000000000000000000000100>;
v0xaaaae57a96c0_0 .net "clk", 0 0, v0xaaaae57e0080_0;  alias, 1 drivers
v0xaaaae57a72a0_0 .var "count", 3 0;
v0xaaaae57a45e0_0 .net "enable", 0 0, v0xaaaae57dda20_0;  1 drivers
v0xaaaae57dd480_0 .var "next_count", 3 0;
v0xaaaae57dd560_0 .net "rst", 0 0, v0xaaaae57ddb10_0;  1 drivers
E_0xaaaae57c1070 .event anyedge, v0xaaaae57a72a0_0, v0xaaaae57a45e0_0;
E_0xaaaae57c1670 .event posedge, v0xaaaae57a96c0_0;
S_0xaaaae57ddca0 .scope module, "u_red" "rising_edge_detector" 4 21, 7 3 0, S_0xaaaae57b3ea0;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "sig_in";
    .port_info 2 /OUTPUT 1 "rise";
L_0xaaaae57a44c0 .functor AND 1, v0xaaaae57dffe0_0, L_0xaaaae57e0210, C4<1>, C4<1>;
v0xaaaae57dded0_0 .net *"_ivl_1", 0 0, L_0xaaaae57e0210;  1 drivers
v0xaaaae57ddfb0_0 .net "clk", 0 0, v0xaaaae57e0080_0;  alias, 1 drivers
v0xaaaae57de0c0_0 .net "rise", 0 0, L_0xaaaae57a44c0;  alias, 1 drivers
v0xaaaae57de160_0 .net "sig_in", 0 0, v0xaaaae57dffe0_0;  alias, 1 drivers
v0xaaaae57de230_0 .var "sign_in_before", 0 0;
L_0xaaaae57e0210 .reduce/nor v0xaaaae57de230_0;
S_0xaaaae57de380 .scope module, "u_rg" "restartable_rate_generator" 4 37, 8 3 0, S_0xaaaae57b3ea0;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "run";
    .port_info 2 /OUTPUT 1 "tick";
P_0xaaaae57de560 .param/l "CYCLE_COUNT" 0 8 4, +C4<00000000000000000000000000000011>;
L_0xaaaae57e0780 .functor AND 1, v0xaaaae57df7c0_0, L_0xaaaae57e0640, C4<1>, C4<1>;
v0xaaaae57df650_0 .net "clk", 0 0, v0xaaaae57e0080_0;  alias, 1 drivers
v0xaaaae57df6f0_0 .net "run", 0 0, L_0xaaaae57e0360;  alias, 1 drivers
v0xaaaae57df7c0_0 .var "running", 0 0;
v0xaaaae57df890_0 .net "tick", 0 0, L_0xaaaae57e0780;  alias, 1 drivers
v0xaaaae57df930_0 .net "tick_quantifier", 0 0, L_0xaaaae57e0640;  1 drivers
S_0xaaaae57de680 .scope generate, "g_general" "g_general" 8 18, 8 18 0, S_0xaaaae57de380;
 .timescale -9 -12;
P_0xaaaae57de860 .param/l "CountWidth" 1 8 19, +C4<00000000000000000000000000000010>;
L_0xaaaae57e0590 .functor BUFZ 1, L_0xaaaae57e0360, C4<0>, C4<0>, C4<0>;
L_0xffff8e896060 .functor BUFT 1, C4<10>, C4<0>, C4<0>, C4<0>;
v0xaaaae57df2c0_0 .net/2u *"_ivl_4", 1 0, L_0xffff8e896060;  1 drivers
v0xaaaae57df3c0_0 .net "count", 1 0, v0xaaaae57deea0_0;  1 drivers
v0xaaaae57df480_0 .net "enable_count", 0 0, L_0xaaaae57e0590;  1 drivers
v0xaaaae57df580_0 .net "rst_count", 0 0, L_0xaaaae57e04a0;  1 drivers
L_0xaaaae57e04a0 .reduce/nor L_0xaaaae57e0360;
L_0xaaaae57e0640 .cmp/eq 2, L_0xffff8e896060, v0xaaaae57deea0_0;
S_0xaaaae57de930 .scope module, "u_count" "mod_n_counter" 8 27, 6 3 0, S_0xaaaae57de680;
 .timescale -9 -12;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "enable";
    .port_info 2 /INPUT 1 "rst";
    .port_info 3 /OUTPUT 2 "count";
P_0xaaaae57deb30 .param/l "MaxCount" 1 6 12, C4<10>;
P_0xaaaae57deb70 .param/l "N" 0 6 4, +C4<00000000000000000000000000000011>;
P_0xaaaae57debb0 .param/l "WIDTH" 0 6 5, +C4<00000000000000000000000000000010>;
v0xaaaae57dede0_0 .net "clk", 0 0, v0xaaaae57e0080_0;  alias, 1 drivers
v0xaaaae57deea0_0 .var "count", 1 0;
v0xaaaae57def80_0 .net "enable", 0 0, L_0xaaaae57e0590;  alias, 1 drivers
v0xaaaae57df050_0 .var "next_count", 1 0;
v0xaaaae57df130_0 .net "rst", 0 0, L_0xaaaae57e04a0;  alias, 1 drivers
E_0xaaaae57c1290 .event anyedge, v0xaaaae57deea0_0, v0xaaaae57def80_0;
    .scope S_0xaaaae57ddca0;
T_0 ;
    %wait E_0xaaaae57c1670;
    %load/vec4 v0xaaaae57de160_0;
    %assign/vec4 v0xaaaae57de230_0, 0;
    %jmp T_0;
    .thread T_0;
    .scope S_0xaaaae57bbb40;
T_1 ;
    %pushi/vec4 0, 0, 4;
    %store/vec4 v0xaaaae57a72a0_0, 0, 4;
    %end;
    .thread T_1;
    .scope S_0xaaaae57bbb40;
T_2 ;
    %wait E_0xaaaae57c1670;
    %load/vec4 v0xaaaae57dd560_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.0, 8;
    %pushi/vec4 0, 0, 4;
    %assign/vec4 v0xaaaae57a72a0_0, 0;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v0xaaaae57a45e0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.2, 8;
    %load/vec4 v0xaaaae57dd480_0;
    %assign/vec4 v0xaaaae57a72a0_0, 0;
T_2.2 ;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
    .scope S_0xaaaae57bbb40;
T_3 ;
Ewait_0 .event/or E_0xaaaae57c1070, E_0x0;
    %wait Ewait_0;
    %load/vec4 v0xaaaae57a72a0_0;
    %store/vec4 v0xaaaae57dd480_0, 0, 4;
    %load/vec4 v0xaaaae57a45e0_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_3.0, 8;
    %load/vec4 v0xaaaae57a72a0_0;
    %cmpi/e 8, 0, 4;
    %jmp/0xz  T_3.2, 4;
    %pushi/vec4 0, 0, 4;
    %store/vec4 v0xaaaae57dd480_0, 0, 4;
    %jmp T_3.3;
T_3.2 ;
    %load/vec4 v0xaaaae57a72a0_0;
    %addi 1, 0, 4;
    %store/vec4 v0xaaaae57dd480_0, 0, 4;
T_3.3 ;
T_3.0 ;
    %jmp T_3;
    .thread T_3, $push;
    .scope S_0xaaaae57b4120;
T_4 ;
Ewait_1 .event/or E_0xaaaae57c1480, E_0x0;
    %wait Ewait_1;
    %load/vec4 v0xaaaae57dd7f0_0;
    %nor/r;
    %store/vec4 v0xaaaae57ddb10_0, 0, 1;
    %load/vec4 v0xaaaae57dd7f0_0;
    %flag_set/vec4 8;
    %flag_get/vec4 8;
    %jmp/0 T_4.0, 8;
    %load/vec4 v0xaaaae57dd950_0;
    %cmpi/u 8, 0, 4;
    %flag_get/vec4 5;
    %and;
T_4.0;
    %store/vec4 v0xaaaae57dda20_0, 0, 1;
    %jmp T_4;
    .thread T_4, $push;
    .scope S_0xaaaae57de930;
T_5 ;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v0xaaaae57deea0_0, 0, 2;
    %end;
    .thread T_5;
    .scope S_0xaaaae57de930;
T_6 ;
    %wait E_0xaaaae57c1670;
    %load/vec4 v0xaaaae57df130_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_6.0, 8;
    %pushi/vec4 0, 0, 2;
    %assign/vec4 v0xaaaae57deea0_0, 0;
    %jmp T_6.1;
T_6.0 ;
    %load/vec4 v0xaaaae57def80_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_6.2, 8;
    %load/vec4 v0xaaaae57df050_0;
    %assign/vec4 v0xaaaae57deea0_0, 0;
T_6.2 ;
T_6.1 ;
    %jmp T_6;
    .thread T_6;
    .scope S_0xaaaae57de930;
T_7 ;
Ewait_2 .event/or E_0xaaaae57c1290, E_0x0;
    %wait Ewait_2;
    %load/vec4 v0xaaaae57deea0_0;
    %store/vec4 v0xaaaae57df050_0, 0, 2;
    %load/vec4 v0xaaaae57def80_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_7.0, 8;
    %load/vec4 v0xaaaae57deea0_0;
    %cmpi/e 2, 0, 2;
    %jmp/0xz  T_7.2, 4;
    %pushi/vec4 0, 0, 2;
    %store/vec4 v0xaaaae57df050_0, 0, 2;
    %jmp T_7.3;
T_7.2 ;
    %load/vec4 v0xaaaae57deea0_0;
    %addi 1, 0, 2;
    %store/vec4 v0xaaaae57df050_0, 0, 2;
T_7.3 ;
T_7.0 ;
    %jmp T_7;
    .thread T_7, $push;
    .scope S_0xaaaae57de380;
T_8 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57df7c0_0, 0, 1;
    %end;
    .thread T_8, $init;
    .scope S_0xaaaae57de380;
T_9 ;
    %wait E_0xaaaae57c1670;
    %load/vec4 v0xaaaae57df6f0_0;
    %assign/vec4 v0xaaaae57df7c0_0, 0;
    %jmp T_9;
    .thread T_9;
    .scope S_0xaaaae57b88d0;
T_10 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57e0080_0, 0, 1;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %end;
    .thread T_10, $init;
    .scope S_0xaaaae57b88d0;
T_11 ;
    %delay 5000, 0;
    %load/vec4 v0xaaaae57e0080_0;
    %inv;
    %store/vec4 v0xaaaae57e0080_0, 0, 1;
    %jmp T_11;
    .thread T_11;
    .scope S_0xaaaae57b88d0;
T_12 ;
    %vpi_call/w 3 23 "$dumpfile", "wave_button_auto_repeat.vcd" {0 0 0};
    %vpi_call/w 3 24 "$dumpvars", 32'sb00000000000000000000000000000000, S_0xaaaae57b88d0 {0 0 0};
    %delay 30000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 160000, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 30000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 30000, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 30000, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 160000, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0xaaaae57dffe0_0, 0, 1;
    %delay 30000, 0;
    %vpi_call/w 3 44 "$finish" {0 0 0};
    %end;
    .thread T_12;
# The file index is used to find the file name in the following table.
:file_names 9;
    "N/A";
    "<interactive>";
    "-";
    "tb/wave_button_auto_repeat.v";
    "rtl/button_auto_repeat.sv";
    "./rtl/button_hold_detect.sv";
    "./rtl/mod_n_counter.sv";
    "./rtl/rising_edge_detector.sv";
    "./rtl/restartable_rate_generator.sv";
