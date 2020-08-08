library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity REG is
	port (
		clk : in std_logic;
		reset : in std_logic;
		-- register addresses (8 regs -> 3bit)
		addr_wb : in std_logic_vector(2 downto 0); -- write back address
		addr_1 : in std_logic_vector(2 downto 0); -- address for operand 1
		addr_2 : in std_logic_vector(2 downto 0); -- address for operand 2
		-- control signals
		wb_en : in std_logic; -- enable write back
		-- data in ports
		wb_in : in std_logic_vector(7 downto 0); -- writeback data
		-- data out ports
		data_1_out : out std_logic_vector(7 downto 0);
		data_2_out : out std_logic_vector(7 downto 0)
	);
end entity REG;

architecture behav of REG is

	type reg_file is array(7 downto 0) of std_logic_vector(7 downto 0);
	signal regs : reg_file;

begin

	input: process (clk, reset)
	begin
		if rising_edge(clk) then
			if reset = '0'then 
				if wb_en = '1' then
					regs(to_integer(unsigned(addr_wb))) <= wb_in;
				end if;
			else
				regs <= (others => (others => '0'));
			end if;
		end if;
	end process;

	output1: process (clk, reset)
	begin
		if rising_edge(clk) then
			if reset = '0' then
				data_1_out <= regs(to_integer(unsigned(addr_1)));
			else
				data_1_out <= (others => '0');
			end if;
		end if;
	end process;

	output2: process (clk, reset)
	begin
		if rising_edge(clk) then
			if reset = '0' then
				data_2_out <= regs(to_integer(unsigned(addr_2)));
			else 
				data_2_out <= (others => '0');
			end if;
		end if;
	end process;

end behav;
