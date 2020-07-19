library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity REG is
	generic (
		
	);
	port (
		clk : in std_logic;
		reset : in std_logic;
		-- addresses for reading data registers
		-- 8 registers -> 3 bit addresses
		-- also implement data register as dual port so 2 operands can
		-- be loaded simultaneously by ALU
		addr_data_read_1 : in std_logic_vector(2 downto 0);
		addr_data_read_2 : in std_logic_vector(2 downto 0);
		-- input port
		data_in : in std_logic_vector(7 downto 0);
	);
end entity REG;

