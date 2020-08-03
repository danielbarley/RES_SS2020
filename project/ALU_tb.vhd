library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity ALU_tb is
end entity;

architecture arch of ALU_tb is

	signal clk: std_logic := '0';
	signal reset: std_logic := '0';

	signal op1: std_logic_vector(7 downto 0) := (3 downto 1 => '1', others => '0');
	signal op2: std_logic_vector(7 downto 0) := (6 downto 3 => '1', others => '0');
	signal ins: std_logic_vector(3 downto 0) := (others => '0');

	signal output: std_logic_vector(7 downto 0);
	signal flags: std_logic_vector(7 downto 0);


	constant clk_period : time := 83.333 ns;
	constant half_clk_period : time := clk_period / 2;

	component ALU is
		port (
			-- control signals
			clk : in std_logic;
			reset : in std_logic;
			-- data
			op1 : in std_logic_vector(7 downto 0); -- operand 1
			op2 : in std_logic_vector(7 downto 0); -- operand 2
			ins : in std_logic_vector(3 downto 0); -- instruction
			-- outputs
			output : out std_logic_vector(7 downto 0); -- result
			flags : out std_logic_vector(7 downto 0) -- flags
		);
	end component;


begin
	uut: alu port map(clk, reset, op1, op2, ins, output, flags);
	
	clk <= not clk after half_clk_period;

	process
	begin

		wait until Clk'event and Clk='0';
		
		ins <= "0000";
		
		wait for clk_period;
		assert(output = (op1 + op2)) report "Wrong output addition";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 - op2)) report "Wrong output sustraction";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 + 1)) report "Wrong output increment";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 - 1)) report "Wrong output decrement";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (not op1)) report "Wrong output negation";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 and op2)) report "Wrong output and";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 or op2)) report "Wrong output or";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = (op1 xor op2)) report "Wrong output xor";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = "00000000") report "Wrong output others";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = "00000000") report "Wrong output others";
		
		ins <= ins + 1;
		
		wait for clk_period;
		assert(output = "00000000") report "Wrong output others";
		
		
	
	end process;


end architecture;





