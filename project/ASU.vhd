library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

-- Address Storage Unit: specialized registers used to store addresses
entity ASU is
	port (
		clk : in std_logic;
		reset : in std_logic;
		-- register addresses (8 regs -> 3bit)
		addr_1 : in std_logic_vector(2 downto 0);
		addr_2 : in std_logic_vector(2 downto 0);
		-- control signals
		rd_en_1 : in std_logic;
		rd_en_2 : in std_logic;
		wr_en_1 : in std_logic;
		wr_en_2 : in std_logic;
		-- data in ports
		data_1_in : in std_logic_vector(15 downto 0);
		data_2_in : in std_logic_vector(15 downto 0);
		-- data out ports
		data_1_out : out std_logic_vector(15 downto 0);
		data_2_out : out std_logic_vector(15 downto 0)
	);
end entity ASU;

architecture behav of ASU is

	type reg_file is array(7 downto 0) of std_logic_vector(15 downto 0);
	signal regs : reg_file;

begin

	input: process (clk)
	begin
		if rising_edge(clk) then
			if wr_en_1 = '1' then
				regs(to_integer(unsigned(addr_1))) <= data_1_in;
			end if;
			
			if wr_en_2 = '1' then
				regs(to_integer(unsigned(addr_2))) <= data_2_in;
			end if;
		end if;
	end process;

	output1: process (clk)
	begin
		if rising_edge(clk) then
			if rd_en_1 = '1' then
				data_1_out <= regs(to_integer(unsigned(addr_1)));
			end if;
		end if;
	end process;

	output2: process (clk)
	begin
		if rising_edge(clk) then
			if rd_en_2 = '1' then
				data_2_out <= regs(to_integer(unsigned(addr_2)));
			end if;
		end if;
	end process;

end behav;
