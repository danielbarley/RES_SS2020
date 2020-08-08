library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;
use std.textio.ALL;

entity DECODE_tb is
end entity;



architecture arch of DECODE_tb is

		constant addr_width : integer := 10;
		
		-- control signals
		signal clk : std_logic := '0';
		-- I/O
		-- Inputs from previous stage
		signal pc_in : std_logic_vector(addr_width - 1 downto 0) := (others => '0');
		signal ins_in : std_logic_vector(23 downto 0) := (others => '0');
		-- inputs from Execute
		signal stomp : std_logic := '0';
		-- inputs from write back stage
		signal wb_data : std_logic_vector(7 downto 0) := (others => '0');
		signal wb_addr : std_logic_vector(2 downto 0) := (others => '0');
		signal wb_enable : std_logic := '0';
		-- opcode/tr from execute stage needed for stalling pipeline
		signal opcode_execute : std_logic_vector(4 downto 0) := (others => '0');
		signal tr_execute : std_logic_vector(2 downto 0) := (others => '0');
		-- control for other stages
		signal stall_out : std_logic;
		-- output for EXECUTE stage
		signal pc_out : std_logic_vector(addr_width - 1 downto 0);
		signal opcode_out : std_logic_vector(4 downto 0);
		signal tr_out : std_logic_vector(2 downto 0);
		signal s1_out : std_logic_vector(2 downto 0);
		signal s2_out : std_logic_vector(2 downto 0);
		signal imm_out : std_logic_vector(9 downto 0);
		signal op1_out : std_logic_vector(7 downto 0);
		signal op2_out : std_logic_vector(7 downto 0);
			
			

	component DECODE is
		generic (
			addr_width : integer := 10
		);
		port (
			-- control signals
			clk : in std_logic;
			-- I/O
			-- Inputs from previous stage
			pc_in : in std_logic_vector(addr_width - 1 downto 0);
			ins_in : in std_logic_vector(23 downto 0);
			-- inputs from Execute
			stomp : in std_logic;
			-- inputs from write back stage
			wb_data : in std_logic_vector(7 downto 0);
			wb_addr : in std_logic_vector(2 downto 0);
			wb_enable : in std_logic;
			-- opcode/tr from execute stage needed for stalling pipeline
			opcode_execute : in std_logic_vector(4 downto 0);
			tr_execute : in std_logic_vector(2 downto 0);
			-- control for other stages
			stall_out : out std_logic;
			-- output for EXECUTE stage
			pc_out : out std_logic_vector(addr_width - 1 downto 0);
			opcode_out : out std_logic_vector(4 downto 0);
			tr_out : out std_logic_vector(2 downto 0);
			s1_out : out std_logic_vector(2 downto 0);
			s2_out : out std_logic_vector(2 downto 0);
			imm_out : out std_logic_vector(9 downto 0);
			op1_out : out std_logic_vector(7 downto 0);
			op2_out : out std_logic_vector(7 downto 0)
		);
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;


begin

	uut: DECODE generic map(addr_width) port map(clk, pc_in, ins_in, stomp, wb_data, wb_addr, wb_enable, 
																opcode_execute, tr_execute, stall_out, pc_out, opcode_out,
																tr_out, s1_out, s2_out, imm_out, op1_out, op2_out);

	clk <= not clk after half_clk_period;
	
	
	
	process
	VARIABLE l: LINE;
	begin
	
		wait until Clk'event and Clk='0';
		
		write(l, now);
		write(l, string'(": Set ins_in to check correct deconding of instruction value"));
		writeline(output, l);
		write(l, string'("No data was written back yet, so the operands are 0"));
		writeline(output, l);
		write(l, string'("The opcode of the execute state is no load or store operation, thus does not affect decoding"));
		writeline(output, l);
		
		pc_in <= (0 => '1', others => '0');
		ins_in <= "000000010100110000000000";
		wb_data <= (1 => '1', others => '0');
		wb_addr <= "101";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;	
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		
		
		write(l, now);
		write(l, string'(": Enable write back, wb_data 0x02 is written into wb_addr 101"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000010010100110001100000";
		wb_data <= (1 => '1', others => '0');
		wb_addr <= "101";
		wb_enable <= '1';
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		
		write(l, now);
		write(l, string'(": wb_data 0x0E is written into wb_addr 011"));
		writeline(output, l);
		write(l, string'("The opcode of the decode stage is set to a load operation"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "100000010100110001100000";
		wb_data <= (3 downto 1 => '1', others => '0');
		wb_addr <= "011";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		
		write(l, now);
		write(l, string'(": The opcode of the execute state is set to a load operation, thus the stall flag is set and the output is NOP"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000010010100110001100000";
		wb_data <= (3 downto 1 => '1', others => '0');
		wb_addr <= "011";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = "00000") report "Wrong opcode";
		assert(tr_out = "000") report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		assert(stall_out = '1') report "Stall not set";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		wait for clk_period;
		
		write(l, now);
		write(l, string'(": The opcode of the execute state is reset to no load or store operation, thus the stall flag is reset"));
		writeline(output, l);
		write(l, string'("Since data was written back to source address 2 (011), op2_out is set to 0x0E"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000100010100110001100000";
		wb_data <= (3 downto 1 => '1', others => '0');
		wb_addr <= "011";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		assert(stall_out = '0') report "Stall not reset";
		assert(op2_out = "00001110") report "Wrong op2";
		
		
		write(l, now);
		write(l, string'(": Set source register 1 to address 101 to which was written back 0x02, op1_out is 0x02"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000100011010110000000100";
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		assert(op1_out = "00000010") report "Wrong op1";		
		
		
		write(l, now);
		write(l, string'(": Set stomp, all decoded parameters are 0"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000000010100110001100000";
		wb_data <= (3 downto 1 => '1', others => '0');
		wb_addr <= "011";
		stomp <= '1';
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;

		wait for clk_period;
		assert(opcode_out = "00000") report "Wrong opcode";
		assert(tr_out = "000") report "Wrong transmission register";
		assert(s1_out = "000") report "Wrong source register 1";
		assert(s2_out = "000") report "Wrong source register 2";
		assert(imm_out = "0000000000") report "Wrong immediate value";
		
		
		write(l, now);
		write(l, string'(": Reset stomp"));
		writeline(output, l);
		
		pc_in <= pc_in + 1;
		ins_in <= "000110010100110001100000";
		wb_data <= (3 downto 1 => '1', others => '0');
		wb_addr <= "011";
		stomp <= '0';
		
		opcode_execute <= opcode_out;
		tr_execute <= tr_out;
		
		wait for clk_period;
		assert(opcode_out = ins_in(23 downto 19)) report "Wrong opcode";
		assert(tr_out = ins_in(18 downto 16)) report "Wrong transmission register";
		assert(s1_out = ins_in(15 downto 13)) report "Wrong source register 1";
		assert(s2_out = ins_in(12 downto 10)) report "Wrong source register 2";
		assert(imm_out = ins_in(9 downto 0)) report "Wrong immediate value";
		
		
	end process;


end architecture;