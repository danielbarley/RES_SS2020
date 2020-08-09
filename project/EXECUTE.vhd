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

	component MUX4x1 is
		port (
			s1 : in std_logic_vector(7 downto 0);
			s2 : in std_logic_vector(7 downto 0);
			s3 : in std_logic_vector(7 downto 0);
			s4 : in std_logic_vector(7 downto 0);
			sel : in std_logic_vector(1 downto 0);
			o : out std_logic_vector(7 downto 0)
		);
	end component MUX4x1;

	component MUX2x1 is
		port (
			s1 : in std_logic_vector(7 downto 0);
			s2 : in std_logic_vector(7 downto 0);
			sel : in std_logic;
			o : out std_logic_vector(7 downto 0)
		);
	end component MUX2x1;

	constant ZERO_FLAG : integer := 7; -- set if output is zero
	constant NEGATIVE_FLAG : integer := 6; -- set if output is negative
	constant POSITIVE_FLAG : integer := 5; -- set if output is positive
	constant EQUAL_FLAG : integer := 4; -- set if operands are equal
	constant LESS_FLAG : integer := 3; -- set if op1 < op2
	constant GREATER_FLAG : integer := 2; -- set if op1 > op1
	-- TODO: OVERFLOW_FLAG
	-- TODO: CARRY_FLAG

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
	signal flags : std_logic_vector(7 downto 0);

	signal stomp : std_logic;

	signal sel_mux_op1 : std_logic_vector(1 downto 0);
	signal mux_op1_out : std_logic_vector(7 downto 0);

	signal sel_mux_op2 : std_logic_vector(1 downto 0);
	signal mux_op2_out : std_logic_vector(7 downto 0);

	signal sel_mux_imm : std_logic := '0';
	signal mux_imm_out : std_logic_vector(7 downto 0);

begin

	ALU1 : ALU port map (clk_alu, reset_alu, mux_imm_out, mux_op2_out, ins_alu, alu_out_out, flags);
	MUX_ALU_OP1 : MUX4x1 port map (op1, alu_out_memory, write_data_write_back, write_data_end, sel_mux_op1, mux_op1_out);
	MUX_ALU_OP2 : MUX4x1 port map (op2, alu_out_memory, write_data_write_back, write_data_end, sel_mux_op2, mux_op2_out);
	MUX_IMM : MUX2x1 port map (imm(7 downto 0), mux_op1_out, sel_mux_imm, mux_imm_out);

	clk_alu <= not clk;

	opcode_out <= opcode;
	tr_out <= tr;
	imm_out <= imm;
	store_data_out <= mux_op1_out;
	stomp_out <= stomp;

	-- control ALU input muxes:
	-- check if any of previous instructions write to input register of current
	-- instruction if so select the updated value from data line instead of
	-- from register file
	mux_alu_op1_control : process (s1, tr_memory, tr_write_back, tr_end)
	begin
		if ((s1 = tr_memory) and (s1 /= "000")) then
			sel_mux_op1 <= "01";
		elsif ((s1 = tr_write_back) and (s1 /= "000")) then
			sel_mux_op1 <= "10";
		elsif ((s1 = tr_end) and (s1 /= "000")) then
			sel_mux_op1 <= "11";
		else
			sel_mux_op1 <= "00";
		end if;
	end process;
	mux_alu_op2_control : process (s2, tr_memory, tr_write_back, tr_end)
	begin
		if ((s2 = tr_memory) and (s2 /= "000")) then
			sel_mux_op2 <= "01";
		elsif ((s2 = tr_write_back) and (s2 /= "000")) then
			sel_mux_op2 <= "10";
		elsif ((s2 = tr_end) and (s2 /= "000")) then
			sel_mux_op2 <= "11";
		else
			sel_mux_op2 <= "00";
		end if;
	end process;

	mux_imm_control : process (opcode)
	begin
		if (opcode = "00001") then
			sel_mux_imm <= '0';
		elsif (opcode = "00011") then
			sel_mux_imm <= '0';
		elsif (opcode = "01000") then
			sel_mux_imm <= '0';
		elsif (opcode = "01010") then
			sel_mux_imm <= '0';
		elsif (opcode = "01100") then
			sel_mux_imm <= '0';
		else
			sel_mux_imm <= '1';
		end if;
	end process;

	alu_control : process (opcode)
	begin
		case (opcode) is
			when "00000" => -- ADD
				ins_alu <= "0000";
			when "00001" => -- ADDI
				ins_alu <= "0000";
			when "00010" => -- SUB
				ins_alu <= "0001";
			when "00011" => -- SUBI
				ins_alu <= "0001";
			when "00100" => -- INC
				ins_alu <= "0010";
			when "00101" => -- DEC
				ins_alu <= "0011";
			when "00110" => -- NOT
				ins_alu <= "0100";
			when "00111" => -- AND
				ins_alu <= "0101";
			when "01000" => -- ANDI
				ins_alu <= "0101";
			when "01001" => -- OR
				ins_alu <= "0110";
			when "01010" => -- ORI
				ins_alu <= "0110";
			when "01011" => -- XOR
				ins_alu <= "0111";
			when "01100" => -- XORI
				ins_alu <= "0111";
			when "01101" => -- n/A
				ins_alu <= "0000";
			when "01110" => -- n/A
				ins_alu <= "0000";
			when "01111" => -- n/A
				ins_alu <= "0000";
			when "10000" => -- LDR
				ins_alu <= "0000";
			when "10001" => -- LDI
				ins_alu <= "0000";
			when "10010" => -- STR
				ins_alu <= "0000";
			when "10011" => -- STI
				ins_alu <= "0000";
			when "10100" => -- n/A
				ins_alu <= "0000";
			when "10101" => -- n/A
				ins_alu <= "0000";
			when "10110" => -- n/A
				ins_alu <= "0000";
			when "10111" => -- n/A
				ins_alu <= "0000";
			when "11000" => -- BRA
				ins_alu <= "0000";
			when "11001" => -- BEQ
				ins_alu <= "0001";
			when "11010" => -- BNQ
				ins_alu <= "0001";
			when "11011" => -- BGT
				ins_alu <= "0001";
			when "11100" => -- BGE
				ins_alu <= "0001";
			when "11101" => -- BLT
				ins_alu <= "0000";
			when "11110" => -- BLE
				ins_alu <= "0000";
			when "11111" => -- n/A
				ins_alu <= "0000";
			when others =>
				ins_alu <= "0000";
		end case;
	end process;

	-- Checks if branch is taken and issues STOMP signal accordingly
	-- also controls FETCH's PC input MUX
	stomp_control : process (opcode, flags)
	begin
		if (opcode = "11000") then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11001") and (flags(EQUAL_FLAG) = '1')) then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11010") and (flags(EQUAL_FLAG) = '0')) then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11011") and (flags(GREATER_FLAG) = '1')) then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11100") and ((flags(GREATER_FLAG) = '1') or (flags(EQUAL_FLAG) = '1'))) then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11101") and (flags(LESS_FLAG) = '1')) then
			stomp <= '1';
			mux_pc_out <= '1';
		elsif ((opcode = "11110") and ((flags(LESS_FLAG) = '1') or (flags(EQUAL_FLAG) = '1'))) then
			stomp <= '1';
			mux_pc_out <= '1';
		else
			stomp <= '0';
			mux_pc_out <= '0';
		end if;
	end process;

	update_input : process (clk)
	begin
		if rising_edge(clk) then
			if (stomp = '0') then
				pc <= pc_in;
				op1 <= op1_in;
				op2 <= op2_in;
				opcode <= opcode_in;
				tr <= tr_in;
				s1 <= s1_in;
				s2 <= s2_in;
				imm <= imm_in;
			elsif (stomp = '1') then
				opcode <= "00000";
				tr <= "000";
				imm <= "0000000000";
			end if;
		end if;
	end process;

end behav;
