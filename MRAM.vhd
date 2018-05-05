----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:31 05/05/2018 
-- Design Name: 
-- Module Name:    MRAM - Beh 
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

entity MRAM is
    Port ( 
			  -- Read/Write enable
			  -- RW = '0' => Write
			  -- RW = '1' => Read
			  RW : in  STD_LOGIC;
	 
			  -- Address
           ADR : in  STD_LOGIC_VECTOR (2 downto 0);
			  
			  -- Input data
           DIN : in  STD_LOGIC_VECTOR (7 downto 0);
			  
			  -- Output data
           DOUT : out  STD_LOGIC_VECTOR (7 downto 0));
end MRAM;

architecture Beh of MRAM is

-- 8-bit word subtype
subtype byte is std_logic_vector(7 downto 0);

-- 2D-array
type tRAM is array (0 to 7) of byte;

-- 2D initialization (memory init)
signal RAM: tRAM := (
	"00000001", -- 000 : a = 1
	"00000010", -- 001 : b = 2
	"00000011", -- 010 : c = 3
	"00000100", -- 011 : x = 4
	"00000101", -- 100 : f (result should be stored here)
	"00000000", -- 101 : ----
	"00000000", -- 110 : ----
	"00000000"  -- 111 : ----
);

-- Input & output signals
signal data_in: byte;
signal data_out: byte;  

begin

	-- Write process
	data_in <= DIN;
	WRITE: process(RW, ADR, data_in)
	begin
		if RW = '0' then
			RAM(CONV_INTEGER(ADR)) <= data_in;
		end if;
	end process;

	-- Read process
	data_out <= RAM(CONV_INTEGER(ADR));
	ZBUFS: process(RW, data_out)
	begin
		if RW = '1' then
			DOUT <= data_out;
		else
			DOUT <= (others => 'Z');
		end if;
	end process;

end Beh;

