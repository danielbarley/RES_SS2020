library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity MUX3x1 is
	port (
		s1 : in std_logic_vector(7 downto 0);
		s2 : in std_logic_vector(7 downto 0);
		s3 : in std_logic_vector(7 downto 0);
		sel : in std_logic_vector(1 downto 0);
		o : out std_logic_vector(7 downto 0)
	);
end entity MUX3x1;

architecture behav of MUX3x1 is

begin

	with sel select
		o <= s1 when "00",
		     s2 when "01",
		     s3 when "10",
		     "00000000" when others;

end behav;
