library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity RAM_tb is
end entity;


architecture arch of RAM_tb is


	signal clock : STD_LOGIC  := '1';
	signal data : STD_LOGIC_VECTOR (7 DOWNTO 0);
	signal rdaddress : STD_LOGIC_VECTOR (9 DOWNTO 0);
	signal wraddress : STD_LOGIC_VECTOR (9 DOWNTO 0);
	signal wren : STD_LOGIC  := '0';
	signal q : STD_LOGIC_VECTOR (7 DOWNTO 0);


	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

	COMPONENT RAM IS
		PORT
		(
			clock		: IN STD_LOGIC  := '1';
			data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			rdaddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			wraddress		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
			wren		: IN STD_LOGIC  := '0';
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	END COMPONENT;

begin

	uut: RAM port map(clock, data, rdaddress, wraddress, wren, q);
	
	clock <= not clock after half_clk_period;

	process
	begin
	
		wait until Clock'event and Clock='0';
	
		wren <= '1';
		wraddress <= (others => '0');
		data <= (0 => '1', others => '0');
		
		wait for clk_period;
		
		wraddress <= wraddress + 1;
		data <= data + 1;
		
		wait for clk_period;
		
		wraddress <= wraddress + 1;
		data <= data + 1;
		
		wait for clk_period;
		
		wraddress <= wraddress + 1;
		data <= data + 1;
		
		wait for clk_period;
		
		wren <= '0';
		
		wait for 3 * clk_period;
		
		rdaddress <= (0 => '1', others => '0');
		
		wait for clk_period;
		
		rdaddress <= (1 => '1', others => '0');
		
		wait for clk_period;
		
		wait for 5 * clk_period;
	
		
	
	end process;
	
end architecture;