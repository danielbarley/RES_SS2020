library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity CTRL is
	port (
		clk : in std_logic;
		reset : in std_logic;
		input : in std_logic_vector(7 downto 0);
		ouput : out std_logic_vector(7 downto 0)
	);
end entity CTRL;

architecture behav of CTRL is

	-- ALU
	component ALU is
		port (
			-- control signals
			clk : in std_logic;
			reset : in std_logic;
			-- data
			op1 : in std_logic_vector(7 downto 0); -- operand 1
			op2 : in std_logic_vector(7 downto 0); -- operand 2
			ins : in std_logic_vector(3 downto 0); -- instruction
			-- outputs
			output : out std_logic_vector(7 downto 0); -- result
			flags : out std_logic_vector(7 downto 0) -- flags
		);
	end component ALU;

	-- Data Register
	component REG is
		port (
			clk : in std_logic;
			reset : in std_logic;
			-- register addresses (8 regs -> 3bit)
			addr_1 : in std_logic_vector(2 downto 0);
			addr_2 : in std_logic_vector(2 downto 0);
			-- control signals
			rd_en_1 : in std_logic;
			rd_en_2 : in std_logic;
			wr_en_1 : in std_logic;
			wr_en_2 : in std_logic;
			-- data in ports
			data_1_in : in std_logic_vector(7 downto 0);
			data_2_in : in std_logic_vector(7 downto 0);
			-- data out ports
			data_1_out : out std_logic_vector(7 downto 0);
			data_2_out : out std_logic_vector(7 downto 0)
		);
	end component REG;

	-- Address Storage Unit: specialized registers used to store addresses
	component ASU is
		generic (
			address_width : integer
		);
		port (
			clk : in std_logic;
			reset : in std_logic;
			-- register addresses (8 regs -> 3bit)
			addr_1 : in std_logic_vector(2 downto 0);
			addr_2 : in std_logic_vector(2 downto 0);
			-- control signals
			rd_en_1 : in std_logic;
			rd_en_2 : in std_logic;
			wr_en_1 : in std_logic;
			wr_en_2 : in std_logic;
			-- data in ports
			data_1_in : in std_logic_vector(address_width - 1 downto 0);
			data_2_in : in std_logic_vector(address_width - 1 downto 0);
			-- data out ports
			data_1_out : out std_logic_vector(address_width - 1 downto 0);
			data_2_out : out std_logic_vector(address_width - 1 downto 0)
		);
	end component ASU;

	-- Data RAM
	component RAM is
		port
		(
			clock		: in std_logic  := '1';
			data		: in std_logic_vector (7 downto 0);
			rdaddress	: in std_logic_vector (9 downto 0);
			wraddress	: in std_logic_vector (9 downto 0);
			wren		: in std_logic  := '0';
			q		: out std_logic_vector (7 downto 0)
		);
	end component RAM;

	-- Instruction ROM
	component ROM is
		port
		(
			address		: in std_logic_vector (9 downto 0);
			clock		: in std_logic  := '1';
			q		: out std_logic_vector (23 downto 0)
		);
	end component ROM;

	component FIFO is
		generic
		(
			data_width : integer;
			depth : integer
		);
		port
		(
			-- control
			clk : in std_logic;
			reset : in std_logic;
			wren : in std_logic;
			rden : in std_logic;
			-- data ports
			data_in : in std_logic_vector (data_width - 1 downto 0);
			data_out : out std_logic_vector (data_width - 1 downto 0);
			-- signals
			is_empty : out std_logic;
			is_full : out std_logic
		);
	end component FIFO;

	-- width of addresses for instruction ROM
	constant INS_ADDRESS_WIDTH : integer := 9;
	-- width of addresses for data RAM
	constant DAT_ADDRESS_WIDTH : integer := 9;

	-- current instruction register used by decoder
	signal IR : std_logic_vector(23 downto 0);
	-- current program counter for fetch pipeline
	signal PC_FETCH : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0) := (others => '0');
	-- current program counter for decode logic
	signal PC_DECODE : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0) := (others => '0');
	-- branching address
	signal PC_BRANCH : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0) := (others => '0');

	-- Signals needed for Fetch - Decode - Execute pipeline
	signal INSTRUCTION_FIFO_FULL : std_logic := '0';
	signal INSTRUCTION_FIFO_EMPTY : std_logic := '0';
	signal DECODE_ACTIVE : std_logic := '0';
	signal LOAD_STORE_BUSY : std_logic := '0';
	signal RESET_FETCH : std_logic := '0';

	signal INSTRUCTION_FIFO_WREN : std_logic := '0';
	signal INSTRUCTION_FIFO_RDEN : std_logic := '0';

	-- Stack Pointer
	signal SP : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0);

	signal ALU_OP1 : std_logic_vector(7 downto 0);
	signal ALU_OP2 : std_logic_vector(7 downto 0);
	signal ALU_OUTPUT : std_logic_vector(7 downto 0);
	signal ALU_INS : std_logic_vector(3 downto 0);
	signal ALU_FLAGS : std_logic_vector(7 downto 0);

	signal REG_ADDR_1 : std_logic_vector(2 downto 0);
	signal REG_ADDR_2 : std_logic_vector(2 downto 0);
	signal REG_RD_EN_1 : std_logic;
	signal REG_RD_EN_2 : std_logic;
	signal REG_WR_EN_1 : std_logic;
	signal REG_WR_EN_2 : std_logic;
	signal REG_DATA_1_IN : std_logic_vector(7 downto 0);
	signal REG_DATA_2_IN : std_logic_vector(7 downto 0);
	signal REG_DATA_1_OUT : std_logic_vector(7 downto 0);
	signal REG_DATA_2_OUT : std_logic_vector(7 downto 0);

	type EXECUTE_STATES is (
		RESET,
		ENTRY,
		DECODE,
		ALU_INIT, -- load operands for ALU
		ALU_EXEC_WITH_WB, -- result is kept (e.g. addition)
		ALU_EXEC_WO_WB, -- result is discarded (e.g. compare)
		ALU_BUSY,
		ALU_WRITEBACK -- write result to memory
	);
	signal EXECUTE_STATE : EXECUTE_STATES;

begin

	process (clk)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				EXECUTE_STATE <= RESET;
			else
				case EXECUTE_STATE is 
					when RESET =>
						EXECUTE_STATE <= ENTRY;
					when ENTRY =>
						EXECUTE_STATE <= DECODE;
					when ALU_INIT =>
			end if;
		end if;
	end process;

	-- fetch logic is simple: fetch instructions as soon as fifo is not full
	-- increment PC afterwards, if branch occurs PC is reset and FIFO is cleared
	-- PC is updated to jump location and fetching continues next cycle
	fetch : process (clk)
	begin
		if rising_edge(clk) then
			if (RESET_FETCH = '1') then
				PC_FETCH <= PC_BRANCH;
			else
				if (INSTRUCTION_FIFO_FULL = '0') then
					INSTRUCTION_FIFO_WREN <= '1';
					PC_FETCH <= PC_FETCH + 1;
				else
					INSTRUCTION_FIFO_WREN <= '0';
				end if;
			end if;
		end if;
	end process;

	-- pop instruction from queue if available into instruction regiser IR
	instruction_pop : process (clk)
	begin
		if rising_edge(clk) then
			if (INSTRUCTION_FIFO_EMPTY = '0') then
				INSTRUCTION_FIFO_RDEN <= '1';
			else
				INSTRUCTION_FIFO_RDEN <= '0';
			end if;
		end if;
	end process;

	decode : process (IR)
	begin
		case IR(23 downto 22) is
			-- NOP
			when "00" =>
				
			-- Arithmetic/Logic
			when "01" =>
				-- determine operand types:
				-- 00 - > reg       - reg
				-- 10 - > immediate - reg
				-- 01 - > reg       - immediate
				-- 11 - > immediate - immediate
				case IR(21 downto 20) is
					-- interpret bytes 2 and 3 as addresses
					when "00" =>
						REG_ADDR_1 <= IR(9 downto 8);
						REG_ADDR_2 <= IR(1 downto 0);
						REG_RD_EN_1 <= '1';
						REG_RD_EN_2 <= '1';
					when "01" =>
						
					when "10" =>
						
					when "11" =>
						
				end case;
			-- Load/Store
			when "10" =>
				
			-- Branching/Control
			when "11" =>
				
		end case;
	end process;

	arithemtic : process
	begin
		wait until ALU_ENABLE'event and ALU_ENABLE = '1';
	end process;

end behav;
