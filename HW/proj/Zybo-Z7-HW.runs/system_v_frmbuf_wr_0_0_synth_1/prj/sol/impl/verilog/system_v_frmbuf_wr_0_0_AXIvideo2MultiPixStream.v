// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
// Version: 2022.1.2
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        s_axis_video_TDATA,
        s_axis_video_TVALID,
        s_axis_video_TREADY,
        s_axis_video_TKEEP,
        s_axis_video_TSTRB,
        s_axis_video_TUSER,
        s_axis_video_TLAST,
        s_axis_video_TID,
        s_axis_video_TDEST,
        img_din,
        img_num_data_valid,
        img_fifo_cap,
        img_full_n,
        img_write,
        p_read,
        p_read1,
        p_read2,
        height_c10_din,
        height_c10_num_data_valid,
        height_c10_fifo_cap,
        height_c10_full_n,
        height_c10_write
);

parameter    ap_ST_fsm_state1 = 10'd1;
parameter    ap_ST_fsm_state2 = 10'd2;
parameter    ap_ST_fsm_state3 = 10'd4;
parameter    ap_ST_fsm_state4 = 10'd8;
parameter    ap_ST_fsm_state5 = 10'd16;
parameter    ap_ST_fsm_state6 = 10'd32;
parameter    ap_ST_fsm_state7 = 10'd64;
parameter    ap_ST_fsm_state8 = 10'd128;
parameter    ap_ST_fsm_state9 = 10'd256;
parameter    ap_ST_fsm_state10 = 10'd512;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [23:0] s_axis_video_TDATA;
input   s_axis_video_TVALID;
output   s_axis_video_TREADY;
input  [2:0] s_axis_video_TKEEP;
input  [2:0] s_axis_video_TSTRB;
input  [0:0] s_axis_video_TUSER;
input  [0:0] s_axis_video_TLAST;
input  [0:0] s_axis_video_TID;
input  [0:0] s_axis_video_TDEST;
output  [23:0] img_din;
input  [1:0] img_num_data_valid;
input  [1:0] img_fifo_cap;
input   img_full_n;
output   img_write;
input  [11:0] p_read;
input  [11:0] p_read1;
input  [2:0] p_read2;
output  [11:0] height_c10_din;
input  [1:0] height_c10_num_data_valid;
input  [1:0] height_c10_fifo_cap;
input   height_c10_full_n;
output   height_c10_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg s_axis_video_TREADY;
reg img_write;
reg height_c10_write;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [9:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    height_c10_blk_n;
wire   [0:0] cond_fu_257_p2;
reg   [0:0] cond_reg_387;
wire   [11:0] grp_reg_unsigned_short_s_fu_273_ap_return;
reg   [11:0] rows_reg_392;
wire    ap_CS_fsm_state4;
wire   [11:0] grp_reg_unsigned_short_s_fu_278_ap_return;
reg   [11:0] cols_reg_397;
wire   [0:0] cmp8460_fu_286_p2;
reg   [0:0] cmp8460_reg_405;
wire   [11:0] i_2_fu_304_p2;
reg   [11:0] i_2_reg_415;
wire    ap_CS_fsm_state5;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_idle;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY;
wire   [23:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld;
wire   [0:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out_ap_vld;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_idle;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready;
wire   [23:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY;
wire   [0:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out_ap_vld;
wire   [23:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out_ap_vld;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_idle;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY;
wire   [23:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld;
wire   [0:0] grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out;
wire    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld;
reg   [0:0] axi_last_V_2_reg_140;
wire    ap_CS_fsm_state10;
reg   [23:0] axi_data_2_lcssa_reg_150;
wire    ap_CS_fsm_state7;
wire   [0:0] icmp_ln205_fu_299_p2;
reg   [0:0] axi_last_2_lcssa_reg_160;
reg   [0:0] eol_0_lcssa_reg_171;
reg    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg;
wire    ap_CS_fsm_state2;
wire    ap_CS_fsm_state3;
reg   [23:0] axi_data_V_2_fu_90;
reg    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg;
wire    ap_CS_fsm_state6;
reg    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg;
wire    ap_CS_fsm_state8;
wire    ap_CS_fsm_state9;
reg   [0:0] axi_last_V_4_loc_fu_98;
reg   [11:0] i_fu_86;
reg    ap_block_state1;
reg   [0:0] sof_fu_94;
reg   [9:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
reg    ap_ST_fsm_state3_blk;
wire    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    ap_ST_fsm_state7_blk;
wire    ap_ST_fsm_state8_blk;
reg    ap_ST_fsm_state9_blk;
wire    ap_ST_fsm_state10_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 10'd1;
#0 grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg = 1'b0;
#0 grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg = 1'b0;
#0 grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg = 1'b0;
end

system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start),
    .ap_done(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done),
    .ap_idle(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_idle),
    .ap_ready(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready),
    .s_axis_video_TVALID(s_axis_video_TVALID),
    .s_axis_video_TDATA(s_axis_video_TDATA),
    .s_axis_video_TREADY(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY),
    .s_axis_video_TKEEP(s_axis_video_TKEEP),
    .s_axis_video_TSTRB(s_axis_video_TSTRB),
    .s_axis_video_TUSER(s_axis_video_TUSER),
    .s_axis_video_TLAST(s_axis_video_TLAST),
    .s_axis_video_TID(s_axis_video_TID),
    .s_axis_video_TDEST(s_axis_video_TDEST),
    .axi_data_V_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out),
    .axi_data_V_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld),
    .axi_last_V_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out),
    .axi_last_V_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out_ap_vld)
);

system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_width grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start),
    .ap_done(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done),
    .ap_idle(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_idle),
    .ap_ready(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready),
    .s_axis_video_TVALID(s_axis_video_TVALID),
    .img_din(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din),
    .img_num_data_valid(2'd0),
    .img_fifo_cap(2'd0),
    .img_full_n(img_full_n),
    .img_write(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write),
    .sof_2(sof_fu_94),
    .axi_last_V_2(axi_last_V_2_reg_140),
    .axi_data_V_2(axi_data_V_2_fu_90),
    .cols(cols_reg_397),
    .cond(cond_reg_387),
    .s_axis_video_TDATA(s_axis_video_TDATA),
    .s_axis_video_TREADY(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY),
    .s_axis_video_TKEEP(s_axis_video_TKEEP),
    .s_axis_video_TSTRB(s_axis_video_TSTRB),
    .s_axis_video_TUSER(s_axis_video_TUSER),
    .s_axis_video_TLAST(s_axis_video_TLAST),
    .s_axis_video_TID(s_axis_video_TID),
    .s_axis_video_TDEST(s_axis_video_TDEST),
    .eol_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out),
    .eol_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out_ap_vld),
    .axi_data_V_3_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out),
    .axi_data_V_3_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out_ap_vld)
);

system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start),
    .ap_done(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done),
    .ap_idle(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_idle),
    .ap_ready(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready),
    .s_axis_video_TVALID(s_axis_video_TVALID),
    .axi_data_2_lcssa(axi_data_2_lcssa_reg_150),
    .axi_last_2_lcssa(axi_last_2_lcssa_reg_160),
    .eol_0_lcssa(eol_0_lcssa_reg_171),
    .s_axis_video_TDATA(s_axis_video_TDATA),
    .s_axis_video_TREADY(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY),
    .s_axis_video_TKEEP(s_axis_video_TKEEP),
    .s_axis_video_TSTRB(s_axis_video_TSTRB),
    .s_axis_video_TUSER(s_axis_video_TUSER),
    .s_axis_video_TLAST(s_axis_video_TLAST),
    .s_axis_video_TID(s_axis_video_TID),
    .s_axis_video_TDEST(s_axis_video_TDEST),
    .axi_data_V_4_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out),
    .axi_data_V_4_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld),
    .axi_last_V_4_out(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out),
    .axi_last_V_4_out_ap_vld(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld)
);

system_v_frmbuf_wr_0_0_reg_unsigned_short_s grp_reg_unsigned_short_s_fu_273(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .d(p_read),
    .ap_return(grp_reg_unsigned_short_s_fu_273_ap_return)
);

system_v_frmbuf_wr_0_0_reg_unsigned_short_s grp_reg_unsigned_short_s_fu_278(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .d(p_read1),
    .ap_return(grp_reg_unsigned_short_s_fu_278_ap_return)
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
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= 1'b1;
        end else if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready == 1'b1)) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= 1'b1;
        end else if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready == 1'b1)) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= 1'b0;
    end else begin
        if (((cmp8460_reg_405 == 1'd0) & (1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd0))) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= 1'b1;
        end else if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready == 1'b1)) begin
            grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((cmp8460_reg_405 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd0))) begin
        axi_data_2_lcssa_reg_150 <= axi_data_V_2_fu_90;
    end else if (((cmp8460_reg_405 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        axi_data_2_lcssa_reg_150 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state9) & (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld == 1'b1))) begin
        axi_data_V_2_fu_90 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out;
    end else if (((1'b1 == ap_CS_fsm_state3) & (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld == 1'b1))) begin
        axi_data_V_2_fu_90 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp8460_reg_405 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd0))) begin
        axi_last_2_lcssa_reg_160 <= axi_last_V_2_reg_140;
    end else if (((cmp8460_reg_405 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        axi_last_2_lcssa_reg_160 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        axi_last_V_2_reg_140 <= axi_last_V_4_loc_fu_98;
    end else if ((1'b1 == ap_CS_fsm_state4)) begin
        axi_last_V_2_reg_140 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out;
    end
end

always @ (posedge ap_clk) begin
    if (((cmp8460_reg_405 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd0))) begin
        eol_0_lcssa_reg_171 <= 1'd0;
    end else if (((cmp8460_reg_405 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        eol_0_lcssa_reg_171 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out;
    end
end

always @ (posedge ap_clk) begin
    if ((~((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        i_fu_86 <= 12'd0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        i_fu_86 <= i_2_reg_415;
    end
end

always @ (posedge ap_clk) begin
    if ((~((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        sof_fu_94 <= 1'd1;
    end else if (((cmp8460_reg_405 == 1'd0) & (1'b1 == ap_CS_fsm_state7))) begin
        sof_fu_94 <= 1'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state9) & (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld == 1'b1))) begin
        axi_last_V_4_loc_fu_98 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        cmp8460_reg_405 <= cmp8460_fu_286_p2;
        cols_reg_397 <= grp_reg_unsigned_short_s_fu_278_ap_return;
        rows_reg_392 <= grp_reg_unsigned_short_s_fu_273_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        cond_reg_387 <= cond_fu_257_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        i_2_reg_415 <= i_2_fu_304_p2;
    end
end

assign ap_ST_fsm_state10_blk = 1'b0;

always @ (*) begin
    if (((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

always @ (*) begin
    if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done == 1'b0)) begin
        ap_ST_fsm_state3_blk = 1'b1;
    end else begin
        ap_ST_fsm_state3_blk = 1'b0;
    end
end

assign ap_ST_fsm_state4_blk = 1'b0;

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done == 1'b0)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

assign ap_ST_fsm_state7_blk = 1'b0;

assign ap_ST_fsm_state8_blk = 1'b0;

always @ (*) begin
    if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done == 1'b0)) begin
        ap_ST_fsm_state9_blk = 1'b1;
    end else begin
        ap_ST_fsm_state9_blk = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_c10_blk_n = height_c10_full_n;
    end else begin
        height_c10_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        height_c10_write = 1'b1;
    end else begin
        height_c10_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        img_write = grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write;
    end else begin
        img_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        s_axis_video_TREADY = grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        s_axis_video_TREADY = grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        s_axis_video_TREADY = grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY;
    end else begin
        s_axis_video_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            if (((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((cmp8460_reg_405 == 1'd1) & (1'b1 == ap_CS_fsm_state5) & (icmp_ln205_fu_299_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((1'b1 == ap_CS_fsm_state6) & (grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_CS_fsm_state9) & (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_block_state1 = ((height_c10_full_n == 1'b0) | (ap_done_reg == 1'b1) | (ap_start == 1'b0));
end

assign cmp8460_fu_286_p2 = ((grp_reg_unsigned_short_s_fu_278_ap_return == 12'd0) ? 1'b1 : 1'b0);

assign cond_fu_257_p2 = ((p_read2 == 3'd0) ? 1'b1 : 1'b0);

assign grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start = grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg;

assign grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start = grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg;

assign grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start = grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg;

assign height_c10_din = p_read;

assign i_2_fu_304_p2 = (i_fu_86 + 12'd1);

assign icmp_ln205_fu_299_p2 = ((i_fu_86 == rows_reg_392) ? 1'b1 : 1'b0);

assign img_din = grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din;

endmodule //system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream
