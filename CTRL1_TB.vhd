--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:47:07 05/06/2018
-- Design Name:   
-- Module Name:   C:/Users/igor/Projects/ex1/CTRL1_TB.vhd
-- Project Name:  ex1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CTRL1
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
 
ENTITY CTRL1_TB IS
END CTRL1_TB;
 
ARCHITECTURE behavior OF CTRL1_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CTRL1
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         Start : IN  std_logic;
         Stop : OUT  std_logic;
         ROM_re : OUT  std_logic;
         ROM_adr : OUT  std_logic_vector(2 downto 0);
         ROM_dout : IN  std_logic_vector(5 downto 0);
         RAM_rw : OUT  std_logic;
         RAM_adr : OUT  std_logic_vector(2 downto 0);
         RAM_din : OUT  std_logic_vector(7 downto 0);
         RAM_dout : IN  std_logic_vector(7 downto 0);
         DP_op : OUT  std_logic_vector(7 downto 0);
         DP_opcode : OUT  std_logic_vector(2 downto 0);
         DP_en : OUT  std_logic;
         DP_res : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Start : std_logic := '0';
   signal ROM_dout : std_logic_vector(5 downto 0) := (others => '0');
   signal RAM_dout : std_logic_vector(7 downto 0) := (others => '0');
   signal DP_res : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Stop : std_logic;
   signal ROM_re : std_logic;
   signal ROM_adr : std_logic_vector(2 downto 0);
   signal RAM_rw : std_logic;
   signal RAM_adr : std_logic_vector(2 downto 0);
   signal RAM_din : std_logic_vector(7 downto 0);
   signal DP_op : std_logic_vector(7 downto 0);
   signal DP_opcode : std_logic_vector(2 downto 0);
   signal DP_en : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CTRL1 PORT MAP (
          CLK => CLK,
          RST => RST,
          Start => Start,
          Stop => Stop,
          ROM_re => ROM_re,
          ROM_adr => ROM_adr,
          ROM_dout => ROM_dout,
          RAM_rw => RAM_rw,
          RAM_adr => RAM_adr,
          RAM_din => RAM_din,
          RAM_dout => RAM_dout,
          DP_op => DP_op,
          DP_opcode => DP_opcode,
          DP_en => DP_en,
          DP_res => DP_res
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
