
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity seven_seg is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           segs: out std_logic_vector(6 downto 0));
end seven_seg;

architecture Behavioral of seven_seg is
begin

        segs <= "0000001" when SW = "0000"  else --0
        "1001111" when SW = "0001"  else --1
        "0010010" when SW = "0010"  else --2
        "0000110" when SW = "0011"  else --3

        "1001100" when SW = "0100"  else --4
        "0100100" when SW = "0101"  else --5
        "0100000" when SW = "0110"  else --6
        "0001111" when SW = "0111"  else --7
        
        "0000000" when SW = "1000"  else --8
        "0000100" when SW = "1001"  else --9
        "0001000" when SW = "1010"  else --A
        "1100000" when SW = "1011"  else --b
        
        "0110001" when SW = "1100"  else --C
        "1000010" when SW = "1101"  else --D
        "0110000" when SW = "1110"  else --E
        "0111000" when SW = "1111"  else --F
        "0000000";
        
end Behavioral;
