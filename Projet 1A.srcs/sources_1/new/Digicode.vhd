----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 10:48:09
-- Design Name: 
-- Module Name: Digicode - Behavioral
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

entity Digicode is
    Port ( clk : in STD_LOGIC;
           E0 : in STD_LOGIC:='0';
           E1 : in STD_LOGIC:='0';
           E2 : in STD_LOGIC:='0';
           E3 : in STD_LOGIC:='0';
           S0 : out STD_LOGIC:='0';
           S1 : out STD_LOGIC:='0';
           S2 : out STD_LOGIC:='0';
           S3 : out STD_LOGIC:='0';
           Code_Bon : out STD_LOGIC:='0';
           S : out STD_LOGIC_VECTOR (6 downto 0);--pour l'affichage
           Digit_STM : out STD_LOGIC_VECTOR(3 downto 0);
           S_EN_STM : out STD_LOGIC:='0';
           ENAN : out STD_LOGIC_VECTOR (3 downto 0);
           
           O0,O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15 : out STD_LOGIC :='0');
end Digicode;

architecture Behavioral of Digicode is
    signal S_EN : STD_LOGIC := '0';
    signal Digit : STD_LOGIC_VECTOR(3 DOWNTO 0);
    signal Code_entier : STD_LOGIC_VECTOR(15 DOWNTO 0);
    signal EN_FIN : STD_LOGIC :='0';

    
begin
    -- Limite la fréquence de permutation entre les sorties S0,1,2,3
    Lecture_Code : entity work.Lecture_Code
        port map (E0=>E0, E1=>E1, E2=>E2, E3=>E3, S0=>S0, S1=>S1, S2=>S2, S3=>S3, CLK=>Clk, S_EN=>S_EN, Digit=>Digit, O0=>O0, O1=>O1, O2=>O2, O3=>O3, O4=>O4, O5=>O5, O6=>O6, O7=>O7, O8=>O8, O9=>O9, O10=>O10, O11=>O11, O12=>O12, O13=>O13, O14=>O14, O15=>O15);
    Assemble_Code : entity work.Assemble_Code
        port map (clk=>clk, S_EN=>S_EN, Digit=>Digit, Code_entier=>Code_entier, EN_FIN=>EN_FIN );
    Verif_Code : entity work.Verif_Code
        port map (clk=>clk, Code_entier=>Code_entier, Code_Bon=>Code_Bon, EN_FIN=>EN_FIN);
    Disp4D : entity work.Disp4D
        Port map (clk=>clk,D=>Code_entier(15 downto 12),C=>Code_entier(11 downto 8),B=>Code_entier(7 downto 4),A=>Code_entier(3 downto 0),ENAN=>ENAN, S=>S);
    S_EN_STM<=S_EN;
    Digit_STM<=Digit;
end Behavioral;
