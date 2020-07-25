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

	signal addr_op_1 : std_logic_vector (2 downto 0);
	signal addr_op_2 : std_logic_vector (2 downto 0);
	signal pc : std_logic_vector(addr_width - 1 downto 0);

	signal clk_reg : std_logic := '0';
	signal reset_reg : std_logic := '0';

begin

	DATA_REG : REG port map (clk_reg, reset_reg, wb_addr, addr_op_1, addr_op_2, wb_enable, wb_data, op1_out, op2_out);

	clk_reg <= not clk;

	

end behav;

