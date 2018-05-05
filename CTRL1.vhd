----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:02 05/06/2018 
-- Design Name: 
-- Module Name:    CTRL1 - Beh 
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

entity CTRL1 is
    Port ( 
			  -- Input ports: control
			  CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           Start : in  STD_LOGIC;
			  
			  -- Output port: result
           Stop : out  STD_LOGIC;
			  
			  -- ROM connection (microprogram memory)
           ROM_re : out  STD_LOGIC;
           ROM_adr : out  STD_LOGIC_VECTOR (2 downto 0);
           ROM_dout : in  STD_LOGIC_VECTOR (5 downto 0);
			  
			  -- RAM connection (data memory) 
           RAM_rw : out  STD_LOGIC;
           RAM_adr : out  STD_LOGIC_VECTOR (2 downto 0);
           RAM_din : out  STD_LOGIC_VECTOR (7 downto 0);
           RAM_dout : in  STD_LOGIC_VECTOR (7 downto 0);
			  
			  -- Data path connection
           DP_op : out  STD_LOGIC_VECTOR (7 downto 0);
           DP_opcode : out  STD_LOGIC_VECTOR (2 downto 0);
           DP_en : out  STD_LOGIC;
           DP_res : in  STD_LOGIC_VECTOR (7 downto 0));
end CTRL1;

architecture Beh of CTRL1 is

-- Enum of FSM states
type states is (I, F, D, R, L, S, A, M, H);
-- I - initialization (Idle)
-- F - fetching of instruction (Fetch)
-- D - instruction decoding (Decode)
-- R - Reading of operand (Read)
-- L - execution of Load instruction
-- S - execution of Store instruction
-- A - execution of Add instruction
-- M - execution of Mul instruction
-- H - execution of Halt instruction

-- Current & next states signals
signal current_state, next_state: states;

-- Fetched instruction register
signal RI: std_logic_vector(5 downto 0);

-- Instruction counter register
signal IC: std_logic_vector(2 downto 0);

-- Operation type register
signal RO: std_logic_vector(2 downto 0);

-- Data memory address register
signal RA: std_logic_vector(2 downto 0);

-- Data register
signal RD: std_logic_vector(7 downto 0);

-- Operations binary codes
constant LOAD: std_logic_vector(2 downto 0) := "000";
constant STORE: std_logic_vector(2 downto 0) := "001";
constant ADD: std_logic_vector(2 downto 0) := "010";
constant MUL: std_logic_vector(2 downto 0) := "011";
constant HALT: std_logic_vector(2 downto 0) := "100";

begin

	--------------------------
	-- Synchronized FSM memory
	--------------------------
	FSM_mem: process(CLK, RST, next_state)
	begin
		if RST = '1' then
			current_state <= I;
		elsif rising_edge(CLK) then
			current_state <= next_state;
		end if;
	end process;
	--------------------------
	
	------------------------------------------------------
	-- Combinational logic of FSM which defines next state
	------------------------------------------------------
	FSM_gamma: process(current_state, Start, RO)
	begin
		case current_state is
			when I => if (Start = '1') then
					next_state <= F;
				else
					next_state <= I;
				end if;
			when F => next_state <= D;
			when D => if RO = HALT then
					next_state <= H;
				elsif RO = STORE then
					next_state <= S;
				else
					next_state <= R;
				end if;
			when R => if RO = LOAD then
					next_state <= L;
				elsif RO = ADD then
					next_state <= A;
				elsif RO = MUL then
					next_state <= M;
				else
					next_state <= I;
				end if;
			when L | S | A | M => next_state <= F;
			when H => next_state <= H;
			when others => next_state <= I;
		end case;
	end process;
	------------------------------------------------------
	
	-----------------------
	-- Output signal / Stop
	-----------------------
	FSM_phi: process(current_state)
	begin
		if current_state = H then
			Stop <= '1';
		else
			Stop <= '0';
		end if;
	end process;
	-----------------------
	
	-----------------
	-- ROM controller
	-----------------
	
	-- Instruction counter
	PMC: process(CLK, RST, current_state)
	begin
		if RST = '1' then
			IC <= "000";
		elsif falling_edge(CLK) then
			if current_state = D then
				IC <= IC + 1;
			end if;
		end if;
	end process;
	
	-- Feeding of IC value to ROM's address bus
	ROM_adr <= IC;
	
	-- ROM: read enabled
	PROMREAD: process(current_state, next_state)
	begin
		if (current_state = F or next_state = F) then
			ROM_re <= '1';
		else
			ROM_re <= '0';
		end if;
	end process;
	
	-- ROM: reading of instruction
	PROMDAT: process(current_state, RST, ROM_dout)
	begin
		if RST = '1' then
			RI <= "000000";
		elsif current_state = F then
			RI <= ROM_dout;
		end if;
	end process;
	-----------------
	
	------------------------------
	-- RO and RA registers control
	------------------------------
	PRORA: process(RST, next_state, RI)
	begin
		if RST = '1' then
			RO <= "000";
			RA <= "000";
		elsif next_state = D then
			RO <= RI(5 downto 3);
			RA <= RI(2 downto 0);
		end if;
	end process;
	------------------------------
	
	-----------------
	-- RAM controller
	-----------------
	
	-- Feeding of RA value to RAM's address bus
	RAM_adr <= RA;
	
	-- Read/Write RAM signal
	PRAMREAD: process(current_state)
	begin
		if current_state = S then
			RAM_rw <= '0'; -- Write to RAM
		else
			RAM_rw <= '1'; -- Read from RAM
		end if;
	end process;
	
	-- Write data (fetched from RAM) to RD register
	PRAMDAT: process(current_state)
	begin
		if current_state = R then
			RD <= RAM_dout;
		end if;
	end process;
	
	-- Feeding of Data Path result value to RAM
	RAM_din <= DP_res;
	-----------------
	
	-----------------------
	-- Data Path controller
	-----------------------
	
	-- Passing of RD register value as operand to Data Path
	DP_op <= RD;
	
	-- Passing of RO register value as operation code to Data Path
	DP_opcode <= RO;
	
	-- Data Path operations enabled
	PADDMULEN: process(current_state)
	begin
		if (current_state = L or current_state = A or current_state = M) then
			DP_en <= '1';
		else
			DP_en <= '0';
		end if;
	end process;

end Beh;

