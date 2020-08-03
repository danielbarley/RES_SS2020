library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity REG_tb is
end entity;

architecture arch of REG_tb is

	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	
	signal addr_wb : std_logic_vector(2 downto 0) := (others => '0');
	signal addr_1 : std_logic_vector(2 downto 0) := (others => '0');
	signal addr_2 : std_logic_vector(2 downto 0) := (others => '0');
	
	signal wb_en : std_logic := '0';
	signal wb_in : std_logic_vector(7 downto 0) := (others => '0');
	
	signal data_1_out : std_logic_vector(7 downto 0);
	signal data_2_out : std_logic_vector(7 downto 0);

	component reg is
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
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

begin

	uut: reg port map(clk, reset, addr_wb, addr_1, addr_2, 
							wb_en, wb_in, data_1_out, data_2_out);
	
	clk <= not clk after half_clk_period;

	process
	begin
		
		wait until Clk'event and Clk='0';
		
		addr_wb <= "001";
		wb_in <= (3 downto 1 => '1', others => '0');
		wb_en <= '1';
		
		wait for clk_period;
		
		addr_wb <= addr_wb + 1;
		wb_in <= (7 downto 4 => '1', others => '0');
		
		wait for clk_period;
		
		addr_wb <= addr_wb + 1;
		wb_in <= (0 => '1', others => '0');
		
		wait for clk_period;
		
		addr_wb <= addr_wb + 1;
		wb_in <= (4 => '1', others => '0');
		
		wait for clk_period;
		
		wb_en <= '0';
		
		addr_1 <= "001";
		addr_2 <= "010";
		
		wait for clk_period;
		assert(data_1_out = "00001110") report "Wrong output 1";
		assert(data_2_out = "11110000") report "Wrong result 2";
		
		addr_1 <= "010";
		addr_2 <= "011";
		
		wait for clk_period;
		assert(data_1_out = "11110000") report "Wrong output 1";
		assert(data_2_out = "00000001") report "Wrong result 2";
		
		
		
	
	end process;


end architecture;