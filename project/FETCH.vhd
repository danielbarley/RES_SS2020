library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity FETCH is
	generic (
		addr_width : integer := 10
	);
	port (
		-- control signals
		clk : in std_logic;
		stall : in std_logic;
		-- I/O
		pc_in : in std_logic_vector(addr_width - 1 downto 0);
		ins_out : out std_logic_vector(23 downto 0);
		pc_out : out std_logic_vector(addr_width - 1 downto 0);
		pc_inc_out : out std_logic_vector(addr_width - 1 downto 0)
	);
end entity FETCH;

architecture behav of FETCH is

	-- Instruction ROM
	component ROM is
		port
		(
			address		: in std_logic_vector (9 downto 0);
			clock		: in std_logic  := '1';
			q		: out std_logic_vector (23 downto 0)
		);
	end component ROM;

	-- incremented pc used as input for next fetch
	signal pc : std_logic_vector(addr_width - 1 downto 0) := (others => '0');

begin

	INSTRUCTION_ROM : ROM port map (pc, clk, ins_out);

	pc_inc_out <= std_logic_vector(unsigned(pc) + 1);
	pc_out <= pc;

	-- only update pc if no stall occurs
	update_pc: process (clk)
	begin
		if rising_edge(clk) then
			if (stall = '0') then
				pc <= pc_in;
			end if;
		end if;
	end process;

end behav;
