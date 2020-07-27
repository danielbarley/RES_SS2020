library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity WRITE_BACK is
	generic (
	addr_width : integer := 10
	);
	port (
		clk : in std_logic;
		tr_in : in std_logic_vector(2 downto 0);
		write_data_in : std_logic_vector(7 downto 0);

	);
end entity WRITE_BACK;

