library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;


entity CPU_tb is
end entity;


architecture arch of CPU_tb is

	signal reset : std_logic := '0';
	signal inclk : std_logic := '0';
	signal output : std_logic_vector(7 downto 0);

	component CPU is
	port (
		reset : in std_logic;
		inclk : in std_logic;
		output : out std_logic_vector(7 downto 0)
	);
	end component CPU;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

begin

	uut: CPU port map(reset, inclk, output);
	
	inclk <= not inclk after half_clk_period;
	
	process
	begin
	
		wait until Inclk'event and Inclk='0';
	
	end process;

end architecture;