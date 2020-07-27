library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity MUX_PC is
	port (
		s1 : in std_logic_vector(9 downto 0);
		s2 : in std_logic_vector(9 downto 0);
		sel : in std_logic;
		o : out std_logic_vector(9 downto 0)
	);
end entity MUX_PC;

architecture behav of MUX_PC is

begin

	with sel select
		o <= s1 when '0',
		     s2 when '1',
		     "0000000000" when others;

end behav;
