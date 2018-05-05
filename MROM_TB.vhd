--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:42:11 05/05/2018
-- Design Name:   
-- Module Name:   C:/Users/igor/Projects/ex1/MROM_TB.vhd
-- Project Name:  ex1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MROM
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
 
ENTITY MROM_TB IS
END MROM_TB;
 
ARCHITECTURE behavior OF MROM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MROM
    PORT(
         RE : IN  std_logic;
         ADR : IN  std_logic_vector(2 downto 0);
         DOUT : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RE : std_logic := '0';
   signal ADR : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal DOUT : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MROM PORT MAP (
          RE => RE,
          ADR => ADR,
          DOUT => DOUT
        );

   -- Clock process definitions
   clock_process :process
   begin
		--clock <= '0';
		wait for clock_period/2;
		--clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here

		RE <= '1';
		ADR <= "000";
		wait for clock_period * 5;
		
		ADR <= "001";
		wait for clock_period * 5;
		
		ADR <= "010";
		wait for clock_period * 5;
		
		ADR <= "011";
		wait for clock_period * 5;

      wait;
   end process;

END;
