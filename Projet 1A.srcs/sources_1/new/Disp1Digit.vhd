----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2018 13:49:02
-- Design Name: 
-- Module Name: Disp1Digit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Disp1Digit is
    Port ( V : in STD_LOGIC_VECTOR (3 downto 0);
           N : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC_VECTOR (6 downto 0);
           ENAN : out STD_LOGIC_VECTOR (3 downto 0));
end Disp1Digit;

architecture Behavioral of Disp1Digit is
    type tt is array (0 to 3) of std_logic_vector(3 downto 0);
    constant table:tt:=( "1110",
                         "1101",
                         "1011",
                         "0111");
                        
    
begin
    S <= "1000000" when V="0000" else
         "1111001" when V="0001" else
         "0100100" when V="0010" else
         "0110000" when V="0011" else
         "0011001" when V="0100" else
         "0010010" when V="0101" else
         "0000010" when V="0110" else
         "1111000" when V="0111" else
         "0000000" when V="1000" else
         "0010000" when V="1001" else
         "0001000" when V="1010" else
         "0000011" when V="1011" else
         "1000110" when V="1100" else
         "0100001" when V="1101" else
         "0000110" when V="1110" else
         "0001110";

    ENAN <= table(to_integer(unsigned(N)));


end Behavioral;
