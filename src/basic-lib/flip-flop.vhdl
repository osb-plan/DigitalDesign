library ieee ;
use ieee.std_logic_1164.all;

entity ff_D is
    port(	
            lineD : in std_logic;
            clk   : in std_logic;
            lineQ : out std_logic
    );
end ff_D;


architecture behv of ff_D is
begin

    process(lineD, clk)
    begin
	if (rising_edge(clk)) then
	    lineQ <= lineD;
	end if;

    end process;	

end behv;
