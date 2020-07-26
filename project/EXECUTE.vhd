library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity EXECUTE is
	generic (
		addr_width : integer := 10
	);
	port (
		-- control
		clk : in std_logic;
		-- I/O
		-- Inputs from previous stage
		pc_in : in std_logic_vector(addr_width - 1 downto 0);
		op1_in : in std_logic_vector(7 downto 0);
		op2_in : in std_logic_vector(7 downto 0);
		opcode_in : in std_logic_vector(4 downto 0);
		tr_in : in std_logic_vector(2 downto 0);
		s1_in : in std_logic_vector(2 downto 0);
		s2_in : in std_logic_vector(2 downto 0);
		imm_in : in std_logic_vector(9 downto 0);
		-- target registers of following stages
		tr_memory : in std_logic_vector(2 downto 0);
		tr_write_back : in std_logic_vector(2 downto 0);
		tr_end : in std_logic_vector(2 downto 0);
		-- control for other stages
		stomp_out : out std_logic;
		-- output for MEMORY stage
		opcode_out : out std_logic_vector(4 downto 0);
		tr_out : out std_logic_vector(2 downto 0);
		imm_out : out std_logic_vector(9 downto 0);
		store_data_out : out std_logic_vector(7 downto 0);
		alu_out : out std_logic_vector(7 downto 0)
	);
end entity EXECUTE;

architecture behav of EXECUTE is

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

	signal pc : std_logic_vector(addr_width - 1 downto 0);

	signal op1 : std_logic_vector(7 downto 0);
	signal op2 : std_logic_vector(7 downto 0);
	signal opcode : std_logic_vector(4 downto 0);
	signal tr : std_logic_vector(2 downto 0);
	signal s1 : std_logic_vector(2 downto 0);
	signal s2 : std_logic_vector(2 downto 0);
	signal imm : std_logic_vector(9 downto 0);

	signal clk_alu : std_logic := '0';
	signal reset_alu : std_logic := '0';
	signal ins_alu : std_logic_vector(3 downto 0);

	signal stomp : std_logic;

begin

	ALU1 : ALU port map (clk_alu, reset_alu, op1, op2, ins_alu, alu_out);

end behav;
