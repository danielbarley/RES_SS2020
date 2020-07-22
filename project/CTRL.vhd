library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

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
			data_1_in : in std_logic_vector(15 downto 0);
			data_2_in : in std_logic_vector(15 downto 0);
			-- data out ports
			data_1_out : out std_logic_vector(15 downto 0);
			data_2_out : out std_logic_vector(15 downto 0)
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
		port
		(
			-- control
			clk : in std_logic;
			reset : in std_logic;
			wren : in std_logic;
			rden : in std_logic;
			-- data ports
			data_in : in std_logic_vector (23 downto 0);
			data_out : out std_logic_vector (23 downto 0);
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
	signal PC_FETCH : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0);
	-- current program counter for decode logic
	signal PC_DECODE : std_logic_vector(INS_ADDRESS_WIDTH - 1 downto 0);

begin


end behav;

