library ieee;
use ieee.std_logic_1164.all;

entity tb_edge_sync is
end tb_edge_sync;

architecture tb of tb_edge_sync is

    component edge_sync
        port(
             data    : in std_logic;
             clk_src : in std_logic;
             clk_dst : in std_logic;
             line_out: out std_logic
        );
    end component;

    signal clk_dst    : std_logic;
    signal clk_src    : std_logic;
    signal data  : std_logic;
    signal line_out : std_logic;

    constant TbPeriod_fast : time := 10 ns;
    signal TbClock_fast    : std_logic := '1';
    signal TbSimEnded_fast : std_logic := '0';

    constant TbPeriod_slow : time := 16 ns; -- EDIT Put right period here
    signal TbClock_slow    : std_logic := '1';
    signal TbSimEnded_slow : std_logic := '0';
    
begin

    dut : edge_sync
    port map (clk_dst    => clk_dst,
              clk_src    => clk_src,
              data       => data,
              line_out   => line_out);

    -- Clock generation
    TbClock_fast <= not TbClock_fast after TbPeriod_fast/2 when TbSimEnded_fast /= '1' else '0';
    clk_dst <= TbClock_fast;

    TbClock_slow <= not TbClock_slow after TbPeriod_slow/2 when TbSimEnded_slow /= '1' else '0';
    clk_src <= TbClock_slow;
    
    stimuli : process
    begin
        data <= '0';

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        wait for 100 ns;
        data <= '1';
        
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod_fast;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded_fast <= '1';
        TbSimEnded_slow <= '1';
        wait;
    end process;

end tb;

