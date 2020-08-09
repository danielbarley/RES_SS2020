library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity CPU is
	port (
		reset : in std_logic;
		inclk : in std_logic;
		output : out std_logic_vector(7 downto 0)
	);
end entity CPU;

architecture behav of CPU is

	component FETCH is
		generic (
			addr_width : integer := 10
		);
		port (
			-- control signals
			clk : in std_logic;
			stall : in std_logic;
			-- I/O
			pc_in : in std_logic_vector(addr_width - 1 downto 0);
			ins_out : out std_logic_vector(23 downto 0);
			pc_out : out std_logic_vector(addr_width - 1 downto 0);
			pc_inc_out : out std_logic_vector(addr_width - 1 downto 0)
		);
	end component FETCH;

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
	end component DECODE;

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
	end component EXECUTE;

	component MEMORY is
		generic (
			addr_width : integer := 10
		);
		port (
			-- control
			clk : in std_logic;
			-- I/O
			-- Inputs from previous stage
			pc_in : in std_logic_vector(addr_width - 1 downto 0);
			opcode_in : in std_logic_vector(4 downto 0);
			tr_in : in std_logic_vector(2 downto 0);
			imm_in : in std_logic_vector(9 downto 0);
			store_data_in : in std_logic_vector(7 downto 0);
			alu_out_in : in std_logic_vector(7 downto 0);
			-- output for writeback stage
			tr_out : out std_logic_vector(2 downto 0);
			write_data_out : out std_logic_vector(7 downto 0)
		);
	end component MEMORY;

	component WRITE_BACK is
		generic (
		addr_width : integer := 10
		);
		port (
			clk : in std_logic;
			tr_in : in std_logic_vector(2 downto 0);
			write_data_in : std_logic_vector(7 downto 0);
			tr_out : out std_logic_vector(2 downto 0);
			write_data_out : out std_logic_vector(7 downto 0);
			reg_wen_out : out std_logic
		);
	end component WRITE_BACK;

	component END_STAGE is
		port (
			clk : in std_logic := '0';
			tr_in : in std_logic_vector(2 downto 0) := (others => '0');
			write_data_in : in std_logic_vector( 7 downto 0) := (others => '0');
			tr_out : out std_logic_vector(2 downto 0) := (others => '0');
			write_data_out : out std_logic_vector(7 downto 0) := (others => '0')
		);
	end component END_STAGE;

	component MUX2x1 is
		port (
			s1 : in std_logic_vector(7 downto 0);
			s2 : in std_logic_vector(7 downto 0);
			sel : in std_logic;
			o : out std_logic_vector(7 downto 0)
		);
	end component MUX2x1;

	component MUX_PC is
		port (
			s1 : in std_logic_vector(9 downto 0);
			s2 : in std_logic_vector(9 downto 0);
			sel : in std_logic;
			o : out std_logic_vector(9 downto 0)
		);
	end component MUX_PC;

	component clk is
		port
		(
			areset		: in std_logic  := '0';
			inclk0		: in std_logic  := '0';
			c0		: out std_logic ;
			locked		: out std_logic 
		);
	end component clk;

	signal clock : std_logic := '0';
	signal stomp : std_logic := '0';
	signal stall : std_logic := '0';
	signal pc : std_logic_vector(9 downto 0) := (others => '0');
	signal pc_mux_out : std_logic_vector(9 downto 0) := (others => '0');
	signal pc_mux_sel : std_logic := '0';
	signal pc_mux_in_inc : std_logic_vector(9 downto 0) := (others => '0');
	signal pc_mux_in_branch : std_logic_vector(9 downto 0) := (others => '0');

	signal fetch_decode_ins : std_logic_vector(23 downto 0) := (others => '0');
	signal fetch_decode_pc : std_logic_vector(9 downto 0) := (others => '0');
	signal fetch_pc_inc_out : std_logic_vector(9 downto 0) := (others => '0');

	signal decode_execute_pc : std_logic_vector(9 downto 0) := (others => '0');
	signal decode_execute_opcode : std_logic_vector(4 downto 0) := (others => '0');
	signal decode_execute_tr : std_logic_vector(2 downto 0) := (others => '0');
	signal decode_execute_s1 : std_logic_vector(2 downto 0) := (others => '0');
	signal decode_execute_s2 : std_logic_vector(2 downto 0) := (others => '0');
	signal decode_execute_imm : std_logic_vector(9 downto 0) := (others => '0');
	signal decode_execute_op1 : std_logic_vector(7 downto 0) := (others => '0');
	signal decode_execute_op2 : std_logic_vector(7 downto 0) := (others => '0');

	signal execute_memory_opcode : std_logic_vector(4 downto 0) := (others => '0');
	signal execute_memory_tr : std_logic_vector(2 downto 0) := (others => '0');
	signal execute_memory_imm : std_logic_vector(9 downto 0) := (others => '0');
	signal execute_memory_store_data : std_logic_vector(7 downto 0) := (others => '0');
	signal execute_memory_alu_out : std_logic_vector(7 downto 0) := (others => '0');

	signal write_back_decode_wb_data : std_logic_vector(7 downto 0) := (others => '0');
	signal write_back_decode_wb_addr : std_logic_vector(2 downto 0) := (others => '0');
	signal write_back_decode_wb_enable : std_logic;
	signal write_back_execute_write_data : std_logic_vector(7 downto 0) := (others => '0');
	signal write_back_execute_tr : std_logic_vector(2 downto 0) := (others => '0');

	signal execute_decode_opcode_execute : std_logic_vector(4 downto 0) := (others => '0');
	signal execute_decode_tr_execute : std_logic_vector(2 downto 0) := (others => '0');

	signal memory_execute_alu_out : std_logic_vector(7 downto 0) := (others => '0');
	signal memory_execute_tr : std_logic_vector(2 downto 0) := (others => '0');
	signal memory_write_back_tr : std_logic_vector(2 downto 0) := (others => '0');
	signal memory_write_back_write_data : std_logic_vector(7 downto 0) := (others => '0');

	signal end_execute_tr : std_logic_vector(2 downto 0) := (others => '0');
	signal end_execute_write_data : std_logic_vector(7 downto 0) := (others => '0');
	signal end_tr_out : std_logic_vector(2 downto 0) := (others => '0');
	signal end_data_out : std_logic_vector(7 downto 0) := (others => '0');

begin

	MY_CLK : CLK port map (reset, inclk, clock);
	MUX_NEXT_PC : MUX_PC port map (pc_mux_in_inc, pc_mux_in_branch, pc_mux_sel, pc_mux_out);
	FETCH_STAGE : FETCH port map (clock, stall, pc_mux_out, fetch_decode_ins, fetch_decode_pc, pc_mux_in_inc);
	DECODE_STAGE : DECODE port map (
		clock,
		fetch_decode_pc,
		fetch_decode_ins,
		stomp,
		write_back_decode_wb_data,
		write_back_decode_wb_addr,
		write_back_decode_wb_enable,
		execute_decode_opcode_execute,
		execute_decode_tr_execute,
		stall,
		decode_execute_pc,
		decode_execute_opcode,
		decode_execute_tr,
		decode_execute_s1,
		decode_execute_s2,
		decode_execute_imm,
		decode_execute_op1,
		decode_execute_op2
	);
	EXECUTE_STAGE : EXECUTE port map (
		clock,
		decode_execute_pc,
		decode_execute_op1,
		decode_execute_op2,
		decode_execute_opcode,
		decode_execute_tr,
		decode_execute_s1,
		decode_execute_s2,
		decode_execute_imm,
		memory_execute_tr,
		write_back_execute_tr,
		end_execute_tr,
		memory_execute_alu_out,
		write_back_execute_write_data,
		end_execute_write_data,
		stomp,
		pc_mux_sel,
		execute_memory_opcode,
		execute_memory_tr,
		execute_memory_imm,
		execute_memory_store_data,
		execute_memory_alu_out
	);
	MEMORY_STAGE : MEMORY port map (
		clock,
		fetch_decode_pc,
		execute_memory_opcode,
		execute_memory_tr,
		execute_memory_imm,
		execute_memory_store_data,
		execute_memory_alu_out,
		memory_write_back_tr,
		memory_write_back_write_data
	);
	WRITE_BACK_STAGE : WRITE_BACK port map (
		clock,
		memory_write_back_tr,
		memory_write_back_write_data,
		write_back_execute_tr,
		write_back_decode_wb_data,
		write_back_decode_wb_enable
	);
	FINAL_STAGE : END_STAGE port map (
		clock,
		write_back_execute_tr,
		write_back_decode_wb_data,
		end_tr_out,
		end_data_out
	);

	memory_execute_tr <= memory_write_back_tr;
	write_back_decode_wb_addr <= write_back_execute_tr;
	write_back_execute_write_data <= memory_write_back_write_data;
	pc_mux_in_branch <= execute_memory_imm;
	end_execute_tr <= end_tr_out;
	end_execute_write_data <= end_data_out;
	output <= write_back_decode_wb_data;
	execute_decode_opcode_execute <= execute_memory_opcode;
	execute_decode_tr_execute <= execute_memory_tr;
	memory_execute_alu_out <= memory_write_back_write_data;

end behav;

