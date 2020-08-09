library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity WRITE_BACK_tb is
end entity;

architecture arch of WRITE_BACK_tb is

	constant addr_width : integer := 10;

	signal clk : std_logic := '0';
	signal tr_in : std_logic_vector(2 downto 0) := (others => '0');
	signal write_data_in : std_logic_vector(7 downto 0) := (others => '0');
	signal tr_out : std_logic_vector(2 downto 0) := (others => '0');
	signal write_data_out : std_logic_vector(7 downto 0) := (others => '0');
	signal reg_wen_out : std_logic := '0';

	component WRITE_BACK is
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
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;


begin

	uut : WRITE_BACK generic map (addr_width) port map(clk, tr_in, write_data_in, tr_out, write_data_out, reg_wen_out);
	clk <= not clk after half_clk_period;

	process
	begin
	
		wait until Clk'event and Clk='0';
		tr_in <= "000";
		write_data_in <= (others => '1');

		wait for clk_period;

		tr_in <= "001";

		wait for clk_period;

		tr_in <= "000";
	end process;



end architecture;
