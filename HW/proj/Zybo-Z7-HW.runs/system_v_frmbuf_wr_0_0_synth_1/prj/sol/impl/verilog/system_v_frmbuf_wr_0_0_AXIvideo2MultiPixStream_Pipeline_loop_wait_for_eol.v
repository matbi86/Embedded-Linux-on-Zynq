// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Version: 2022.1.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        s_axis_video_TVALID,
        axi_data_2_lcssa,
        axi_last_2_lcssa,
        eol_0_lcssa,
        s_axis_video_TDATA,
        s_axis_video_TREADY,
        s_axis_video_TKEEP,
        s_axis_video_TSTRB,
        s_axis_video_TUSER,
        s_axis_video_TLAST,
        s_axis_video_TID,
        s_axis_video_TDEST,
        axi_data_V_4_out,
        axi_data_V_4_out_ap_vld,
        axi_last_V_4_out,
        axi_last_V_4_out_ap_vld
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   s_axis_video_TVALID;
input  [23:0] axi_data_2_lcssa;
input  [0:0] axi_last_2_lcssa;
input  [0:0] eol_0_lcssa;
input  [23:0] s_axis_video_TDATA;
output   s_axis_video_TREADY;
input  [2:0] s_axis_video_TKEEP;
input  [2:0] s_axis_video_TSTRB;
input  [0:0] s_axis_video_TUSER;
input  [0:0] s_axis_video_TLAST;
input  [0:0] s_axis_video_TID;
input  [0:0] s_axis_video_TDEST;
output  [23:0] axi_data_V_4_out;
output   axi_data_V_4_out_ap_vld;
output  [0:0] axi_last_V_4_out;
output   axi_last_V_4_out_ap_vld;

reg ap_idle;
reg s_axis_video_TREADY;
reg[23:0] axi_data_V_4_out;
reg axi_data_V_4_out_ap_vld;
reg axi_last_V_4_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [0:0] ap_phi_mux_eol_1_phi_fu_113_p4;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    s_axis_video_TDATA_blk_n;
reg   [0:0] axi_last_V_4_reg_99;
reg   [0:0] eol_1_reg_110;
reg   [0:0] ap_phi_mux_axi_last_V_4_phi_fu_102_p4;
wire    ap_loop_init;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

system_v_frmbuf_wr_0_0_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        axi_last_V_4_reg_99 <= s_axis_video_TLAST;
        eol_1_reg_110 <= s_axis_video_TLAST;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_axi_last_V_4_phi_fu_102_p4 = axi_last_2_lcssa;
    end else begin
        ap_phi_mux_axi_last_V_4_phi_fu_102_p4 = axi_last_V_4_reg_99;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_phi_mux_eol_1_phi_fu_113_p4 = eol_0_lcssa;
    end else begin
        ap_phi_mux_eol_1_phi_fu_113_p4 = eol_1_reg_110;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        if ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0)) begin
            axi_data_V_4_out = s_axis_video_TDATA;
        end else if ((ap_loop_init == 1'b1)) begin
            axi_data_V_4_out = axi_data_2_lcssa;
        end else begin
            axi_data_V_4_out = 'bx;
        end
    end else begin
        axi_data_V_4_out = 'bx;
    end
end

always @ (*) begin
    if (((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1)) | (~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1)))) begin
        axi_data_V_4_out_ap_vld = 1'b1;
    end else begin
        axi_data_V_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        axi_last_V_4_out_ap_vld = 1'b1;
    end else begin
        axi_last_V_4_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1) & (ap_start_int == 1'b1))) begin
        s_axis_video_TDATA_blk_n = s_axis_video_TVALID;
    end else begin
        s_axis_video_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0))) & (ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        s_axis_video_TREADY = 1'b1;
    end else begin
        s_axis_video_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((ap_phi_mux_eol_1_phi_fu_113_p4 == 1'd0) & (s_axis_video_TVALID == 1'b0)));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign axi_last_V_4_out = ap_phi_mux_axi_last_V_4_phi_fu_102_p4;

endmodule //system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol
