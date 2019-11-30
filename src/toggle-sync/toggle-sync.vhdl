library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------------------------------------
entity toggle_sync is
    port(
        clk_dst    : in std_logic;
        clk_src    : in std_logic;
        toggle_in  : in std_logic;
        toggle_out : out std_logic
    );
end toggle_sync;
-------------------------------------------------------------------------------
architecture beha of toggle_sync is
    component ff_D is
        port(	
                lineD : in std_logic;
                clk   : in std_logic;
                lineQ : out std_logic
        );
    end component ff_D;    

   signal input_s : std_logic := '0';
   signal meta  : std_logic:= '0';
   signal Q2_D3 : std_logic:= '0';
   signal Q3    : std_logic:= '0';

begin
   FFsrc  : ff_D port map (
                  lineD => input_s,
                  clk => clk_src,
                  lineQ => meta
              ); 

   FFdst1 : ff_D port map(
                  lineD => meta,
                  clk   => clk_dst  ,
                  lineQ => Q2_D3
              );
   
   FFdst2 : ff_D port map(
                  lineD => Q2_D3,
                  clk   => clk_dst  ,
                  lineQ => Q3
              );

   
   input_s    <= toggle_in;
   toggle_out <=  Q3;
end beha;
-------------------------------------------------------------------------------



