----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:44 05/05/2018 
-- Design Name: 
-- Module Name:    MROM - Beh 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MROM is
    Port ( 
			  -- Read enabled
			  RE : in  STD_LOGIC;
			  
			  -- Instruction address (max 8 commands can be addressed)
           ADR : in  STD_LOGIC_VECTOR (2 downto 0);

			  -- Output instruction
           DOUT : out  STD_LOGIC_VECTOR (5 downto 0));
end MROM;

architecture Beh of MROM is

-- instruction subtype
subtype inst is std_logic_vector(5 downto 0);

-- 2D array
type tROM is array (0 to 7) of inst;

-- 2D initialization (opcode & data_addr)
-- LOAD  000
-- STORE 001
-- ADD   010
-- MUL   011
-- HALT  100
constant ROM: tRom := (
	"000"&"000", -- 000 : LOAD a
	"011"&"011", -- 001 : MUL x
	"010"&"001", -- 010 : ADD b
	"011"&"011", -- 011 : MUL x
	"010"&"010", -- 100 : ADD c
	"001"&"100", -- 101 : STORE f
	"100"&"000", -- 110 : HALT
	"111"&"111"  -- 111 : ----
);

-- selected instruction
signal data: inst;

begin

	-- fetching of addressed instruction
	data <= ROM(CONV_INTEGER(ADR));
	
	-- output tristable buffers
	zbufs: process(RE, data)
	begin
		if RE = '1' then
			DOUT <= data;
		else
			DOUT <= (others => 'Z');
		end if;
	end process;

end Beh;

