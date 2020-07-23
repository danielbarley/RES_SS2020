library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity CTRL is
	port (
		clk : in std_logic;
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

	-- width of one instruction in bit
	constant INSTRUCTION_WIDTH : integer := 24;
	-- width of addresses for instruction ROM
	constant INS_ADDRESS_WIDTH : integer := 9;
	-- width of addresses for data RAM
	constant DAT_ADDRESS_WIDTH : integer := 9;

	-- current instruction register used by decoder
	signal IR : std_logic_vector(INSTRUCTION_WIDTH - 1 downto 0);
	-- current program counter for fetch pipeline
	signal PC_FETCH : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0) := (others => '0');
	-- current program counter for decode logic
	signal PC_DECODE : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0) := (others => '0');

	-- Signals needed for Fetch - Decode - Execute pipeline
	signal INSTRUCTION_FIFO_FULL : std_logic := 0;
	signal INSTRUCTION_FIFO_EMPTY : std_logic := 0;
	signal ALU_BUSY : std_logic := 0;
	signal LOAD_STORE_BUSY : std_logic := 0;
	signal RESET_FETCH : std_logic := 0;

	signal INSTRUCTION_FIFO_WREN : std_logic := '0';
	signal INSTRUCTION_FIFO_RDEN : std_logic := '0';

	-- Stack Pointer
	signal SP : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0);

begin

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
					INSTRUCTION_FIFO_RDEN <= '0';
				end if;
			end if;
		end if;
	end process;

	-- Decode state machine
	decode : process (clk)
	begin
		if rising_edge(clk) then
			case IR is
				
			end case;
		end if;
	end process;

end behav;
