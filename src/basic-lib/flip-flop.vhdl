library ieee ;
use ieee.std_logic_1164.all;

entity ff_D is
    port(	
            line_D : in std_logic;
            clk   : in std_logic;
            line_Q : out std_logic
    );
end ff_D;


architecture behv of ff_D is
begin

    process(line_D, clk)
    begin
	if (rising_edge(clk)) then
	    line_Q <= line_D;
	end if;

    end process;	

end behv;
