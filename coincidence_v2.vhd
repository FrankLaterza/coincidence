library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity coincidence_v2 is
	Port (clk : in std_logic;
			-- btn ins
			btn : in std_logic;
			rst : in std_logic;
			-- leds outs
			led1 : out std_logic;
			led2 : out std_logic;
			out2 : out std_logic;
			out1 : out std_logic;
			-- num outputs
			dec_out_one : out integer;
			dec_out_two : out integer;
			dec_out_three : out integer);
			-- count_out : out integer := 0);
end coincidence_v2;

architecture behavioral of coincidence_v2 is

	-- declare the ppl
	component pll IS
	port(inclk0		: IN std_logic  := '0';
		c0		: OUT std_logic ;
		-- c1		: OUT std_logic ;
		locked		: OUT std_logic );
	end component;

	-- controls
	-- signal btn_pressed : std_logic := '0';
	signal toggle : std_logic := '0';
	signal pulse : std_logic := '0';
	signal clk_400 : std_logic := '0';
	-- signal clk_400_180 : std_logic := '0';
	signal clk_lock : std_logic := '0';
	-- -- counters
	signal btn_delay : natural range 0 to 1000000000 := 0;
	signal count_blink : integer := 0;
	signal count_clk : integer := 0;
	signal count_clk_final : integer := 0;
	signal timer_a : integer := 0;
	signal timer_b : integer := 0;
	signal timer_a_small : natural range 0 to 100 := 0;
	signal timer_b_small : natural range 0 to 100 := 0;
	-- -- latches
	signal timer_a_latch : std_logic := '0';
	signal timer_b_latch : std_logic := '0';

begin
	-- make the pll
	-- pll : clock_pll port map (inclk0 => clk, c0 => clk_400, c1 => clk_400_180, locked => clk_lock);
	pll_obj : pll port map (inclk0 => clk, c0 => clk_400, locked => clk_lock);
	
	process(clk, clk_400)
	begin
		if rising_edge(clk_400) then 
			if count_clk <= 200 then
				count_clk <= count_clk + 1;
				-- pulse <= not pulse;
      		end if;
			if count_clk >= 30 and timer_a_latch <= '0' then
				timer_a_latch <= '1';
				timer_a <= count_clk;
				-- pulse <= not pulse;
		  	end if;
			if count_clk >= 150 and timer_b_latch <= '0' then
				timer_b_latch <= '1';
				timer_b <= count_clk;
				-- pulse <= not pulse;
			end if;
		end if;
	end process;
	-- led2 <= pulse;
	-- out1 <= timer_a_latch;
	-- out2 <= timer_b_latch;
	dec_out_one <= timer_a;
	dec_out_two <= timer_b;
	-- dec_out_three <= abs(timer_a-timer_b);
	-- count_out <= timer_b_small;
	
end behavioral;

