--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:24:09 05/06/2018
-- Design Name:   
-- Module Name:   C:/Users/igor/Projects/ex1/TOP_TB.vhd
-- Project Name:  ex1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: TOP
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TOP_TB IS
END TOP_TB;
 
ARCHITECTURE behavior OF TOP_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOP
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Start : IN  std_logic;
         Stop : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Start : std_logic := '0';

 	--Outputs
   signal Stop : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP PORT MAP (
          CLK => CLK,
          RST => RST,
          Start => Start,
          Stop => Stop
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here
		
		RST <= '1';
		wait for CLK_period;
		
		RST <= '0';
		Start <= '1';
		wait for CLK_period * 20;

      wait;
   end process;

END;
