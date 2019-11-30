library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity edge_sync is
    port(
         data    : in std_logic;
         clk_src : in std_logic;
         clk_dst : in std_logic;
         line_out: out std_logic
    );

end edge_sync;


architecture beha of edge_sync is
    
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

input_s <= data;
   
   line_out <=   (not Q3)  and Q2_D3;

end beha;

