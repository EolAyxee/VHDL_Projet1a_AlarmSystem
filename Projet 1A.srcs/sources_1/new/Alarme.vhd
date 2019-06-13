----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.05.2019 11:19:43
-- Design Name: 
-- Module Name: Alarme - Behavioral
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

entity Alarme is
    Port ( clk : in STD_LOGIC;
       E0 : in STD_LOGIC:='0';
       E1 : in STD_LOGIC:='0';
       E2 : in STD_LOGIC:='0';
       E3 : in STD_LOGIC:='0';
       S0 : out STD_LOGIC:='0';
       S1 : out STD_LOGIC:='0';
       S2 : out STD_LOGIC:='0';
       S3 : out STD_LOGIC:='0';
       S : out STD_LOGIC_VECTOR (6 downto 0);--pour l'affichage
       Digit_STM : out STD_LOGIC_VECTOR(3 downto 0);
       S_EN_STM : out STD_LOGIC:='0';
       ENAN : out STD_LOGIC_VECTOR (3 downto 0);
       O0,O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15 : out STD_LOGIC :='0';
       Cap_IR : in STD_LOGIC;
       Code_Bon : out STD_LOGIC;
       Cap_Porte : in STD_LOGIC;
       B_ON : in STD_LOGIC;
       B_ON2 : in STD_LOGIC;
       Alarme_EN : out STD_LOGIC);
end Alarme;

architecture Behavioral of Alarme is
    signal Code_Bon_s : STD_LOGIC:='0';
    signal Code_Bon_s2 : STD_LOGIC:='0';
    signal Timer_OUT : STD_LOGIC:='0';
    signal Timer_EN : STD_LOGIC:='0';
    signal Timer_CLR : STD_LOGIC:='0';
begin

    Digicode : entity work.Digicode
        port map (clk=>clk,E0=>E0,E1=>E1,E2=>E2,E3=>E3,S0=>S0,S1=>S1,S2=>S2,S3=>S3,Code_Bon=>Code_Bon_s,S=>S,ENAN=>ENAN,S_EN_STM=>S_EN_STM,Digit_STM=>Digit_STM,O0=>O0,O1=>O1,O2=>O2,O3=>O3,O4=>O4,O5=>O5,O6=>O6,O7=>O7,O8=>O8,O9=>O9,O10=>O10,O11=>O11,O12=>O12,O13=>O13,O14=>O14,O15=>O15);
    GestionAlarme : entity work.GestionAlarme
        port map (clk=>clk,Cap_IR=>Cap_IR,Cap_Porte=>Cap_Porte,Code_Bon=>Code_Bon_s,B_ON=>B_ON,B_ON2=>B_ON2,Timer_OUT=>Timer_OUT,Timer_EN=>Timer_EN,Timer_CLR=>Timer_CLR,Alarme_EN=>Alarme_EN);
    Timer_30s : entity work.Timer_30s
        port map (clk=>clk,Timer_EN=>Timer_EN,Timer_CLR=>Timer_CLR,Timer_OUT=>Timer_OUT);
    Code_Bon_s2 <= not(Code_Bon_s2) when Code_Bon_s = '1';
    Code_Bon <= Code_Bon_s2;
end Behavioral;
