

################################################################################
## (c) Copyright 2014 - 2015 Xilinx, Inc. All rights reserved.	 
##   	                                						 
## This file contains confidential and proprietary information	 
## of Xilinx, Inc. and is protected under U.S. and	        	 
## international copyright and other intellectual property    	 
## laws.							                             
##   							                                 
## DISCLAIMER							                         
## This disclaimer is not a license and does not grant any	     
## rights to the materials distributed herewith. Except as	     
## otherwise provided in a valid license issued to you by	     
## Xilinx, and to the maximum extent permitted by applicable	
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND	     
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES	 
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING	 
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-	     
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and	     
## (2) Xilinx shall not be liable (whether in contract or tort,	 
## including negligence, or under any other theory of		     
## liability) for any loss or damage of any kind or nature	     
## related to, arising under or in connection with these	     
## materials, including for any direct, or any indirect,	    
## special, incidental, or consequential loss or damage		     
## (including loss of data, profits, goodwill, or any type of	 
## loss or damage suffered as a result of any action brought	 
## by a third party) even if such damage or loss was		     
## reasonably foreseeable or Xilinx had been advised of the	     
## possibility of the same.					                     
##   							                                 
## CRITICAL APPLICATIONS					                     
## Xilinx products are not designed or intended to be fail-	     
## safe, or for use in any application requiring fail-safe	     
## performance, such as life-support or safety devices or	     
## systems, Class III medical devices, nuclear facilities,	     
## applications related to the deployment of airbags, or any	  
## other applications that could lead to death, personal	      
## injury, or severe property or environmental damage		     
## (individually and collectively, "Critical			          
## Applications"). Customer assumes the sole risk and		     
## liability of any use of Xilinx products in Critical		     
## Applications, subject only to applicable laws and	  	     
## regulations governing limitations on product liability.	     
##   							                                 
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS	     
## PART OF THIS FILE AT ALL TIMES. 				                 
################################################################################
## XDC generated for zynq-xc7z020-clg400-1 device

## False path constraint for synchronizer
#set_false_path -to [get_pins -hier *cdc_to*/D]


#create_clock -period 2.500 [get_ports clk_hs_rxp]
set_false_path -to [get_pins -hier *io_rst_2clks_r_reg/PRE]
set_false_path -to [get_pins -hier *m_count_reg[*]/CLR]

#################################################
## Rx DE-Skew Related constraints 
#################################################











create_waiver -internal -scope -type CDC -id {CDC-11} -user "mipi_dphy" -tag "1088530" -description "Waiving the CDC-11 , its a condition where same flop output is going to multiple synchrzrs . As the instances are created based on conditions we cannot use same synchrizr & fan-out is bound to happen & it will not cause any functional issue as its taken care in design" -from [get_pins -hier *en_hs_datapath_reg/C]
create_waiver -internal -scope -type CDC -id {CDC-11} -user "mipi_dphy" -tag "1090987" -description "Waiving the CDC-11 , as there are two different cores i.e. CSI2tx/ DSI2 controller ,  DPHY and the fanout to two different synchrzers is inevitable" -from [get_pins -hier *init_done_reg/C] 




#################################################
