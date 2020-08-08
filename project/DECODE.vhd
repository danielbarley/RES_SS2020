library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity DECODE is
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
end entity DECODE;

architecture behav of DECODE is

	component REG is
		port (
			clk : in std_logic;
			reset : in std_logic;
			-- register addresses (8 regs -> 3bit)
			addr_wb : in std_logic_vector(2 downto 0); -- write back address
			addr_1 : in std_logic_vector(2 downto 0); -- address for operand 1
			addr_2 : in std_logic_vector(2 downto 0); -- address for operand 2
			-- control signals
			wb_en : in std_logic; -- enable write back
			-- data in ports
			wb_in : in std_logic_vector(7 downto 0); -- writeback data
			-- data out ports
			data_1_out : out std_logic_vector(7 downto 0);
			data_2_out : out std_logic_vector(7 downto 0)
		);
	end component REG;

	signal pc : std_logic_vector(addr_width - 1 downto 0);
	signal ins : std_logic_vector(23 downto 0);

	-- dissect instruction into components
	signal opcode : std_logic_vector(4 downto 0); -- opcode
	signal tr : std_logic_vector(2 downto 0); -- target register use 000 for masking
	signal s1 : std_logic_vector(2 downto 0); -- register of first operand
	signal s2 : std_logic_vector(2 downto 0); -- register of second operand
	signal imm : std_logic_vector(9 downto 0);

	signal clk_reg : std_logic := '0';
	signal reset_reg : std_logic := '0';
	signal stall : std_logic := '0';

begin

	DATA_REG : REG port map (clk_reg, reset_reg, wb_addr, s1, s2, wb_enable, wb_data, op1_out, op2_out);

	-- invert register clock so data becomes available druing duty cycle
	clk_reg <= not clk;
	pc_out <= pc;
	-- when stalling send NOP to EXECUTE stage
	with stall select
		opcode_out <= opcode when '0',
			      "00000" when others;
	with stall select
		tr_out <= tr when '0',
			  "000" when others;
	s1_out <= s1;
	s2_out <= s2;
	imm_out <= imm;
	stall_out <= stall;

	update_input : process (clk)
	begin
		if (rising_edge(clk)) then
			if (stall = '0') then
				pc <= pc_in;
				opcode <= ins_in(23 downto 19);
				tr <= ins_in(18 downto 16);
				s1 <= ins_in(15 downto 13);
				s2 <= ins_in(12 downto 10);
				imm <= ins_in(9 downto 0);
			end if;
			if (stomp = '1') then
				opcode <= "00000";
				tr <= "000";
				s1 <= "000";
				s2 <= "000";
				imm <= "0000000000";
			end if;
		end if;
	end process;

	-- check that no load in execute stage targets any register in decoded instruction
	-- "10000" -> lda, "10001" -> ldi
	control : process (tr, s1, s2, tr_execute, opcode_execute)
	begin
		if ((opcode_execute = "10000") or (opcode_execute = "10001")) then
			if ((tr_execute = tr) or (tr_execute = s1) or (tr_execute = s2)) then
				stall <= '1';
			else
				stall <= '0';
			end if;
		else
			stall <= '0';
		end if;
	end process;

end behav;
