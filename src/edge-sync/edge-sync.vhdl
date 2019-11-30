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
                line_D : in std_logic;
                clk   : in std_logic;
                line_Q : out std_logic
        );
    end component ff_D;    

   signal input_s : std_logic := '0';
   signal meta  : std_logic:= '0';
   signal Q2_D3 : std_logic:= '0';
   signal Q3    : std_logic:= '0';

begin

   FFsrc  : ff_D port map (
                  line_D => input_s,
                  clk => clk_src,
                  line_Q => meta
              ); 

   FFdst1 : ff_D port map(
                  line_D => meta,
                  clk   => clk_dst  ,
                  line_Q => Q2_D3
              );
   
   FFdst2 : ff_D port map(
                  line_D => Q2_D3,
                  clk   => clk_dst  ,
                  line_Q => Q3
              );

input_s <= data;
   
   line_out <=   (not Q3)  and Q2_D3;

end beha;

