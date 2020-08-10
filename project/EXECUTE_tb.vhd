library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;
use std.textio.ALL;

entity EXECUTE_tb is
end entity;


architecture arch of EXECUTE_tb is


	constant addr_width : integer := 10;

	-- control
	signal clk : std_logic := '0';
	-- I/O
	-- Inputs from previous stage
	signal pc_in : std_logic_vector(addr_width - 1 downto 0) := (others => '0');
	signal op1_in : std_logic_vector(7 downto 0) := (others => '0');
	signal op2_in : std_logic_vector(7 downto 0) := (others => '0');
	signal opcode_in : std_logic_vector(4 downto 0) := (others => '0');
	signal tr_in : std_logic_vector(2 downto 0) := (others => '0');
	signal s1_in : std_logic_vector(2 downto 0) := (others => '0');
	signal s2_in : std_logic_vector(2 downto 0) := (others => '0');
	signal imm_in : std_logic_vector(9 downto 0) := (others => '0');
	-- target registers of following stages
	signal tr_memory : std_logic_vector(2 downto 0) := (others => '0');
	signal tr_write_back : std_logic_vector(2 downto 0) := (others => '0');
	signal tr_end : std_logic_vector(2 downto 0) := (others => '0');
	-- alu output from later stages used when register is changed meanwhile
	signal alu_out_memory : std_logic_vector(7 downto 0) := (others => '0');
	signal write_data_write_back : std_logic_vector(7 downto 0) := (others => '0');
	signal write_data_end : std_logic_vector(7 downto 0) := (others => '0');
	-- control for other stages
	signal stomp_out : std_logic;
	signal mux_pc_out : std_logic;
	-- output for MEMORY stage
	signal opcode_out : std_logic_vector(4 downto 0);
	signal tr_out : std_logic_vector(2 downto 0);
	signal imm_out : std_logic_vector(9 downto 0);
	signal store_data_out : std_logic_vector(7 downto 0);
	signal alu_out_out : std_logic_vector(7 downto 0);



	component EXECUTE is
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
		-- alu output from later stages used when register is changed meanwhile
		alu_out_memory : in std_logic_vector(7 downto 0);
		write_data_write_back : in std_logic_vector(7 downto 0);
		write_data_end : in std_logic_vector(7 downto 0);
		-- control for other stages
		stomp_out : out std_logic;
		mux_pc_out : out std_logic;
		-- output for MEMORY stage
		opcode_out : out std_logic_vector(4 downto 0);
		tr_out : out std_logic_vector(2 downto 0);
		imm_out : out std_logic_vector(9 downto 0);
		store_data_out : out std_logic_vector(7 downto 0);
		alu_out_out : out std_logic_vector(7 downto 0)
	);
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;


begin

	uut: EXECUTE generic map(addr_width) port map(clk, pc_in, op1_in, op2_in, opcode_in, tr_in, s1_in,
																 s2_in, imm_in, tr_memory, tr_write_back, tr_end, 
																 alu_out_memory, write_data_write_back, write_data_end,
																 stomp_out, mux_pc_out, opcode_out, tr_out, imm_out, 
																 store_data_out, alu_out_out);
																 
	clk <= not clk after half_clk_period;

	process
	VARIABLE l: LINE;
	begin
	
		wait until Clk'event and Clk='0';
		
		write(l, now);
		write(l, string'(": Set opcode to addition, alu output is op1_in + op2_in = 0x43"));
		writeline(output, l);
		
		op1_in <= (2 downto 0 => '1', others => '0');
		op2_in <= (5 downto 2 => '1', others => '0');
		opcode_in <= "00000";
		tr_in <= "001";
		s1_in <= "010";
		s2_in <= "110";
		imm_in <= (others => '0');
		tr_memory <= "000";

		alu_out_memory <= (others => '0');
		write_data_write_back <= (others => '0');
		write_data_end <= (others => '0');
		
		wait for clk_period;
		assert(alu_out_out = (op1_in + op2_in)) report "Wrong ALU output 1";
		assert(tr_out = tr_in) report "Wrong target register output";
		assert(opcode_out = opcode_in) report "Wrong opcode output";
		assert(imm_out = imm_in) report "Wrong immediate output";
		
		write(l, now);
		write(l, string'(": Set opcode to immediate addition, alu output is imm_in + op2_in = 0x58"));
		writeline(output, l);
		
		opcode_in <= "00001";
		imm_in <= (4 downto 2 => '1', others => '0');
		
		wait for clk_period;
		assert(alu_out_out = (imm_in + op2_in)) report "Wrong ALU output 2";
		assert(tr_out = tr_in) report "Wrong target register output";
		assert(opcode_out = opcode_in) report "Wrong opcode output";
		assert(imm_out = imm_in) report "Wrong immediate output";
		
		write(l, now);
		write(l, string'(": Set opcode to negation, alu output is not op1_in = 0x07"));
		writeline(output, l);
		
		opcode_in <= "00110";
		wait for clk_period;
		assert(alu_out_out = (not op1_in)) report "Wrong ALU output 3";
		assert(tr_out = tr_in) report "Wrong target register output";
		assert(opcode_out = opcode_in) report "Wrong opcode output";
		assert(imm_out = imm_in) report "Wrong immediate output";

		write(l, now);
		write(l, string'(": Set opcode to branch, stomp bit is set"));
		writeline(output, l);
		
		opcode_in <= "11000";
		wait for clk_period;
		assert(stomp_out = '1') report "Stomp not set";

		write(l, now);
		write(l, string'(": NOP operation is set due to stomp, stomp bit is reset"));
		writeline(output, l);
		
		opcode_in <= "00000";
		wait for clk_period;
		assert(alu_out_out = (op1_in + op2_in)) report "Wrong ALU output 4";
		assert(tr_out = "000") report "Wrong target register output";
		assert(opcode_out = "00000") report "Wrong opcode output";
		assert(imm_out = "0000000000") report "Wrong immediate output";
		assert(stomp_out = '0') report "Stomp not reset";
		
		write(l, now);
		write(l, string'(": Set tr_memory, test if correct value is loaded for alu input"));
		writeline(output, l);
		
		opcode_in <= "00000";
		tr_memory <= "110";
		alu_out_memory <= (1 downto 0 => '1', others => '0');
		wait for clk_period;
		
	end process;


end architecture;
