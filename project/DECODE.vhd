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
		pc_in : in std_logic_vector(addr_width - 1 downto 0);
		ins_in : in std_logic_vector(23 downto 0);
		wb_data : in std_logic_vector(7 downto 0);
		wb_addr : in std_logic_vector(2 downto 0);
		wb_enable : in std_logic;
		pc_out : out std_logic_vector(addr_width - 1 downto 0);
		ins_out : out std_logic_vector(23 downto 0);
		op0_out : out std_logic_vector(addr_width - 1 downto 0);
		op1_out : out std_logic_vector(7 downto 0);
		op2_out : out std_logic_vector(7 downto 0);
		stall_out : out std_logic
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
	signal opcode : std_logic_vector(3 downto 0); -- opcode
	signal tr : std_logic_vector(2 downto 0); -- target register use 000 for masking
	signal s1 : std_logic_vector(2 downto 0); -- register of first operand
	signal s2 : std_logic_vector(2 downto 0); -- register of second operand

	signal clk_reg : std_logic := '0';
	signal reset_reg : std_logic := '0';

begin

	DATA_REG : REG port map (clk_reg, reset_reg, wb_addr, s1, s2, wb_enable, wb_data, op1_out, op2_out);

	clk_reg <= not clk;
	pc_out <= pc;

	process (clk)
	begin
		if (rising_edge(clk)) then
			pc <= pc_in;
			ins <= ins_in;
		end if;
	end process;

end behav;

