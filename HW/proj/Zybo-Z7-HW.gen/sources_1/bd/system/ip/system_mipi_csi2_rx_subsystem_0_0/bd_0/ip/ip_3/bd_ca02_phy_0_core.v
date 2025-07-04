

// /////////////////////////////////////////////////////////////////
// (c) Copyright 2015 - 2016 Xilinx, Inc. All rights reserved.	 
//   	                                						 
// This file contains confidential and proprietary information	 
// of Xilinx, Inc. and is protected under U.S. and	        	 
// international copyright and other intellectual property    	 
// laws.							                             
//   							                                 
// DISCLAIMER							                         
// This disclaimer is not a license and does not grant any	     
// rights to the materials distributed herewith. Except as	     
// otherwise provided in a valid license issued to you by	     
// Xilinx, and to the maximum extent permitted by applicable	
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND	     
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES	 
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING	 
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-	     
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and	     
// (2) Xilinx shall not be liable (whether in contract or tort,	 
// including negligence, or under any other theory of		     
// liability) for any loss or damage of any kind or nature	     
// related to, arising under or in connection with these	     
// materials, including for any direct, or any indirect,	    
// special, incidental, or consequential loss or damage		     
// (including loss of data, profits, goodwill, or any type of	 
// loss or damage suffered as a result of any action brought	 
// by a third party) even if such damage or loss was		     
// reasonably foreseeable or Xilinx had been advised of the	     
// possibility of the same.					                     
//   							                                 
// CRITICAL APPLICATIONS					                     
// Xilinx products are not designed or intended to be fail-	     
// safe, or for use in any application requiring fail-safe	     
// performance, such as life-support or safety devices or	     
// systems, Class III medical devices, nuclear facilities,	     
// applications related to the deployment of airbags, or any	  
// other applications that could lead to death, personal	      
// injury, or severe property or environmental damage		     
// (individually and collectively, "Critical			          
// Applications"). Customer assumes the sole risk and		     
// liability of any use of Xilinx products in Critical		     
// Applications, subject only to applicable laws and	  	     
// regulations governing limitations on product liability.	     
//   							                                 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS	     
// PART OF THIS FILE AT ALL TIMES. 				                 
// ////////////////////////////////////////////////////////////////////
//-----------------------------------------------------------------------------
// bd_ca02_phy_0.v  bd_ca02_phy_0.v 
//-----------------------------------------------------------------------------
//
// Filename        : bd_ca02_phy_0.v
// Version         : v1.0
// Description     : D-PHY top module. This module consists logic for one
//                   clock lane and configured number of data lanes
// Verilog-Standard: Verilog'2001
//-----------------------------------------------------------------------------
//-- Structure: SWAP
//--               -- top.v (MASTER/TX)
//                     -- tx_fab_top.v
//                     -- tx_ioi.v
//                     -- tx_dphy_reg.v
//--               -- top.v (SLAVE/TX)
//                     -- rx_fab_top.v
//                     -- rx_ioi.v
//                     -- rx_dphy_reg.v
//-----------------------------------------------------------------------------
// Naming Conventions:
//      active low signals:                     "*_n"
//      clock signals:                          "clk", "clk_div#", "clk_#x" 
//      reset signals:                          "rst", "rst_n" 
//      parameters:                             "C_*" 
//      user defined types:                     "*_TYPE" 
//      state machine next state:               "*_ns" 
//      state machine current state:            "*_cs" 
//      combinatorial signals:                  "*_com" 
//      pipelined or register delay signals:    "*_d#" 
//      counter signals:                        "*cnt*"
//      clock enable signals:                   "*_ce" 
//      internal version of output port         "*_i"
//      device pins:                            "*_pin" 
//      component instantiations:               "<MODULE>I_<#|FUNC>
//-----------------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////
// Module Declaration
///////////////////////////////////////////////////////////////////////////////
`timescale 1ps/1ps

(* DowngradeIPIdentifiedWarnings="yes" *)
module bd_ca02_phy_0_core
#( 
   // DPHY Function Mode
   // Valid values are MASTER (TX) and SLAVE (RX)
   parameter C_DPHY_MODE = "SLAVE", 
   // DPHY Data Lanes
   // Valid values are from 1 to 4	   
   parameter C_DPHY_LANES = 2, 
   // DPHY Line Rate in Mbps
   // Valid values are from 80 to 1500 in the order of 1 Mbps for D-PHY v1.1 Spec
   // Valid values are from 80 to 2500 in the order of 1 Mbps for D-PHY v1.2 Spec
   // No real values are allowed in Line Rate	   
   parameter C_HS_LINE_RATE = 800,
   // Transmit first deskew calibration sequence by D-PHY TX for line rates above 1.5 Gbps
   parameter C_XMIT_FIRST_DESKEW_SEQ  =  "false",  
   // Transmit periodic deskew calibration sequence by D-PHY TX for line rates above 1.5 Gbps
   parameter C_XMIT_PERIODIC_DESKEW_SEQ  =  "false",  
   // First deskew calibration sequence duration in txbyteclkhs clocks
   parameter C_SKEWCAL_FIRST_TIME  =  4096,  
   // Periodic deskew calibration sequence duration in txbyteclkhs clocks
   parameter C_SKEWCAL_PERIODIC_TIME  =  128,
   // Enable deskew sequence detection logic in D-PHY RX for line rates above 1.5 Gbps
   parameter C_RCVE_DESKEW_SEQ  =  "false",  
   // T_LPX protocol timing parameter in ns
   // Default : 50 ns
   // Valid values are from 50 to 100 	   
   parameter C_LPX_PERIOD = 50,
   // Stable clock period in ns
   parameter C_STABLE_CLK_PERIOD = 5.000,
   // Escape mode clock period in ns
   // Valid range is from 50 to 100 ns (10 MHz to 20 MHz)
   // Usually equals to T_LPX timing parameter	   
   parameter C_ESC_CLK_PERIOD = 50.000,
   // T_WAKEUP timing parameter
   // Valid value is 1 ms for MASTER (TX) and SLAVE (RX)  
   parameter C_WAKEUP = 1000,
   // HS [T/R]X Timeout in bytes
   // Valid range is from 1000 to 65541	   
   parameter C_HS_TIMEOUT = 65541,
   // Escape mode timeout in ns
   // TX DPHY use this param as Escape Mode Silence Timeout for LPDT
   // RX DPHY use this param as Escape Mode Timeout for LPDT
   // 32 Bytes x T_LPX(50) x 16  = 25600
   parameter C_ESC_TIMEOUT = 25600,
   // Synchronizer flip-flop stages and arrived using device 
   // characterization metrics
   // Valid range is from 3 to 7	   
   parameter MTBF_SYNC_STAGES = 3,
   parameter C_EN_TIMEOUT_REGS = 0,
   parameter DPHY_PRESET = "CSI2RX_XLNX",
   parameter SUPPORT_LEVEL = 1,
   // AXI-Lite Register Interface Enable	   
   parameter C_EN_REG_IF = 1,
   // Additional debug registers	   
   parameter C_EN_DEBUG_REGS = 0,
   // Simulation control
   parameter C_EXAMPLE_SIMULATION = "true",
   // TXPLL input clock frequency in ns
   parameter C_TXPLL_CLKIN_PERIOD = 8.0,
   // byteclkhs clock period derived from line rate  
   parameter C_DIV4_CLK_PERIOD = 10.000,     
   // Calibration Mode for IDELAY in Slave mode of IP
   parameter C_CAL_MODE = "FIXED",
   parameter C_EN_EXT_TAP = "0",
   parameter C_EN_SSC = "0",
   // IDELAY Tap value when calibration mode is Fixed
   parameter C_IDLY_TAP = 2
   )
   (
       input                core_clk,









       input                core_rst,
       output               dlyctrl_rdy_out,
       output               rxbyteclkhs,
       output               system_rst_out,
       output               init_done,

       //Clock lane PPI RX interface 
       output               cl_rxclkactivehs,
       output               cl_stopstate,
       input                cl_enable,
       output               cl_rxulpsclknot,
       output               cl_ulpsactivenot,

       //Data lane - 0 PPI RX high speed signals
       output   [7:0]       dl0_rxdatahs,
       output               dl0_rxvalidhs,
       output               dl0_rxactivehs,
       output               dl0_rxsynchs,

       //Data lane - 0 RX control siganls
       input                dl0_forcerxmode,
       output               dl0_stopstate,
       input                dl0_enable,
       output               dl0_ulpsactivenot,

       //Data lane - 0 RX escape mode signals
       output               dl0_rxclkesc,
       output               dl0_rxlpdtesc,
       output               dl0_rxulpsesc,
       output   [3:0]       dl0_rxtriggeresc,
       output   [7:0]       dl0_rxdataesc,
       output               dl0_rxvalidesc,

       //Data lane - 0 RX error signals
       output               dl0_errsoths,
       output               dl0_errsotsynchs,
       output               dl0_erresc,
       output               dl0_errsyncesc,
       output               dl0_errcontrol,

       //Data lane - 1 PPI RX high speed signals
       output   [7:0]       dl1_rxdatahs,
       output               dl1_rxvalidhs,
       output               dl1_rxactivehs,
       output               dl1_rxsynchs,

       //Data lane - 1 RX control siganls
       input                dl1_forcerxmode,
       output               dl1_stopstate,
       input                dl1_enable,
       output               dl1_ulpsactivenot,

       //Data lane - 1 RX escape mode signals
       output               dl1_rxclkesc,
       output               dl1_rxlpdtesc,
       output               dl1_rxulpsesc,
       output   [3:0]       dl1_rxtriggeresc,
       output   [7:0]       dl1_rxdataesc,
       output               dl1_rxvalidesc,

       //Data lane - 1 RX error signals
       output               dl1_errsoths,
       output               dl1_errsotsynchs,
       output               dl1_erresc,
       output               dl1_errsyncesc,
       output               dl1_errcontrol,






       //AXI4-Lite slave signals for register access
       input                s_axi_aclk,
       input                s_axi_aresetn,
       input    [6:0]       s_axi_awaddr,
       output               s_axi_awready,
       input                s_axi_awvalid,
       input    [6:0]       s_axi_araddr,
       output               s_axi_arready,
       input                s_axi_arvalid,
       input    [31:0]      s_axi_wdata,
       input    [3:0]       s_axi_wstrb,
       output               s_axi_wready,
       input                s_axi_wvalid,
       output   [31:0]      s_axi_rdata,
       output   [1:0]       s_axi_rresp,
       input                s_axi_rready,
       output               s_axi_rvalid,
       output   [1:0]       s_axi_bresp,
       input                s_axi_bready,
       output               s_axi_bvalid,
       //IO I/F signals for SLAVE(RX)
       input                clk_hs_rxp,
       input                clk_hs_rxn,
       input    [C_DPHY_LANES -1:0] data_hs_rxp,
       input    [C_DPHY_LANES -1:0] data_hs_rxn,
       input                clk_lp_rxp,
       input                clk_lp_rxn,
       input    [C_DPHY_LANES -1:0] data_lp_rxp,
       input    [C_DPHY_LANES -1:0] data_lp_rxn
   );
wire cl_txp;
wire cl_txn;
wire [C_DPHY_LANES-1:0] dl_txp;
wire [C_DPHY_LANES-1:0] dl_txn;
wire cl_lp_txp;
wire cl_lp_txn;
wire [C_DPHY_LANES-1:0] dl_lp_txp;
wire [C_DPHY_LANES-1:0] dl_lp_txn;
wire cl_rxp;
wire cl_rxn;
wire [C_DPHY_LANES-1:0] dl_rxp;
wire [C_DPHY_LANES-1:0] dl_rxn;
wire cl_lp_rxp;
wire cl_lp_rxn;
wire [C_DPHY_LANES-1:0] dl_lp_rxp;
wire [C_DPHY_LANES-1:0] dl_lp_rxn;

 bd_ca02_phy_0_c1 inst
   (
       .core_clk(core_clk),

                                                       ////Data lane - 0 IOB signals
       .core_rst(core_rst),
       .rxbyteclkhs(rxbyteclkhs),
       .system_rst_out(system_rst_out),
       .init_done(init_done),

       //Clock lane PPI RX interface 
       .cl_rxclkactivehs(cl_rxclkactivehs),
       .cl_stopstate(cl_stopstate),
       .cl_enable(cl_enable),
       .cl_rxulpsclknot(cl_rxulpsclknot),
       .cl_ulpsactivenot(cl_ulpsactivenot),

       //Data lane - 0 PPI RX high speed signals
       .dl0_rxdatahs(dl0_rxdatahs),
       .dl0_rxvalidhs(dl0_rxvalidhs),
       .dl0_rxactivehs(dl0_rxactivehs),
       .dl0_rxsynchs(dl0_rxsynchs),

       //Data lane - 0 RX control siganls
       .dl0_forcerxmode(dl0_forcerxmode),
       .dl0_stopstate(dl0_stopstate),
       .dl0_enable(dl0_enable),
       .dl0_ulpsactivenot(dl0_ulpsactivenot),

       //Data lane - 0 RX escape mode signals
       .dl0_rxclkesc(dl0_rxclkesc),
       .dl0_rxlpdtesc(dl0_rxlpdtesc),
       .dl0_rxulpsesc(dl0_rxulpsesc),
       .dl0_rxtriggeresc(dl0_rxtriggeresc),
       .dl0_rxdataesc(dl0_rxdataesc),
       .dl0_rxvalidesc(dl0_rxvalidesc),

       //Data lane - 0 RX error signals
       .dl0_errsoths(dl0_errsoths),
       .dl0_errsotsynchs(dl0_errsotsynchs),
       .dl0_erresc(dl0_erresc),
       .dl0_errsyncesc(dl0_errsyncesc),
       .dl0_errcontrol(dl0_errcontrol),
       //Data lane - 1 PPI RX high speed signals
       .dl1_rxdatahs(dl1_rxdatahs),
       .dl1_rxvalidhs(dl1_rxvalidhs),
       .dl1_rxactivehs(dl1_rxactivehs),
       .dl1_rxsynchs(dl1_rxsynchs),

       //Data lane - 1 RX control siganls
       .dl1_forcerxmode(dl1_forcerxmode),
       .dl1_stopstate(dl1_stopstate),
       .dl1_enable(dl1_enable),
       .dl1_ulpsactivenot(dl1_ulpsactivenot),

       //Data lane - 1 RX escape mode signals
       .dl1_rxclkesc(dl1_rxclkesc),
       .dl1_rxlpdtesc(dl1_rxlpdtesc),
       .dl1_rxulpsesc(dl1_rxulpsesc),
       .dl1_rxtriggeresc(dl1_rxtriggeresc),
       .dl1_rxdataesc(dl1_rxdataesc),
       .dl1_rxvalidesc(dl1_rxvalidesc),

       //Data lane - 1 RX error signals
       .dl1_errsoths(dl1_errsoths),
       .dl1_errsotsynchs(dl1_errsotsynchs),
       .dl1_erresc(dl1_erresc),
       .dl1_errsyncesc(dl1_errsyncesc),
       .dl1_errcontrol(dl1_errcontrol),



                                                             
       .dlyctrl_rdy_out(dlyctrl_rdy_out),
       //AXI4-Lite slave signals for register access
       .s_axi_aclk           (s_axi_aclk          ),            //input                s_axi_aclk,
       .s_axi_aresetn        (s_axi_aresetn       ),            //input                s_axi_aresetn,
       .s_axi_awaddr         (s_axi_awaddr        ),            //input    [6:0]       s_axi_awaddr,
       .s_axi_awready        (s_axi_awready       ),            //output               s_axi_awready,
       .s_axi_awvalid        (s_axi_awvalid       ),            //input                s_axi_awvalid,
       .s_axi_araddr         (s_axi_araddr        ),            //input    [6:0]       s_axi_araddr,
       .s_axi_arready        (s_axi_arready       ),            //output               s_axi_arready,
       .s_axi_arvalid        (s_axi_arvalid       ),            //input                s_axi_arvalid,
       .s_axi_wdata          (s_axi_wdata         ),            //input    [31:0]      s_axi_wdata,
       .s_axi_wstrb          (s_axi_wstrb         ),            //input    [3:0]       s_axi_wstrb,
       .s_axi_wready         (s_axi_wready        ),            //output               s_axi_wready,
       .s_axi_wvalid         (s_axi_wvalid        ),            //input                s_axi_wvalid,
       .s_axi_rdata          (s_axi_rdata         ),            //output   [31:0]      s_axi_rdata,
       .s_axi_rresp          (s_axi_rresp         ),            //output   [1:0]       s_axi_rresp,
       .s_axi_rready         (s_axi_rready        ),            //input                s_axi_rready,
       .s_axi_rvalid         (s_axi_rvalid        ),            //output               s_axi_rvalid,
       .s_axi_bresp          (s_axi_bresp         ),            //output   [1:0]       s_axi_bresp,
       .s_axi_bready         (s_axi_bready        ),            //input                s_axi_bready,
       .s_axi_bvalid         (s_axi_bvalid        ),            //output               s_axi_bvalid
       //IO I/F signals for SLAVE(RX)
       .clk_hs_rxp(cl_rxp),
       .clk_hs_rxn(cl_rxn),
       .data_hs_rxp(dl_rxp),
       .data_hs_rxn(dl_rxn),
       .clk_lp_rxp(cl_lp_rxp),
       .clk_lp_rxn(cl_lp_rxn),
       .data_lp_rxp(dl_lp_rxp),
       .data_lp_rxn(dl_lp_rxn)
   );

//tx,us+
//tx,7s
//rx,us+
//rx,7s
    //HS pin swap taken care at ISERDES o/p
     assign cl_rxp = clk_hs_rxp;
     assign cl_rxn = clk_hs_rxn;

       assign dl_rxp[0] = data_hs_rxp[0];
       assign dl_rxn[0] = data_hs_rxn[0];

       assign dl_rxp[1] = data_hs_rxp[1];
       assign dl_rxn[1] = data_hs_rxn[1];













     assign cl_lp_rxp = clk_lp_rxp;
     assign cl_lp_rxn = clk_lp_rxn;

       assign dl_lp_rxp[0] = data_lp_rxp[0];
       assign dl_lp_rxn[0] = data_lp_rxn[0];

       assign dl_lp_rxp[1] = data_lp_rxp[1];
       assign dl_lp_rxn[1] = data_lp_rxn[1];











endmodule
