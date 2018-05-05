--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:28:32 05/06/2018
-- Design Name:   
-- Module Name:   C:/Users/igor/Projects/ex1/DATA_PATH_TB.vhd
-- Project Name:  ex1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATA_PATH
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
 
ENTITY DATA_PATH_TB IS
END DATA_PATH_TB;
 
ARCHITECTURE behavior OF DATA_PATH_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DATA_PATH
    PORT(
         EN : IN  std_logic;
         OPCODE : IN  std_logic_vector(2 downto 0);
         OP : IN  std_logic_vector(7 downto 0);
         RES : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal EN : std_logic := '0';
   signal OPCODE : std_logic_vector(2 downto 0) := (others => '0');
   signal OP : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal RES : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace clock below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DATA_PATH PORT MAP (
          EN => EN,
          OPCODE => OPCODE,
          OP => OP,
          RES => RES
        );

   -- Clock process definitions
   clock_process :process
   begin
		EN <= '0';
		wait for clock_period/2;
		EN <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      OPCODE <= "000";
		OP <= "00001111";
		wait for clock_period;
		
		OPCODE <= "010";
		OP <= "00000001";
		wait for clock_period;
		
		OPCODE <= "011";
		OP <= "00000010";
		wait for clock_period;

      wait;
   end process;

END;
