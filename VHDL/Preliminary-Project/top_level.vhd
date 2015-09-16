----------------------------------------------------------------------------------
-- Company: WPI - Deparment of ECE
-- Engineer: Manik Jahagirdar
-- 
-- Create Date: 08/30/2015 06:00:26 PM
-- Design Name: Preliminary Project
-- Module Name: top_level - Behavioral
-- Project Name: Preliminary Project 
-- Target Devices: NEXYS 4 ddr : Artix-7 fpga board
-- Tool Versions:  VIVADO 2015.1
-- Description: 
--                Interfacing 4 sliding switches and displaying it's Hexadecimal equivalent value on 7 Segment diaplay
--                Also, switching ON an appropriate LED out of 16 LEDs available. 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);   -- to ON/OFF of the displays
           CA,CB,CC,CD,CE,CF,CG: out std_logic);     -- for Hardware connectionsS
end top_level;

architecture Behavioral of top_level is
signal seg_out: std_logic_vector(6 downto 0);

begin
    seven_seg1: entity work.seven_seg port map (SW,seg_out);
    LED <= "0000000000000001" when SW = "0000" else
       "0000000000000010" when SW = "0001" else
       "0000000000000100" when SW = "0010" else
       "0000000000001000" when SW = "0011" else

       "0000000000010000" when SW = "0100" else
       "0000000000100000" when SW = "0101" else
       "0000000001000000" when SW = "0110" else
       "0000000010000000" when SW = "0111" else

       "0000000100000000" when SW = "1000" else
       "0000001000000000" when SW = "1001" else
       "0000010000000000" when SW = "1010" else
       "0000100000000000" when SW = "1011" else

       "0001000000000000" when SW = "1100" else
       "0010000000000000" when SW = "1101" else
       "0100000000000000" when SW = "1110" else
       "1000000000000000";
       
       -- for driving the hardware
       CA<=seg_out(6); CB<=seg_out(5); CC<=seg_out(4); CD<=seg_out(3); 
       CE<=seg_out(2); CF<=seg_out(1); CG<=seg_out(0);
       
       AN <= "11111110";   


end Behavioral;
