-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 8.11.2019 23:09:47 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_pulse_sync is
end tb_pulse_sync;

architecture tb of tb_pulse_sync is

    component pulse_sync
        port(
            clk_dst : in std_logic;
            clk_src : in std_logic;
            data : in std_logic;
            toggle : out std_logic
        );
    end component;

    signal clk_dst    : std_logic;
    signal clk_src    : std_logic;
    signal data  : std_logic;
    signal toggle_s : std_logic;

    constant TbPeriod_fast : time := 6 ns;
    signal TbClock_fast    : std_logic := '1';
    signal TbSimEnded_fast : std_logic := '0';

    constant TbPeriod_slow : time := 20 ns; -- EDIT Put right period here
    signal TbClock_slow    : std_logic := '1';
    signal TbSimEnded_slow : std_logic := '0';
    
begin

    dut : pulse_sync
    port map (clk_dst    => clk_dst,
              clk_src    => clk_src,
              data       => data,
              toggle   => toggle_s);

    -- Clock generation
    TbClock_fast <= not TbClock_fast after TbPeriod_fast/2 when TbSimEnded_fast /= '1' else '0';
    clk_src <= TbClock_fast;

    TbClock_slow <= not TbClock_slow after TbPeriod_slow/2 when TbSimEnded_slow /= '1' else '0';
    clk_dst <= TbClock_slow;
    
    stimuli : process
    begin
        data <= '0';

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        wait for 60 ns;
        data <= '1';
        wait for 6 ns;

        data <= '0';
        wait for 80 ns;

        data <= '1';
        wait for  6 ns;

        data <= '0';
        wait for 50 ns;
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod_fast;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded_fast <= '1';
        TbSimEnded_slow <= '1';
        wait;
    end process;

end tb;

