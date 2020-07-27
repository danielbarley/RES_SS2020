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
		write_data_in : in std_logic_vector(7 downto 0);
		tr_out : out std_logic_vector(2 downto 0);
		write_data_out : out std_logic_vector(7 downto 0);
		reg_wen_out : out std_logic
	);
end entity WRITE_BACK;

architecture behav of WRITE_BACK is

	signal tr : std_logic_vector(2 downto 0);
	signal write_data : std_logic_vector(7 downto 0);

begin

	tr_out <= tr;
	write_data_out <= write_data;

	reg_wen_control : process (tr)
	begin
		if (tr = "000") then
			reg_wen_out <= '0';
		else
			reg_wen_out <= '0';
		end if;
	end process;

	update_input : process (clk)
	begin
		if rising_edge(clk) then
			tr <= tr_in;
			write_data <= write_data_in;
		end if;
	end process;

end behav;

