library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity END_STAGE is
	port (
		clk : in std_logic := '0';
		tr_in : in std_logic_vector(2 downto 0) := (others => '0');
		write_data_in : in std_logic_vector( 7 downto 0) := (others => '0');
		tr_out : out std_logic_vector(2 downto 0) := (others => '0');
		write_data_out : out std_logic_vector(7 downto 0) := (others => '0')
	);
end entity END_STAGE;

architecture behav of END_STAGE is

	signal tr : std_logic_vector(2 downto 0);
	signal write_data : std_logic_vector(7 downto 0);

begin

	tr_out <= tr;
	write_data_out <= write_data;

	update_input : process (clk)
	begin
		if rising_edge(clk) then
			tr <= tr_in;
			write_data <= write_data_in;
		end if;
	end process;

end behav;

