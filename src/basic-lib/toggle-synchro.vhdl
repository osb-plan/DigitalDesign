library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity T_FF is
    port( 
        T    : in std_logic;
        clk  : in std_logic;
        Q    : out std_logic
    );
end T_FF;
 
architecture Behavioral of T_FF is
    signal tmp: std_logic := '0';
begin
    process (clk)
    begin
--        tmp <= '0';
        if(rising_edge(clk)) then
            if T='0' then
                tmp <= tmp;
            elsif T='1' then
                tmp <= not (tmp);
            end if;
        end if;
    end process;
    
Q <= tmp;

end Behavioral;

--Q  T Q(T+1)
--0  0    0
--0  1    1
--1  0    1
--1  1    0
