//  Catapult University Version 2011a.200 (Production Release) Mon Jun  2 22:10:04 PDT 2014
//  
//  Copyright (c) Calypto Design Systems, Inc., 1996-2014, All Rights Reserved.
//                       UNPUBLISHED, LICENSED SOFTWARE.
//            CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//          PROPERTY OF CALYPTO DESIGN SYSTEMS OR ITS LICENSORS
//  
//  Running on Linux xph3sle512@cimeld21 3.2.0-4-amd64 #1 SMP Debian 3.2.68-1+deb7u3 x86_64
//  
//  Package information: SIFLIBS v17.0_1.1, HLS_PKGS v17.0_1.1, 
//                       DesignPad v2.78_0.0
//  
//  This version may only be used for academic purposes.  Some optimizations 
//  are disabled, so results obtained from this version may be sub-optimal.
//  
project new
flow package require /SCVerify
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Decompressor.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Trans_Ond.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/globals.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Compressor.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Inv_Wave.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Compressor.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Exchange.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/model.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Inv_Wave.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Exchange.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/model.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Comp_Decomp_Tot.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Decompressor.cpp -type C++
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Trans_Ond.h -type CHEADER
solution file add ../Rendu/src/CPP_for_Catapult/comp_decomp_tot/Main_Comp_Decomp_Tot.cpp -type C++
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -FSM_ENCODING none
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -RESET_CLEARS_ALL_REGS true
directive set -ASSIGN_OVERHEAD 0
directive set -DESIGN_GOAL area
directive set -OLD_SCHED false
directive set -PIPELINE_RAMP_UP true
directive set -COMPGRADE fast
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 256
directive set -MEM_MAP_THRESHOLD 32
directive set -UNROLL no
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS -1
go analyze
directive set -TRANSACTION_DONE_SIGNAL true
directive set -DONE_FLAG done
directive set -START_FLAG start
directive set -CLOCK_NAME clk
directive set -CLOCKS {clk {-CLOCK_PERIOD 41.6666666667 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 20.83 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_NAME {} -ENABLE_ACTIVE high}}
directive set -TECHLIBS {{mgc_Xilinx-ARTIX-7-1_beh_psr.lib {{mgc_Xilinx-ARTIX-7-1_beh_psr part 7A100TCSG324}}} {ram_Xilinx-ARTIX-7-1_RAMSB.lib ram_Xilinx-ARTIX-7-1_RAMSB}}
directive set -DESIGN_HIERARCHY Main_Comp_Decomp_Tot::Main_Fonction
go compile
go extract
