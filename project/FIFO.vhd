library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity FIFO is
	generic
	(
		data_width : integer := 23;
		depth : integer := 3
	);
	port
	(
	-- control
		clk : in std_logic;
		reset : in std_logic;
		wren : in std_logic;
		rden : in std_logic;
	-- data ports
		data_in : in std_logic_vector (data_width - 1 downto 0);
		data_out : out std_logic_vector (data_width - 1 downto 0);
	-- signals
		is_empty : out std_logic;
		is_full : out std_logic
	);
end entity FIFO;


architecture behav of FIFO is

	type fifo is array(depth - 1 downto 0) of std_logic_vector(data_width - 1 downto 0);
	signal queue : fifo;
	signal head : integer range 0 to depth - 1 := 0;
	signal tail : integer range 0 to depth - 1 := 0;
	shared variable full : integer range 0 to depth := 0;

begin
	
	/*que: process(clk)
	
	begin
	
		if rising_edge(clk) then 
			if reset = '0' then
			
				if rden = '1' then
					if is_empty = '0' then 
						data_out <= queue(head);
						full := full - 1;
						if head = depth - 1 then
							head <= 0;
						else
							head <= head + 1;
						end if;
					end if;
				end if;
					
				if wren = '1' then
					if is_full = '0' then
						full := full + 1;
						queue(tail) <= data_in;
						if tail = depth - 1 then
							tail <= 0;
						else
							tail <= tail + 1;
						end if;
					end if;
				end if;
				
			end if;
			
			if(reset = '1') then 
				queue <= (others => (others => '0'));
			end if;
			
		end if;
	
	end process;*/
	
	process(clk)
	
	begin
	
		if rising_edge(clk) then 
			if reset = '0' then
			
				if rden = '1' then
					if is_empty = '0' then 
						data_out <= queue(head);
					end if;
				end if;
					
				if wren = '1' then
					if is_full = '0' then
						queue(tail) <= data_in;
					end if;
				end if;
				
			end if;
			
			if(reset = '1') then 
				queue <= (others => (others => '0'));
			end if;
			
		end if;
	
	end process;
	
	que: process(clk)
	
	begin
	
		if rising_edge(clk) then 
			if reset = '0' then
			
				if rden = '1' then
					if is_empty = '0' then 
						full := full - 1;
						if head = depth - 1 then
							head <= 0;
						else
							head <= head + 1;
						end if;
					end if;
				end if;
					
				if wren = '1' then
					if is_full = '0' then
						full := full + 1;
						if tail = depth - 1 then
							tail <= 0;
						else
							tail <= tail + 1;
						end if;
					end if;
				end if;
				
			end if;			
		end if;
	
	end process;
	
	flags: process(clk, head, tail)
	begin
	
		if full = 0 then 
			is_empty <= '1';
		else
			is_empty <= '0';
		end if;
		if full = depth then 
			is_full <= '1';
		else
			is_full <= '0';
		end if;
	
	end process;

end architecture;
	
	

	
	