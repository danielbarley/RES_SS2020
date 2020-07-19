library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

entity ALU is
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
end entity ALU;

architecture behav of ALU is

	constant ZERO_FLAG : integer := 7; -- set if output is zero
	constant NEGATIVE_FLAG : integer := 6; -- set if output is negative
	constant POSITIVE_FPAG : integer := 5; -- set if output is positive
	-- TODO: OVERFLOW_FLAG
	-- TODO: CARRY_FLAG

	signal result : std_logic_vector(7 downto 0); -- buffer for output

begin
	process (op1, op2, ins)
	begin
		case(ins) is
			when "0000" => -- addition
				result <= op1 + op2;
			when "0001" => -- subtraction
				result <= op1 - op2;
			when "0010" => -- increment
				result <= op1 + 1;
			when "0011" => -- decrement
				result <= op1 - 1;
			when "0100" => -- negate
				result <= not op1;
			when "0101" => -- and
				result <= op1 and op2;
			when "0110" => -- or
				result <= op1 or op2;
			when "0111" => -- xor
				result <= op1 xor op2;
			when others =>
				result <= "00000000";
		end case;
	end process;

	process (clk)
	begin
		output <= result;
	end process;
end behav;
