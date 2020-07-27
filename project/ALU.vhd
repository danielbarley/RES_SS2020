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
	constant POSITIVE_FLAG : integer := 5; -- set if output is positive
	constant EQUAL_FLAG : integer := 4; -- set if operands are equal
	constant LESS_FLAG : integer := 3; -- set if op1 < op2
	constant GREATER_FLAG : integer := 2; -- set if op1 > op1
	-- TODO: OVERFLOW_FLAG
	-- TODO: CARRY_FLAG

	signal temp_out : std_logic_vector(7 downto 0); -- buffer for output
	signal temp_flags : std_logic_vector(7 downto 0); -- buffer for flags

begin
	process (op1, op2, ins)
	begin
		case(ins) is
			when "0000" => -- addition
				temp_out <= op1 + op2;
			when "0001" => -- subtraction
				temp_out <= op1 - op2;
			when "0010" => -- increment
				temp_out <= op1 + 1;
			when "0011" => -- decrement
				temp_out <= op1 - 1;
			when "0100" => -- negate
				temp_out <= not op1;
			when "0101" => -- and
				temp_out <= op1 and op2;
			when "0110" => -- or
				temp_out <= op1 or op2;
			when "0111" => -- xor
				temp_out <= op1 xor op2;
			when others =>
				temp_out <= "00000000";
		end case;
	end process;

	process (temp_out, op1, op2)
	begin
		temp_flags <= "00000000";
		if temp_out = "00000000" then
			temp_flags(ZERO_FLAG) <= '1';
		else
			if temp_out(7) = '1' then
				temp_flags(NEGATIVE_FLAG) <= '1';
			else
				temp_flags(POSITIVE_FLAG) <= '1';
			end if;
		end if;
		if (to_integer(unsigned(op1)) > to_integer(unsigned(op2))) then
			temp_flags(GREATER_FLAG) <= '1';
		end if;
		if (to_integer(unsigned(op1)) < to_integer(unsigned(op2))) then
			temp_flags(LESS_FLAG) <= '1';
		end if;
		if (to_integer(unsigned(op1)) = to_integer(unsigned(op2))) then
			temp_flags(EQUAL_FLAG) <= '1';
		end if;
	end process;

	process (clk)
	begin
		if rising_edge(clk) then
			output <= temp_out;
			flags <= temp_flags;
		end if;
	end process;
end behav;
