----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2019 09:06:34
-- Design Name: 
-- Module Name: Lecture_Code_Disp - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Lecture_Code_Disp is
    Port ( E0 : in STD_LOGIC :='0';          
       E1 : in STD_LOGIC :='0';
       E2 : in STD_LOGIC :='0';
       E3 : in STD_LOGIC :='0';
       S0 : out STD_LOGIC :='0';
       S1 : out STD_LOGIC :='0';
       S2 : out STD_LOGIC :='0';
       S3 : out STD_LOGIC :='0';
       CLK : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (6 downto 0);
       ENAN : out STD_LOGIC_VECTOR (3 downto 0);
       S_EN : out STD_LOGIC;
       O0,O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15 : out STD_LOGIC :='0');
end Lecture_Code_Disp;

architecture Behavioral of Lecture_Code_Disp is
    signal Digit : STD_LOGIC_VECTOR(3 DOWNTO 0):=(OTHERS=>'0'); 
begin
    Lecture_Code : entity work.Lecture_Code
        port map (E0=>E0, E1=>E1, E2=>E2, E3=>E3, S0=>S0, S1=>S1, S2=>S2, S3=>S3, CLK=>Clk, S_EN=>S_EN, Digit=>Digit, O0=>O0, O1=>O1, O2=>O2, O3=>O3, O4=>O4, O5=>O5, O6=>O6, O7=>O7, O8=>O8, O9=>O9, O10=>O10, O11=>O11, O12=>O12, O13=>O13, O14=>O14, O15=>O15);
    Disp1Digit : entity work.Disp1Digit
        port map (V=>Digit, N=>"00", S=>S, ENAN=>ENAN);
end Behavioral;
