-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1.2 (64-bit)
-- Version: 2022.1.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_video_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    s_axis_video_TVALID : IN STD_LOGIC;
    s_axis_video_TREADY : OUT STD_LOGIC;
    s_axis_video_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    s_axis_video_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    s_axis_video_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    s_axis_video_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    img_din : OUT STD_LOGIC_VECTOR (23 downto 0);
    img_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    img_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    img_full_n : IN STD_LOGIC;
    img_write : OUT STD_LOGIC;
    p_read : IN STD_LOGIC_VECTOR (11 downto 0);
    p_read1 : IN STD_LOGIC_VECTOR (11 downto 0);
    p_read2 : IN STD_LOGIC_VECTOR (2 downto 0);
    height_c10_din : OUT STD_LOGIC_VECTOR (11 downto 0);
    height_c10_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
    height_c10_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
    height_c10_full_n : IN STD_LOGIC;
    height_c10_write : OUT STD_LOGIC );
end;


architecture behav of system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (9 downto 0) := "0000000010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (9 downto 0) := "0000000100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (9 downto 0) := "0000001000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (9 downto 0) := "0000010000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (9 downto 0) := "0000100000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (9 downto 0) := "0001000000";
    constant ap_ST_fsm_state8 : STD_LOGIC_VECTOR (9 downto 0) := "0010000000";
    constant ap_ST_fsm_state9 : STD_LOGIC_VECTOR (9 downto 0) := "0100000000";
    constant ap_ST_fsm_state10 : STD_LOGIC_VECTOR (9 downto 0) := "1000000000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_6 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000110";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv32_7 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal height_c10_blk_n : STD_LOGIC;
    signal cond_fu_257_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cond_reg_387 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_reg_unsigned_short_s_fu_273_ap_return : STD_LOGIC_VECTOR (11 downto 0);
    signal rows_reg_392 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal grp_reg_unsigned_short_s_fu_278_ap_return : STD_LOGIC_VECTOR (11 downto 0);
    signal cols_reg_397 : STD_LOGIC_VECTOR (11 downto 0);
    signal cmp8460_fu_286_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp8460_reg_405 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_2_fu_304_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal i_2_reg_415 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_idle : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out_ap_vld : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_idle : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out_ap_vld : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out_ap_vld : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_idle : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld : STD_LOGIC;
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld : STD_LOGIC;
    signal axi_last_V_2_reg_140 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state10 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state10 : signal is "none";
    signal axi_data_2_lcssa_reg_150 : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal icmp_ln205_fu_299_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal axi_last_2_lcssa_reg_160 : STD_LOGIC_VECTOR (0 downto 0);
    signal eol_0_lcssa_reg_171 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal axi_data_V_2_fu_90 : STD_LOGIC_VECTOR (23 downto 0);
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state8 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state8 : signal is "none";
    signal ap_CS_fsm_state9 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state9 : signal is "none";
    signal axi_last_V_4_loc_fu_98 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fu_86 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal sof_fu_94 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ST_fsm_state5_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_ST_fsm_state7_blk : STD_LOGIC;
    signal ap_ST_fsm_state8_blk : STD_LOGIC;
    signal ap_ST_fsm_state9_blk : STD_LOGIC;
    signal ap_ST_fsm_state10_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        s_axis_video_TVALID : IN STD_LOGIC;
        s_axis_video_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
        s_axis_video_TREADY : OUT STD_LOGIC;
        s_axis_video_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        axi_data_V_out : OUT STD_LOGIC_VECTOR (23 downto 0);
        axi_data_V_out_ap_vld : OUT STD_LOGIC;
        axi_last_V_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        axi_last_V_out_ap_vld : OUT STD_LOGIC );
    end component;


    component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_width IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        s_axis_video_TVALID : IN STD_LOGIC;
        img_din : OUT STD_LOGIC_VECTOR (23 downto 0);
        img_num_data_valid : IN STD_LOGIC_VECTOR (1 downto 0);
        img_fifo_cap : IN STD_LOGIC_VECTOR (1 downto 0);
        img_full_n : IN STD_LOGIC;
        img_write : OUT STD_LOGIC;
        sof_2 : IN STD_LOGIC_VECTOR (0 downto 0);
        axi_last_V_2 : IN STD_LOGIC_VECTOR (0 downto 0);
        axi_data_V_2 : IN STD_LOGIC_VECTOR (23 downto 0);
        cols : IN STD_LOGIC_VECTOR (11 downto 0);
        cond : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
        s_axis_video_TREADY : OUT STD_LOGIC;
        s_axis_video_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        eol_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        eol_out_ap_vld : OUT STD_LOGIC;
        axi_data_V_3_out : OUT STD_LOGIC_VECTOR (23 downto 0);
        axi_data_V_3_out_ap_vld : OUT STD_LOGIC );
    end component;


    component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        s_axis_video_TVALID : IN STD_LOGIC;
        axi_data_2_lcssa : IN STD_LOGIC_VECTOR (23 downto 0);
        axi_last_2_lcssa : IN STD_LOGIC_VECTOR (0 downto 0);
        eol_0_lcssa : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
        s_axis_video_TREADY : OUT STD_LOGIC;
        s_axis_video_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
        s_axis_video_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        s_axis_video_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        axi_data_V_4_out : OUT STD_LOGIC_VECTOR (23 downto 0);
        axi_data_V_4_out_ap_vld : OUT STD_LOGIC;
        axi_last_V_4_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        axi_last_V_4_out_ap_vld : OUT STD_LOGIC );
    end component;


    component system_v_frmbuf_wr_0_0_reg_unsigned_short_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        d : IN STD_LOGIC_VECTOR (11 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (11 downto 0) );
    end component;



begin
    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183 : component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start,
        ap_done => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done,
        ap_idle => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_idle,
        ap_ready => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready,
        s_axis_video_TVALID => s_axis_video_TVALID,
        s_axis_video_TDATA => s_axis_video_TDATA,
        s_axis_video_TREADY => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY,
        s_axis_video_TKEEP => s_axis_video_TKEEP,
        s_axis_video_TSTRB => s_axis_video_TSTRB,
        s_axis_video_TUSER => s_axis_video_TUSER,
        s_axis_video_TLAST => s_axis_video_TLAST,
        s_axis_video_TID => s_axis_video_TID,
        s_axis_video_TDEST => s_axis_video_TDEST,
        axi_data_V_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out,
        axi_data_V_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld,
        axi_last_V_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out,
        axi_last_V_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out_ap_vld);

    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203 : component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_width
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start,
        ap_done => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done,
        ap_idle => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_idle,
        ap_ready => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready,
        s_axis_video_TVALID => s_axis_video_TVALID,
        img_din => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din,
        img_num_data_valid => ap_const_lv2_0,
        img_fifo_cap => ap_const_lv2_0,
        img_full_n => img_full_n,
        img_write => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write,
        sof_2 => sof_fu_94,
        axi_last_V_2 => axi_last_V_2_reg_140,
        axi_data_V_2 => axi_data_V_2_fu_90,
        cols => cols_reg_397,
        cond => cond_reg_387,
        s_axis_video_TDATA => s_axis_video_TDATA,
        s_axis_video_TREADY => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY,
        s_axis_video_TKEEP => s_axis_video_TKEEP,
        s_axis_video_TSTRB => s_axis_video_TSTRB,
        s_axis_video_TUSER => s_axis_video_TUSER,
        s_axis_video_TLAST => s_axis_video_TLAST,
        s_axis_video_TID => s_axis_video_TID,
        s_axis_video_TDEST => s_axis_video_TDEST,
        eol_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out,
        eol_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out_ap_vld,
        axi_data_V_3_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out,
        axi_data_V_3_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out_ap_vld);

    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231 : component system_v_frmbuf_wr_0_0_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start,
        ap_done => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done,
        ap_idle => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_idle,
        ap_ready => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready,
        s_axis_video_TVALID => s_axis_video_TVALID,
        axi_data_2_lcssa => axi_data_2_lcssa_reg_150,
        axi_last_2_lcssa => axi_last_2_lcssa_reg_160,
        eol_0_lcssa => eol_0_lcssa_reg_171,
        s_axis_video_TDATA => s_axis_video_TDATA,
        s_axis_video_TREADY => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY,
        s_axis_video_TKEEP => s_axis_video_TKEEP,
        s_axis_video_TSTRB => s_axis_video_TSTRB,
        s_axis_video_TUSER => s_axis_video_TUSER,
        s_axis_video_TLAST => s_axis_video_TLAST,
        s_axis_video_TID => s_axis_video_TID,
        s_axis_video_TDEST => s_axis_video_TDEST,
        axi_data_V_4_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out,
        axi_data_V_4_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld,
        axi_last_V_4_out => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out,
        axi_last_V_4_out_ap_vld => grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld);

    grp_reg_unsigned_short_s_fu_273 : component system_v_frmbuf_wr_0_0_reg_unsigned_short_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        d => p_read,
        ap_return => grp_reg_unsigned_short_s_fu_273_ap_return);

    grp_reg_unsigned_short_s_fu_278 : component system_v_frmbuf_wr_0_0_reg_unsigned_short_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        d => p_read1,
        ap_return => grp_reg_unsigned_short_s_fu_278_ap_return);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state8)) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_ready = ap_const_logic_1)) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_ready = ap_const_logic_1)) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= ap_const_logic_0;
            else
                if (((cmp8460_reg_405 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_0))) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_ready = ap_const_logic_1)) then 
                    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    axi_data_2_lcssa_reg_150_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp8460_reg_405 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_0))) then 
                axi_data_2_lcssa_reg_150 <= axi_data_V_2_fu_90;
            elsif (((cmp8460_reg_405 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
                axi_data_2_lcssa_reg_150 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_axi_data_V_3_out;
            end if; 
        end if;
    end process;

    axi_data_V_2_fu_90_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state9) and (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out_ap_vld = ap_const_logic_1))) then 
                axi_data_V_2_fu_90 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_data_V_4_out;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state3) and (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out_ap_vld = ap_const_logic_1))) then 
                axi_data_V_2_fu_90 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_data_V_out;
            end if; 
        end if;
    end process;

    axi_last_2_lcssa_reg_160_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp8460_reg_405 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_0))) then 
                axi_last_2_lcssa_reg_160 <= axi_last_V_2_reg_140;
            elsif (((cmp8460_reg_405 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
                axi_last_2_lcssa_reg_160 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out;
            end if; 
        end if;
    end process;

    axi_last_V_2_reg_140_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state10)) then 
                axi_last_V_2_reg_140 <= axi_last_V_4_loc_fu_98;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state4)) then 
                axi_last_V_2_reg_140 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_axi_last_V_out;
            end if; 
        end if;
    end process;

    eol_0_lcssa_reg_171_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp8460_reg_405 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_0))) then 
                eol_0_lcssa_reg_171 <= ap_const_lv1_0;
            elsif (((cmp8460_reg_405 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
                eol_0_lcssa_reg_171 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_eol_out;
            end if; 
        end if;
    end process;

    i_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_86 <= ap_const_lv12_0;
            elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                i_fu_86 <= i_2_reg_415;
            end if; 
        end if;
    end process;

    sof_fu_94_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                sof_fu_94 <= ap_const_lv1_1;
            elsif (((cmp8460_reg_405 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state7))) then 
                sof_fu_94 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state9) and (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out_ap_vld = ap_const_logic_1))) then
                axi_last_V_4_loc_fu_98 <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_axi_last_V_4_out;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
                cmp8460_reg_405 <= cmp8460_fu_286_p2;
                cols_reg_397 <= grp_reg_unsigned_short_s_fu_278_ap_return;
                rows_reg_392 <= grp_reg_unsigned_short_s_fu_273_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                cond_reg_387 <= cond_fu_257_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
                i_2_reg_415 <= i_2_fu_304_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, height_c10_full_n, cmp8460_reg_405, ap_CS_fsm_state5, grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done, grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done, grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done, icmp_ln205_fu_299_p2, ap_CS_fsm_state3, ap_CS_fsm_state6, ap_CS_fsm_state9)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                ap_NS_fsm <= ap_ST_fsm_state3;
            when ap_ST_fsm_state3 => 
                if (((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state4 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((cmp8460_reg_405 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state6 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state6) and (grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_state6;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state8;
            when ap_ST_fsm_state8 => 
                ap_NS_fsm <= ap_ST_fsm_state9;
            when ap_ST_fsm_state9 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state9) and (grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state10;
                else
                    ap_NS_fsm <= ap_ST_fsm_state9;
                end if;
            when ap_ST_fsm_state10 => 
                ap_NS_fsm <= ap_ST_fsm_state5;
            when others =>  
                ap_NS_fsm <= "XXXXXXXXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state10 <= ap_CS_fsm(9);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);
    ap_CS_fsm_state6 <= ap_CS_fsm(5);
    ap_CS_fsm_state7 <= ap_CS_fsm(6);
    ap_CS_fsm_state8 <= ap_CS_fsm(7);
    ap_CS_fsm_state9 <= ap_CS_fsm(8);
    ap_ST_fsm_state10_blk <= ap_const_logic_0;

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg, height_c10_full_n)
    begin
        if (((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;

    ap_ST_fsm_state3_blk_assign_proc : process(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done)
    begin
        if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state3_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state3_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state4_blk <= ap_const_logic_0;
    ap_ST_fsm_state5_blk <= ap_const_logic_0;

    ap_ST_fsm_state6_blk_assign_proc : process(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done)
    begin
        if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state6_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state6_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state7_blk <= ap_const_logic_0;
    ap_ST_fsm_state8_blk <= ap_const_logic_0;

    ap_ST_fsm_state9_blk_assign_proc : process(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done)
    begin
        if ((grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_done = ap_const_logic_0)) then 
            ap_ST_fsm_state9_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state9_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, height_c10_full_n)
    begin
                ap_block_state1 <= ((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state5, icmp_ln205_fu_299_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state5, icmp_ln205_fu_299_p2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (icmp_ln205_fu_299_p2 = ap_const_lv1_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    cmp8460_fu_286_p2 <= "1" when (grp_reg_unsigned_short_s_fu_278_ap_return = ap_const_lv12_0) else "0";
    cond_fu_257_p2 <= "1" when (p_read2 = ap_const_lv3_0) else "0";
    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_ap_start_reg;
    grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_ap_start_reg;
    grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_ap_start_reg;

    height_c10_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, height_c10_full_n)
    begin
        if ((not(((ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            height_c10_blk_n <= height_c10_full_n;
        else 
            height_c10_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    height_c10_din <= p_read;

    height_c10_write_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, height_c10_full_n)
    begin
        if ((not(((height_c10_full_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (ap_start = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            height_c10_write <= ap_const_logic_1;
        else 
            height_c10_write <= ap_const_logic_0;
        end if; 
    end process;

    i_2_fu_304_p2 <= std_logic_vector(unsigned(i_fu_86) + unsigned(ap_const_lv12_1));
    icmp_ln205_fu_299_p2 <= "1" when (i_fu_86 = rows_reg_392) else "0";
    img_din <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_din;

    img_write_assign_proc : process(grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write, ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            img_write <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_img_write;
        else 
            img_write <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_video_TREADY_assign_proc : process(grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY, grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY, grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY, ap_CS_fsm_state3, ap_CS_fsm_state6, ap_CS_fsm_state9)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state9)) then 
            s_axis_video_TREADY <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_eol_fu_231_s_axis_video_TREADY;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            s_axis_video_TREADY <= grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_203_s_axis_video_TREADY;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            s_axis_video_TREADY <= grp_AXIvideo2MultiPixStream_Pipeline_loop_wait_for_start_fu_183_s_axis_video_TREADY;
        else 
            s_axis_video_TREADY <= ap_const_logic_0;
        end if; 
    end process;

end behav;
