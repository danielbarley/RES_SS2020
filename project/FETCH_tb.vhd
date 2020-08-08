library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;
use std.textio.ALL;

entity FETCH_tb is
end entity;

architecture arch of FETCH_tb is

	constant addr_width : integer := 10;
	-- control signals
	signal clk : std_logic := '0';
	signal stall : std_logic := '0';
	-- I/O
	signal pc_in : std_logic_vector(addr_width - 1 downto 0) := (others => '0');
	signal ins_out : std_logic_vector(23 downto 0);
	signal pc_out : std_logic_vector(addr_width - 1 downto 0);
	signal pc_inc_out : std_logic_vector(addr_width - 1 downto 0);

	
	component FETCH is
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
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;


begin

	uut: FETCH generic map(addr_width) port map(clk, stall, pc_in, ins_out, pc_out, pc_inc_out);

	clk <= not clk after half_clk_period;
	
	process
	VARIABLE l: LINE;
	begin
	
		wait until Clk'event and Clk='0';
		
		pc_in <= (others => '0');
		stall <= '0';
		
		write(l, now);
		write(l, string'(": Set PC to 0, get instruction at ROM-address 0 (set in .mif file)"));
		writeline(output, l);
		
		wait for clk_period;
		assert(ins_out = "000000010101000000000000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Increment PC to 1, get instruction at ROM-address 1 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000011001001010000110000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Increment PC to 2, get instruction at ROM-address 2 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000111000010011000110000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Increment PC to 3, get instruction at ROM-address 3 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "010000010101100000000000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Set stall, incrementation of PC is paused"));
		writeline(output, l);
		
		stall <= '1';
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "010000010101100000000000") report "Wrong instruction from ROM";
		
		stall <= '0';
		
		write(l, now);
		write(l, string'(": Reset stall, increment PC to 4, get instruction at ROM-address 4 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000000000000000000000000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Increment PC to 5, get instruction at ROM-address 5 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000000000000000000000000") report "Wrong instruction from ROM";		
		
		write(l, now);
		write(l, string'(": Increment PC to 6, get instruction at ROM-address 6 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000000100011000011100000") report "Wrong instruction from ROM";
		
		write(l, now);
		write(l, string'(": Increment PC to 7, get instruction at ROM-address 7 (set in .mif file)"));
		writeline(output, l);
		
		pc_in <= pc_inc_out;
		wait for clk_period;
		assert(ins_out = "000111100011000000000000") report "Wrong instruction from ROM";
		
		
	
	end process;
	
	
end architecture;

