// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1.2 (lin64) Build 3605665 Fri Aug  5 22:52:02 MDT 2022
// Date        : Mon Jan 15 06:37:41 2024
// Host        : ubuntu running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_mipi_csi2_rx_subsystem_0_0_stub.v
// Design      : system_mipi_csi2_rx_subsystem_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bd_ca02,Vivado 2022.1.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(lite_aclk, lite_aresetn, dphy_clk_200M, 
  dlyctrl_rdy_out, rxbyteclkhs, system_rst_out, csirxss_csi_irq, video_aclk, video_aresetn, 
  csirxss_s_axi_awaddr, csirxss_s_axi_awprot, csirxss_s_axi_awvalid, 
  csirxss_s_axi_awready, csirxss_s_axi_wdata, csirxss_s_axi_wstrb, csirxss_s_axi_wvalid, 
  csirxss_s_axi_wready, csirxss_s_axi_bresp, csirxss_s_axi_bvalid, csirxss_s_axi_bready, 
  csirxss_s_axi_araddr, csirxss_s_axi_arprot, csirxss_s_axi_arvalid, 
  csirxss_s_axi_arready, csirxss_s_axi_rdata, csirxss_s_axi_rresp, csirxss_s_axi_rvalid, 
  csirxss_s_axi_rready, video_out_tdata, video_out_tdest, video_out_tlast, 
  video_out_tready, video_out_tuser, video_out_tvalid, mipi_phy_if_clk_hs_n, 
  mipi_phy_if_clk_hs_p, mipi_phy_if_clk_lp_n, mipi_phy_if_clk_lp_p, 
  mipi_phy_if_data_hs_n, mipi_phy_if_data_hs_p, mipi_phy_if_data_lp_n, 
  mipi_phy_if_data_lp_p)
/* synthesis syn_black_box black_box_pad_pin="lite_aclk,lite_aresetn,dphy_clk_200M,dlyctrl_rdy_out,rxbyteclkhs,system_rst_out,csirxss_csi_irq,video_aclk,video_aresetn,csirxss_s_axi_awaddr[12:0],csirxss_s_axi_awprot[2:0],csirxss_s_axi_awvalid[0:0],csirxss_s_axi_awready[0:0],csirxss_s_axi_wdata[31:0],csirxss_s_axi_wstrb[3:0],csirxss_s_axi_wvalid[0:0],csirxss_s_axi_wready[0:0],csirxss_s_axi_bresp[1:0],csirxss_s_axi_bvalid[0:0],csirxss_s_axi_bready[0:0],csirxss_s_axi_araddr[12:0],csirxss_s_axi_arprot[2:0],csirxss_s_axi_arvalid[0:0],csirxss_s_axi_arready[0:0],csirxss_s_axi_rdata[31:0],csirxss_s_axi_rresp[1:0],csirxss_s_axi_rvalid[0:0],csirxss_s_axi_rready[0:0],video_out_tdata[15:0],video_out_tdest[9:0],video_out_tlast,video_out_tready,video_out_tuser[0:0],video_out_tvalid,mipi_phy_if_clk_hs_n,mipi_phy_if_clk_hs_p,mipi_phy_if_clk_lp_n,mipi_phy_if_clk_lp_p,mipi_phy_if_data_hs_n[1:0],mipi_phy_if_data_hs_p[1:0],mipi_phy_if_data_lp_n[1:0],mipi_phy_if_data_lp_p[1:0]" */;
  input lite_aclk;
  input lite_aresetn;
  input dphy_clk_200M;
  output dlyctrl_rdy_out;
  output rxbyteclkhs;
  output system_rst_out;
  output csirxss_csi_irq;
  input video_aclk;
  input video_aresetn;
  input [12:0]csirxss_s_axi_awaddr;
  input [2:0]csirxss_s_axi_awprot;
  input [0:0]csirxss_s_axi_awvalid;
  output [0:0]csirxss_s_axi_awready;
  input [31:0]csirxss_s_axi_wdata;
  input [3:0]csirxss_s_axi_wstrb;
  input [0:0]csirxss_s_axi_wvalid;
  output [0:0]csirxss_s_axi_wready;
  output [1:0]csirxss_s_axi_bresp;
  output [0:0]csirxss_s_axi_bvalid;
  input [0:0]csirxss_s_axi_bready;
  input [12:0]csirxss_s_axi_araddr;
  input [2:0]csirxss_s_axi_arprot;
  input [0:0]csirxss_s_axi_arvalid;
  output [0:0]csirxss_s_axi_arready;
  output [31:0]csirxss_s_axi_rdata;
  output [1:0]csirxss_s_axi_rresp;
  output [0:0]csirxss_s_axi_rvalid;
  input [0:0]csirxss_s_axi_rready;
  output [15:0]video_out_tdata;
  output [9:0]video_out_tdest;
  output video_out_tlast;
  input video_out_tready;
  output [0:0]video_out_tuser;
  output video_out_tvalid;
  input mipi_phy_if_clk_hs_n;
  input mipi_phy_if_clk_hs_p;
  input mipi_phy_if_clk_lp_n;
  input mipi_phy_if_clk_lp_p;
  input [1:0]mipi_phy_if_data_hs_n;
  input [1:0]mipi_phy_if_data_hs_p;
  input [1:0]mipi_phy_if_data_lp_n;
  input [1:0]mipi_phy_if_data_lp_p;
endmodule
