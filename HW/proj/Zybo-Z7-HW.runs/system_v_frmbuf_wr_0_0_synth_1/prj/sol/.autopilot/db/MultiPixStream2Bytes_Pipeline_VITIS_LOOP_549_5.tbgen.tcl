set moduleName MultiPixStream2Bytes_Pipeline_VITIS_LOOP_549_5
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set C_modelName {MultiPixStream2Bytes_Pipeline_VITIS_LOOP_549_5}
set C_modelType { void 0 }
set C_modelArgList {
	{ p_0_1_0_0_0260_3112_lcssa124 int 8 regular  }
	{ p_0_0_0_0_0258_3108_lcssa121 int 8 regular  }
	{ trunc_ln534_1 int 13 regular  }
	{ bytePlanes_plane01 int 64 regular {fifo 1 volatile }  }
	{ icmp_ln539 int 1 regular  }
	{ cmp121_2 int 1 regular  }
	{ cmp121_1 int 1 regular  }
	{ sub118_cast57 int 13 regular  }
	{ cmp121 int 1 regular  }
	{ img int 24 regular {fifo 0 volatile }  }
	{ p_0_1_0_0_0260_3111_out int 8 regular {pointer 1}  }
	{ p_0_0_0_0_0258_3107_out int 8 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p_0_1_0_0_0260_3112_lcssa124", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_0_0_0_0258_3108_lcssa121", "interface" : "wire", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln534_1", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "bytePlanes_plane01", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "icmp_ln539", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cmp121_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "cmp121_1", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sub118_cast57", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "cmp121", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "img", "interface" : "fifo", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "p_0_1_0_0_0260_3111_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p_0_0_0_0_0258_3107_out", "interface" : "wire", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ img_dout sc_in sc_lv 24 signal 9 } 
	{ img_num_data_valid sc_in sc_lv 2 signal 9 } 
	{ img_fifo_cap sc_in sc_lv 2 signal 9 } 
	{ img_empty_n sc_in sc_logic 1 signal 9 } 
	{ img_read sc_out sc_logic 1 signal 9 } 
	{ p_0_1_0_0_0260_3112_lcssa124 sc_in sc_lv 8 signal 0 } 
	{ p_0_0_0_0_0258_3108_lcssa121 sc_in sc_lv 8 signal 1 } 
	{ trunc_ln534_1 sc_in sc_lv 13 signal 2 } 
	{ bytePlanes_plane01_din sc_out sc_lv 64 signal 3 } 
	{ bytePlanes_plane01_num_data_valid sc_in sc_lv 11 signal 3 } 
	{ bytePlanes_plane01_fifo_cap sc_in sc_lv 11 signal 3 } 
	{ bytePlanes_plane01_full_n sc_in sc_logic 1 signal 3 } 
	{ bytePlanes_plane01_write sc_out sc_logic 1 signal 3 } 
	{ icmp_ln539 sc_in sc_lv 1 signal 4 } 
	{ cmp121_2 sc_in sc_lv 1 signal 5 } 
	{ cmp121_1 sc_in sc_lv 1 signal 6 } 
	{ sub118_cast57 sc_in sc_lv 13 signal 7 } 
	{ cmp121 sc_in sc_lv 1 signal 8 } 
	{ p_0_1_0_0_0260_3111_out sc_out sc_lv 8 signal 10 } 
	{ p_0_1_0_0_0260_3111_out_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ p_0_0_0_0_0258_3107_out sc_out sc_lv 8 signal 11 } 
	{ p_0_0_0_0_0258_3107_out_ap_vld sc_out sc_logic 1 outvld 11 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "img_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "img", "role": "dout" }} , 
 	{ "name": "img_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "img", "role": "num_data_valid" }} , 
 	{ "name": "img_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "img", "role": "fifo_cap" }} , 
 	{ "name": "img_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "empty_n" }} , 
 	{ "name": "img_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "img", "role": "read" }} , 
 	{ "name": "p_0_1_0_0_0260_3112_lcssa124", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_1_0_0_0260_3112_lcssa124", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0258_3108_lcssa121", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0258_3108_lcssa121", "role": "default" }} , 
 	{ "name": "trunc_ln534_1", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "trunc_ln534_1", "role": "default" }} , 
 	{ "name": "bytePlanes_plane01_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "bytePlanes_plane01", "role": "din" }} , 
 	{ "name": "bytePlanes_plane01_num_data_valid", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "bytePlanes_plane01", "role": "num_data_valid" }} , 
 	{ "name": "bytePlanes_plane01_fifo_cap", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "bytePlanes_plane01", "role": "fifo_cap" }} , 
 	{ "name": "bytePlanes_plane01_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane01", "role": "full_n" }} , 
 	{ "name": "bytePlanes_plane01_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bytePlanes_plane01", "role": "write" }} , 
 	{ "name": "icmp_ln539", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp_ln539", "role": "default" }} , 
 	{ "name": "cmp121_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp121_2", "role": "default" }} , 
 	{ "name": "cmp121_1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp121_1", "role": "default" }} , 
 	{ "name": "sub118_cast57", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "sub118_cast57", "role": "default" }} , 
 	{ "name": "cmp121", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp121", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_0260_3111_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_1_0_0_0260_3111_out", "role": "default" }} , 
 	{ "name": "p_0_1_0_0_0260_3111_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_1_0_0_0260_3111_out", "role": "ap_vld" }} , 
 	{ "name": "p_0_0_0_0_0258_3107_out", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p_0_0_0_0_0258_3107_out", "role": "default" }} , 
 	{ "name": "p_0_0_0_0_0258_3107_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "p_0_0_0_0_0258_3107_out", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "MultiPixStream2Bytes_Pipeline_VITIS_LOOP_549_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "32772",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_0_1_0_0_0260_3112_lcssa124", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_0_0_0_0_0258_3108_lcssa121", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln534_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "bytePlanes_plane01", "Type" : "Fifo", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "bytePlanes_plane01_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "icmp_ln539", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp121_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp121_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub118_cast57", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp121", "Type" : "None", "Direction" : "I"},
			{"Name" : "img", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "img_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p_0_1_0_0_0260_3111_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_0_0_0_0_0258_3107_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_549_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	MultiPixStream2Bytes_Pipeline_VITIS_LOOP_549_5 {
		p_0_1_0_0_0260_3112_lcssa124 {Type I LastRead 0 FirstWrite -1}
		p_0_0_0_0_0258_3108_lcssa121 {Type I LastRead 0 FirstWrite -1}
		trunc_ln534_1 {Type I LastRead 0 FirstWrite -1}
		bytePlanes_plane01 {Type O LastRead -1 FirstWrite 5}
		icmp_ln539 {Type I LastRead 0 FirstWrite -1}
		cmp121_2 {Type I LastRead 0 FirstWrite -1}
		cmp121_1 {Type I LastRead 0 FirstWrite -1}
		sub118_cast57 {Type I LastRead 0 FirstWrite -1}
		cmp121 {Type I LastRead 0 FirstWrite -1}
		img {Type I LastRead 4 FirstWrite -1}
		p_0_1_0_0_0260_3111_out {Type O LastRead -1 FirstWrite 2}
		p_0_0_0_0_0258_3107_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "32772"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "32772"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p_0_1_0_0_0260_3112_lcssa124 { ap_none {  { p_0_1_0_0_0260_3112_lcssa124 in_data 0 8 } } }
	p_0_0_0_0_0258_3108_lcssa121 { ap_none {  { p_0_0_0_0_0258_3108_lcssa121 in_data 0 8 } } }
	trunc_ln534_1 { ap_none {  { trunc_ln534_1 in_data 0 13 } } }
	bytePlanes_plane01 { ap_fifo {  { bytePlanes_plane01_din fifo_port_we 1 64 }  { bytePlanes_plane01_num_data_valid fifo_status_num_data_valid 0 11 }  { bytePlanes_plane01_fifo_cap fifo_update 0 11 }  { bytePlanes_plane01_full_n fifo_status 0 1 }  { bytePlanes_plane01_write fifo_data 1 1 } } }
	icmp_ln539 { ap_none {  { icmp_ln539 in_data 0 1 } } }
	cmp121_2 { ap_none {  { cmp121_2 in_data 0 1 } } }
	cmp121_1 { ap_none {  { cmp121_1 in_data 0 1 } } }
	sub118_cast57 { ap_none {  { sub118_cast57 in_data 0 13 } } }
	cmp121 { ap_none {  { cmp121 in_data 0 1 } } }
	img { ap_fifo {  { img_dout fifo_port_we 0 24 }  { img_num_data_valid fifo_status_num_data_valid 0 2 }  { img_fifo_cap fifo_update 0 2 }  { img_empty_n fifo_status 0 1 }  { img_read fifo_data 1 1 } } }
	p_0_1_0_0_0260_3111_out { ap_vld {  { p_0_1_0_0_0260_3111_out out_data 1 8 }  { p_0_1_0_0_0260_3111_out_ap_vld out_vld 1 1 } } }
	p_0_0_0_0_0258_3107_out { ap_vld {  { p_0_0_0_0_0258_3107_out out_data 1 8 }  { p_0_0_0_0_0258_3107_out_ap_vld out_vld 1 1 } } }
}
