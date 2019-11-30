library ieee;
use ieee.std_logic_1164.all;

entity pulse_sync is
    port(
        clk_dst : in std_logic;
        clk_src : in std_logic;
        data : in std_logic;
        toggle : out std_logic
    );
end pulse_sync;

architecture structural of pulse_sync is
component T_FF is
    port( 
        T    : in std_logic;
        clk  : in std_logic;
        Q    : out std_logic
    );
end component T_FF;

component ff_D is
    port(	
            lineD : in std_logic;
            clk   : in std_logic;
            lineQ : out std_logic
    );
end component ff_D;

signal data_in : std_logic;

signal meta : std_logic;
signal meta2 : std_logic;
signal Q2_D3 : std_logic;
signal Q3 : std_logic;

signal toggle_s : std_logic;
begin

    FFT : T_FF port map(
                   T => data_in,
                   clk   => clk_src,
                   Q => meta
               );
    -- Synchro cell
    FFsrc1 : ff_D port map(
                   lineD => meta,
                   clk   => clk_src,
                   lineQ => meta2
               );
    FFdst1 : ff_D port map(
                   lineD => meta2,
                   clk   => clk_dst,
                   lineQ => Q2_D3
               );

    FFdst2 : ff_D port map(
                   lineD => Q2_D3,
                   clk   => clk_dst,
                   lineQ => Q3
               );
    -- Out FF element
    FFout : ff_D port map(
                   lineD => Q3,
                   clk   => clk_dst  ,
                   lineQ => toggle_s
               );
    data_in <= data;
    toggle <= toggle_s xor Q3;
end structural;
