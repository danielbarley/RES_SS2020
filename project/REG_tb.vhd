library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity REG_tb is
end entity;

architecture arch of REG_tb is

	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	
	signal addr_1 : std_logic_vector(2 downto 0) := (others => '0');
	signal addr_2 : std_logic_vector(2 downto 0) := (others => '0');
	
	signal rd_en_1 : std_logic := '0';
	signal rd_en_2 : std_logic := '0';
	signal wr_en_1 : std_logic := '0';
	signal wr_en_2 : std_logic := '0';
	
	signal data_1_in : std_logic_vector(7 downto 0) := (others => '0');
	signal data_2_in : std_logic_vector(7 downto 0) := (others => '0');
	
	signal data_1_out : std_logic_vector(7 downto 0);
	signal data_2_out : std_logic_vector(7 downto 0);

	component reg is
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
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

begin

	uut: reg port map(clk, reset, addr_1, addr_2, rd_en_1, rd_en_2, wr_en_1, wr_en_2, 
							data_1_in, data_2_in, data_1_out, data_2_out);
	
	clk <= not clk after half_clk_period;

	process
	begin
		
		wait until Clk'event and Clk='0';
		
		data_1_in <= (3 downto 0 => '1', others => '0');
		data_2_in <= (5 downto 3 => '1', others => '0');
		
		addr_1 <= (0 => '1', others => '0');
		addr_2 <= (1 => '1', others => '0');
		
		wr_en_1 <= '1';
		wait for clk_period;
		
		wr_en_2 <= '1';
		wait for clk_period;
	
		wr_en_1 <= '0';
		data_1_in <= (6 downto 4 => '1', others => '0');
		data_2_in <= (7 downto 6 => '1', others => '0');
		wait for clk_period;
		
		wr_en_2 <= '0';
		wait for clk_period;
		
		rd_en_1 <= '1';
		wait for clk_period;
		
		rd_en_2 <= '1';
		wait for clk_period;
		
		rd_en_1 <= '0';
		wait for clk_period;
		
		data_2_in <= (5 => '1', others => '0');
		wr_en_2 <= '1';
		wait for clk_period;
		
		wr_en_2 <= '0';
		wait for clk_period;
		rd_en_2 <= '0';
		
	
	end process;


end architecture;