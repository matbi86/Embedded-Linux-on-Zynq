-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:mipi_csi2_rx_subsystem:5.1
-- IP Revision: 5

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY system_mipi_csi2_rx_subsystem_0_0 IS
  PORT (
    lite_aclk : IN STD_LOGIC;
    lite_aresetn : IN STD_LOGIC;
    dphy_clk_200M : IN STD_LOGIC;
    dlyctrl_rdy_out : OUT STD_LOGIC;
    rxbyteclkhs : OUT STD_LOGIC;
    system_rst_out : OUT STD_LOGIC;
    csirxss_csi_irq : OUT STD_LOGIC;
    video_aclk : IN STD_LOGIC;
    video_aresetn : IN STD_LOGIC;
    csirxss_s_axi_awaddr : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    csirxss_s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    csirxss_s_axi_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    csirxss_s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    csirxss_s_axi_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    csirxss_s_axi_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_araddr : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
    csirxss_s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    csirxss_s_axi_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    csirxss_s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    csirxss_s_axi_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    csirxss_s_axi_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    video_out_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    video_out_tdest : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    video_out_tlast : OUT STD_LOGIC;
    video_out_tready : IN STD_LOGIC;
    video_out_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    video_out_tvalid : OUT STD_LOGIC;
    mipi_phy_if_clk_hs_n : IN STD_LOGIC;
    mipi_phy_if_clk_hs_p : IN STD_LOGIC;
    mipi_phy_if_clk_lp_n : IN STD_LOGIC;
    mipi_phy_if_clk_lp_p : IN STD_LOGIC;
    mipi_phy_if_data_hs_n : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    mipi_phy_if_data_hs_p : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    mipi_phy_if_data_lp_n : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    mipi_phy_if_data_lp_p : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END system_mipi_csi2_rx_subsystem_0_0;

ARCHITECTURE system_mipi_csi2_rx_subsystem_0_0_arch OF system_mipi_csi2_rx_subsystem_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF system_mipi_csi2_rx_subsystem_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT bd_ca02 IS
    PORT (
      lite_aclk : IN STD_LOGIC;
      lite_aresetn : IN STD_LOGIC;
      dphy_clk_200M : IN STD_LOGIC;
      dlyctrl_rdy_out : OUT STD_LOGIC;
      rxbyteclkhs : OUT STD_LOGIC;
      system_rst_out : OUT STD_LOGIC;
      csirxss_csi_irq : OUT STD_LOGIC;
      video_aclk : IN STD_LOGIC;
      video_aresetn : IN STD_LOGIC;
      csirxss_s_axi_awaddr : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      csirxss_s_axi_awprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      csirxss_s_axi_awvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_awready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      csirxss_s_axi_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      csirxss_s_axi_wvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_wready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      csirxss_s_axi_bvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_bready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_araddr : IN STD_LOGIC_VECTOR(12 DOWNTO 0);
      csirxss_s_axi_arprot : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      csirxss_s_axi_arvalid : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_arready : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      csirxss_s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      csirxss_s_axi_rvalid : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      csirxss_s_axi_rready : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      video_out_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      video_out_tdest : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
      video_out_tlast : OUT STD_LOGIC;
      video_out_tready : IN STD_LOGIC;
      video_out_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      video_out_tvalid : OUT STD_LOGIC;
      mipi_phy_if_clk_hs_n : IN STD_LOGIC;
      mipi_phy_if_clk_hs_p : IN STD_LOGIC;
      mipi_phy_if_clk_lp_n : IN STD_LOGIC;
      mipi_phy_if_clk_lp_p : IN STD_LOGIC;
      mipi_phy_if_data_hs_n : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      mipi_phy_if_data_hs_p : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      mipi_phy_if_data_lp_n : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      mipi_phy_if_data_lp_p : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
  END COMPONENT bd_ca02;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF system_mipi_csi2_rx_subsystem_0_0_arch: ARCHITECTURE IS "bd_ca02,Vivado 2022.1.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF system_mipi_csi2_rx_subsystem_0_0_arch : ARCHITECTURE IS "system_mipi_csi2_rx_subsystem_0_0,bd_ca02,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF system_mipi_csi2_rx_subsystem_0_0_arch: ARCHITECTURE IS "system_mipi_csi2_rx_subsystem_0_0,bd_ca02,{x_ipProduct=Vivado 2022.1.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=mipi_csi2_rx_subsystem,x_ipVersion=5.1,x_ipCoreRevision=5,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_EN_RXPPI_AS_MON=false,C_EXDESBOARD_VERSION=2,C_INT_QOR_CHECK=0,C_LPRX_DISABLE_EXTPORT=0,C_OOC_VID_CLK=6.666,C_CLK_IO_SWAP=false,C_DL0_IO_SWAP=false,C_DL1_IO_SWAP=false,C_DL2_IO_SWAP=false,C_DL3_IO_SWAP=false,C_CLK_LP_IO_SWAP=false,C_DL0_LP_IO_SWAP=false,C_DL1_LP_IO_SWAP=false,C_DL2_" & 
"LP_IO_SWAP=false,C_DL3_LP_IO_SWAP=false,VFB_TU_WIDTH=1,C_IDLY_GROUP_NAME=mipi_csi2rx_idly_group,C_EN_EXDESIGNS=false,C_EXDES_BOARD=ZCU102,C_EXDES_FMC=LI-IMX274MIPI-FMC V1.0 Single Sensor,C_EXDES_CONFIG=MIPI_Video_Pipe_Camera_to_Display,C_CSI2RX_DBG=0,C_MIPI_SLV_INT=0,C_CSI_OPT1_REGS=false,C_CSI_EN_CRC=true,C_CSI_EN_ACTIVELANES=false,DPHY_PRESET=CSI2RX_XLNX,C_STRETCH_LINE_RATE=3500,C_DPHY_MODE=SLAVE,C_EN_BG0_PIN0=false,C_EN_BG0_PIN6=false,C_EN_BG1_PIN0=false,C_EN_BG1_PIN6=false,C_EN_BG2_PIN0=fals" & 
"e,C_EN_BG2_PIN6=false,C_EN_BG3_PIN0=false,C_EN_BG3_PIN6=false,CMN_PXL_FORMAT=YUV422_8bit,CMN_NUM_LANES=2,C_EN_7S_LINERATE_CHECK=false,C_DPHY_LANES=2,YUV420_BUF_DPTH=128,C_EN_CSI_V2_0=false,C_EN_VCX=false,C_SPRT_ISP_BRIDGE=false,CMN_VC=All,CMN_NUM_PIXELS=1,CMN_INC_IIC=false,CMN_INC_VFB=true,CMN_PROJ_FAMILY=0,CMN_FIFO_RD_EN_CNTRL=true,C_HS_LINE_RATE=800,DPY_LINE_RATE=800,DPY_EN_REG_IF=true,CSI_EMB_NON_IMG=false,CSI_BUF_DEPTH=4096,AXIS_TDATA_WIDTH=32,AXIS_TUSER_WIDTH=96,AXIS_TDEST_WIDTH=4,HP_IO_BAN" & 
"K_SELECTION=64,CLK_LANE_IO_LOC=None,DATA_LANE0_IO_LOC=None,DATA_LANE1_IO_LOC=None,DATA_LANE2_IO_LOC=None,DATA_LANE3_IO_LOC=None,DATA_LANE0_BYTE=All_Byte,DATA_LANE1_BYTE=All_Byte,DATA_LANE2_BYTE=All_Byte,DATA_LANE3_BYTE=All_Byte,CLK_LANE_IO_LOC_NAME=None,DATA_LANE0_IO_LOC_NAME=None,DATA_LANE1_IO_LOC_NAME=None,DATA_LANE2_IO_LOC_NAME=None,DATA_LANE3_IO_LOC_NAME=None,SupportLevel=1,C_CLK_LANE_IO_POSITION=0,C_DATA_LANE0_IO_POSITION=2,C_DATA_LANE1_IO_POSITION=4,C_DATA_LANE2_IO_POSITION=6,C_DATA_LANE3_" & 
"IO_POSITION=8,C_IS_7SERIES=true,C_IS_VERSAL=false,C_EN_CNTS_BYTE_CLK=false,C_RCVE_DESKEW_SEQ=false,C_RCVE_ALT_DESKEW_SEQ=false,C_CAL_MODE=FIXED,C_IDLY_TAP=2,C_EN_EXT_TAP=false,C_EN_CLK300M=false,C_SHARE_IDLYCTRL=true,C_FIFO_RD_EN_CONTROL=true,C_HS_SETTLE_NS=147,C_EN_TIMEOUT_REGS=false,C_HS_TIMEOUT=65541,C_ESC_TIMEOUT=25600,C_INIT=100000,C_CSI_FILTER_USERDATATYPE=false,USE_BOARD_FLOW=false,DPHYRX_BOARD_INTERFACE=Custom,CSI_CONTROLLER_REG_IF=true,Component_Name=system_mipi_csi2_rx_subsystem_0_0}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF csirxss_csi_irq: SIGNAL IS "XIL_INTERFACENAME INTR.csirxss_csi_irq, SENSITIVITY LEVEL_HIGH, PORTWIDTH 1";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_csi_irq: SIGNAL IS "xilinx.com:signal:interrupt:1.0 INTR.csirxss_csi_irq INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_araddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_arprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_arready: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_arvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi ARVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF csirxss_s_axi_awaddr: SIGNAL IS "XIL_INTERFACENAME csirxss_s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 13, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, NUM_READ_TH" & 
"READS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_awaddr: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_awprot: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_awready: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_awvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_bready: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_bresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_bvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_rdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_rready: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_rresp: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_rvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_wdata: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_wready: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_wstrb: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF csirxss_s_axi_wvalid: SIGNAL IS "xilinx.com:interface:aximm:1.0 csirxss_s_axi WVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF dphy_clk_200M: SIGNAL IS "XIL_INTERFACENAME CLK.dphy_clk_200M, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF dphy_clk_200M: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.dphy_clk_200M CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF lite_aclk: SIGNAL IS "XIL_INTERFACENAME CLK.lite_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF csirxss_s_axi, ASSOCIATED_RESET lite_aresetn, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF lite_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.lite_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF lite_aresetn: SIGNAL IS "XIL_INTERFACENAME RST.lite_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0, TYPE INTERCONNECT";
  ATTRIBUTE X_INTERFACE_INFO OF lite_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.lite_aresetn RST";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_clk_hs_n: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_HS_N";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_clk_hs_p: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_HS_P";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_clk_lp_n: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_LP_N";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_clk_lp_p: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if CLK_LP_P";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_data_hs_n: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_HS_N";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_data_hs_p: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_HS_P";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_data_lp_n: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_LP_N";
  ATTRIBUTE X_INTERFACE_INFO OF mipi_phy_if_data_lp_p: SIGNAL IS "xilinx.com:interface:mipi_phy:1.0 mipi_phy_if DATA_LP_P";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rxbyteclkhs: SIGNAL IS "XIL_INTERFACENAME CLK.rxbyteclkhs, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN bd_ca02_phy_0_rxbyteclkhs, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF rxbyteclkhs: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.rxbyteclkhs CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF system_rst_out: SIGNAL IS "XIL_INTERFACENAME RST.system_rst_out, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF system_rst_out: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.system_rst_out RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF video_aclk: SIGNAL IS "XIL_INTERFACENAME CLK.video_aclk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, ASSOCIATED_BUSIF video_out, ASSOCIATED_RESET video_aresetn, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF video_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.video_aclk CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF video_aresetn: SIGNAL IS "XIL_INTERFACENAME RST.video_aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF video_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.video_aresetn RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF video_out_tdata: SIGNAL IS "XIL_INTERFACENAME video_out, TDATA_NUM_BYTES 2, TDEST_WIDTH 10, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tdest: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TDEST";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF video_out_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 video_out TVALID";
BEGIN
  U0 : bd_ca02
    PORT MAP (
      lite_aclk => lite_aclk,
      lite_aresetn => lite_aresetn,
      dphy_clk_200M => dphy_clk_200M,
      dlyctrl_rdy_out => dlyctrl_rdy_out,
      rxbyteclkhs => rxbyteclkhs,
      system_rst_out => system_rst_out,
      csirxss_csi_irq => csirxss_csi_irq,
      video_aclk => video_aclk,
      video_aresetn => video_aresetn,
      csirxss_s_axi_awaddr => csirxss_s_axi_awaddr,
      csirxss_s_axi_awprot => csirxss_s_axi_awprot,
      csirxss_s_axi_awvalid => csirxss_s_axi_awvalid,
      csirxss_s_axi_awready => csirxss_s_axi_awready,
      csirxss_s_axi_wdata => csirxss_s_axi_wdata,
      csirxss_s_axi_wstrb => csirxss_s_axi_wstrb,
      csirxss_s_axi_wvalid => csirxss_s_axi_wvalid,
      csirxss_s_axi_wready => csirxss_s_axi_wready,
      csirxss_s_axi_bresp => csirxss_s_axi_bresp,
      csirxss_s_axi_bvalid => csirxss_s_axi_bvalid,
      csirxss_s_axi_bready => csirxss_s_axi_bready,
      csirxss_s_axi_araddr => csirxss_s_axi_araddr,
      csirxss_s_axi_arprot => csirxss_s_axi_arprot,
      csirxss_s_axi_arvalid => csirxss_s_axi_arvalid,
      csirxss_s_axi_arready => csirxss_s_axi_arready,
      csirxss_s_axi_rdata => csirxss_s_axi_rdata,
      csirxss_s_axi_rresp => csirxss_s_axi_rresp,
      csirxss_s_axi_rvalid => csirxss_s_axi_rvalid,
      csirxss_s_axi_rready => csirxss_s_axi_rready,
      video_out_tdata => video_out_tdata,
      video_out_tdest => video_out_tdest,
      video_out_tlast => video_out_tlast,
      video_out_tready => video_out_tready,
      video_out_tuser => video_out_tuser,
      video_out_tvalid => video_out_tvalid,
      mipi_phy_if_clk_hs_n => mipi_phy_if_clk_hs_n,
      mipi_phy_if_clk_hs_p => mipi_phy_if_clk_hs_p,
      mipi_phy_if_clk_lp_n => mipi_phy_if_clk_lp_n,
      mipi_phy_if_clk_lp_p => mipi_phy_if_clk_lp_p,
      mipi_phy_if_data_hs_n => mipi_phy_if_data_hs_n,
      mipi_phy_if_data_hs_p => mipi_phy_if_data_hs_p,
      mipi_phy_if_data_lp_n => mipi_phy_if_data_lp_n,
      mipi_phy_if_data_lp_p => mipi_phy_if_data_lp_p
    );
END system_mipi_csi2_rx_subsystem_0_0_arch;
