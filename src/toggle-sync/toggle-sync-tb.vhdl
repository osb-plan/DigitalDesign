-- Testbench automatically generated online
-- at http://vhdl.lapinoo.net
-- Generation date : 8.11.2019 23:09:47 GMT

library ieee;
use ieee.std_logic_1164.all;

entity tb_toggle_sync is
end tb_toggle_sync;

architecture tb of tb_toggle_sync is

    component toggle_sync
        port (clk_dst    : in std_logic;
              clk_src    : in std_logic;
              toggle_in  : in std_logic;
              toggle_out : out std_logic);
    end component;

    signal clk_dst    : std_logic;
    signal clk_src    : std_logic;
    signal toggle_in  : std_logic;
    signal toggle_out : std_logic;

    constant TbPeriod_fast : time := 20 ns;
    signal TbClock_fast    : std_logic := '1';
    signal TbSimEnded_fast : std_logic := '0';


    constant TbPeriod_slow : time := 6 ns; -- EDIT Put right period here
    signal TbClock_slow    : std_logic := '1';
    signal TbSimEnded_slow : std_logic := '0';
    
begin

    dut : toggle_sync
    port map (clk_dst    => clk_dst,
              clk_src    => clk_src,
              toggle_in  => toggle_in,
              toggle_out => toggle_out);

    -- Clock generation
    TbClock_fast <= not TbClock_fast after TbPeriod_fast/2 when TbSimEnded_fast /= '1' else '0';
    clk_dst <= TbClock_fast;

    TbClock_slow <= not TbClock_slow after TbPeriod_slow/2 when TbSimEnded_slow /= '1' else '0';
    clk_src <= TbClock_slow;
    
    stimuli : process
    begin
        toggle_in <= '0';

        -- Reset generation
        --  EDIT: Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        wait for 100 ns;
        toggle_in <= '1';
        wait for 6 ns;
        toggle_in <= '0';        
        
        wait for 100 ns;
        toggle_in <= '1';
        wait for 20 ns;
        toggle_in <= '0';        
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod_fast;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded_fast <= '1';
        TbSimEnded_slow <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_toggle_sync of tb_toggle_sync is
    for tb
    end for;
end cfg_tb_toggle_sync;
