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

	component MUX3x1 is
		port (
			s1 : in std_logic_vector(7 downto 0);
			s2 : in std_logic_vector(7 downto 0);
			s3 : in std_logic_vector(7 downto 0);
			sel : in std_logic_vector(1 downto 0);
			o : out std_logic_vector(7 downto 0)
		);
	end component MUX3x1;

	signal pc : std_logic_vector(addr_width - 1 downto 0);
	signal opcode : std_logic_vector(4 downto 0);
	signal tr : std_logic_vector(2 downto 0);
	signal imm : std_logic_vector(9 downto 0);
	signal write_data : std_logic_vector(7 downto 0);
	signal store_data : std_logic_vector(7 downto 0);
	signal alu_out : std_logic_vector(7 downto 0);

	signal ram_wen : std_logic := '0';
	signal sel_mux : std_logic_vector(1 downto 0) := "00";

	signal ram_clk : std_logic;

	signal mux_in_ram : std_logic_vector(7 downto 0);
	signal mux_in_imm : std_logic_vector(7 downto 0);
	signal mux_in_alu : std_logic_vector(7 downto 0);

begin
	DATA_RAM : RAM port map (ram_clk, store_data_in, imm, imm, ram_wen, mux_in_ram);
	MUX_WRITE_DATA : MUX3x1 port map (mux_in_ram, mux_in_imm, mux_in_alu, sel_mux, write_data);

	ram_clk <= not clk;
	tr_out <= tr;
	write_data_out <= write_data;
	mux_in_imm <= imm(7 downto 0);
	mux_in_alu <= alu_out;

	ram_control : process (opcode)
	begin
		if ((opcode = "10010") or (opcode = "10011")) then -- STR / STI
			ram_wen <= '1';
		else
			ram_wen <= '0';
		end if;
	end process;

	mux_control : process (opcode)
	begin
		if (opcode = "10000") then -- LDR
			sel_mux <= "00";
		elsif (opcode = "10001") then -- LDI
			sel_mux <= "01";
		else
			sel_mux <= "10";
		end if;
	end process;

	update_input : process (clk)
	begin
		if rising_edge(clk) then
			pc <= pc_in;
			opcode <= opcode;
			tr <= tr_in;
			imm <= imm_in;
			store_data <= store_data_in;
			alu_out <= alu_out_in;
		end if;
	end process;

end behav;

