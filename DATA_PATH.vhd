----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:09:09 05/06/2018 
-- Design Name: 
-- Module Name:    DATA_PATH - Beh 
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

-- Accumulator Data Path
entity DATA_PATH is
    Port ( 
			  -- Enable
			  EN : in  STD_LOGIC;
			  
			  -- Operation code (fetched from ROM)
           OPCODE : in  STD_LOGIC_VECTOR (2 downto 0);
			  
			  -- Operand (fetched from RAM)
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
			  
			  -- Data path output
           RES : out  STD_LOGIC_VECTOR (7 downto 0));
end DATA_PATH;

architecture Beh of DATA_PATH is

-- Register-accumulator
signal ACCUM: std_logic_vector(7 downto 0);

-- Result of ADD operation
signal res_add: std_logic_vector(7 downto 0);

-- Result of MUL operation
signal res_mul: std_logic_vector(7 downto 0);

-- Operation codes
constant LOAD: std_logic_vector(2 downto 0) := "000";
constant ADD: std_logic_vector(2 downto 0) := "010";
constant MUL: std_logic_vector(2 downto 0) := "011";

begin

	-- Adder
	res_add <= CONV_STD_LOGIC_VECTOR(CONV_INTEGER(ACCUM) + CONV_INTEGER(OP), 8);
	
	-- Multiplier
	res_mul <= CONV_STD_LOGIC_VECTOR(CONV_INTEGER(ACCUM) * CONV_INTEGER(OP), 8);
	
	-- Synchronized register-accumulator
	REGA: process(EN, OPCODE, OP, res_add, res_mul)
	begin
		if rising_edge(EN) then
			case OPCODE is
				when LOAD => ACCUM <= OP;
				when ADD => ACCUM <= res_add;
				when MUL => ACCUM <= res_mul;
				when others => null;
			end case;
		end if;
	end process;
	
	RES <= ACCUM;

end Beh;

