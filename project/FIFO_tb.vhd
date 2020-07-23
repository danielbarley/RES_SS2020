library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity FIFO_tb is
end entity;

architecture arch of FIFO_tb is

	constant data_width : integer := 23;
	constant depth : integer := 3;
	
	signal clk : std_logic := '0';
	signal reset : std_logic := '0';
	signal wren : std_logic := '0';
	signal rden : std_logic := '0';
	
	signal data_in : std_logic_vector (data_width - 1 downto 0);
	signal data_out : std_logic_vector (data_width - 1 downto 0);
	
	signal is_empty : std_logic := '0';
	signal is_full : std_logic := '0';

	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

	component FIFO is
	generic
	(
		data_width : integer;
		depth : integer
	);
	port
	(
	-- control
		clk : in std_logic;
		reset : in std_logic;
		wren : in std_logic;
		rden : in std_logic;
	-- data ports
		data_in : in std_logic_vector (data_width - 1 downto 0);
		data_out : out std_logic_vector (data_width - 1 downto 0);
	-- signals
		is_empty : out std_logic;
		is_full : out std_logic
	);
	end component FIFO;

begin

	uut: FIFO generic map(data_width, depth) port map(clk, reset, wren, rden, data_in, data_out, is_empty, is_full);
	
	clk <= not clk after half_clk_period;
	
	process
	begin
	
		wait until Clk'event and Clk='1';
		
		wren <= '1';
		data_in <= (5 downto 2 => '1', others => '0');
		wait for clk_period;
		
		data_in <= (17 downto 10 => '1', others => '0');
		wait for clk_period;
		
		data_in <= (14 downto 10 => '1', others => '0');
		wait for clk_period;
		
		data_in <= (12 downto 8 => '1', others => '0');
		wait for clk_period;		
		
		rden <= '1';
		wait for 2 * clk_period;
		wren <= '0';
		wait for 10*clk_period;
		
		reset <= '1';
		wait for 5*clk_period;
		
		
		
	
	end process;

end architecture;





