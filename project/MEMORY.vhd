library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity MEMORY is
	generic (
		addr_width : integer := 10
	);
	port (
		-- control
		clk : in std_logic;
		-- I/O
		-- Inputs from previous stage
		pc_in : in std_logic_vector(addr_width - 1 downto 0);
		opcode_in : in std_logic_vector(4 downto 0);
		tr_in : in std_logic_vector(2 downto 0);
		imm_in : in std_logic_vector(9 downto 0);
		store_data_in : in std_logic_vector(7 downto 0);
		alu_out_in : in std_logic_vector(7 downto 0);
		-- output for writeback stage
		tr_out : out std_logic_vector(2 downto 0);
		write_data_out : out std_logic_vector(7 downto 0)
	);
end entity MEMORY;

architecture behav of MEMORY is

	component RAM is
		port
		(
			clock		: in std_logic  := '1';
			data		: in std_logic_vector (7 downto 0);
			rdaddress	: in std_logic_vector (9 downto 0);
			wraddress	: in std_logic_vector (9 downto 0);
			wren		: in std_logic  := '0';
			q		: out std_logic_vector (7 downto 0)
		);
	end component RAM;

	signal pc : std_logic_vector(addr_width - 1 downto 0);
	signal opcode : std_logic_vector(4 downto 0);
	signal tr : std_logic_vector(2 downto 0);
	signal imm : std_logic_vector(9 downto 0);
	signal write_data : std_logic_vector(7 downto 0);
	signal alu_out : std_logic_vector(7 downto 0);

begin

	tr_out <= tr;
	write_data_out <= write_data;

end behav;

