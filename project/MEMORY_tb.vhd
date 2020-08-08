library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity MEMORY_tb is
end entity;

architecture arch of MEMORY_tb is

	constant addr_width : integer := 10;
	
	-- control
	signal clk : std_logic := '0';
	-- I/O
	-- Inputs from previous stage
	signal pc_in : std_logic_vector(addr_width - 1 downto 0) := (others => '0');
	signal opcode_in : std_logic_vector(4 downto 0) := (others => '0');
	signal tr_in : std_logic_vector(2 downto 0) := (others => '0');
	signal imm_in : std_logic_vector(9 downto 0) := (others => '0');
	signal store_data_in : std_logic_vector(7 downto 0) := (others => '0');
	signal alu_out_in : std_logic_vector(7 downto 0) := (others => '0');
	-- output for writeback stage
	signal tr_out : std_logic_vector(2 downto 0);
	signal write_data_out : std_logic_vector(7 downto 0);


	component MEMORY is
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
	end component;
	
	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;


begin

	uut: MEMORY generic map(addr_width) port map(clk, pc_in, opcode_in, tr_in, imm_in, store_data_in,
																alu_out_in, tr_out, write_data_out);
																
	clk <= not clk after half_clk_period;

	process
	begin
	
		wait until Clk'event and Clk='0';
	
		opcode_in <= "10010";
		imm_in <= (2 => '1', others => '0');
		store_data_in <= (3 downto 0 => '1', others  => '0');
		
		wait for clk_period;
		
		opcode_in <= "10000";
		
		wait for clk_period;
	
	end process;



end architecture;