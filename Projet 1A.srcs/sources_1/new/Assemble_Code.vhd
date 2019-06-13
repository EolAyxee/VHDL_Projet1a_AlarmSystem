----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 09:41:57
-- Design Name: 
-- Module Name: Assemble_code - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Assemble_code is
    Port ( clk : in STD_LOGIC;
           Digit : in STD_LOGIC_VECTOR (3 downto 0);
           S_EN: in STD_LOGIC;
           EN_FIN : out STD_LOGIC := '0';
           --C : out integer := 0;
           --I : out integer := 0;
           Code_entier : out STD_LOGIC_VECTOR (15 downto 0):=(OTHERS => '0'));
           
end Assemble_code;

architecture Behavioral of Assemble_code is
signal Q : STD_LOGIC_VECTOR(1 downto 0)  :=(OTHERS=>'0');
signal Code_ent : STD_LOGIC_VECTOR(15 DOWNTO 0):=(OTHERS=>'0');
signal waitC : integer :=0;
signal waitTime : integer :=30000000;--300ms = 30000000
signal inactivC : integer :=0;
signal inactivTime : integer :=2000000000;--1s = 100000000


begin
process(clk)begin
    if rising_edge(clk) then
        if waitC=0 and S_EN='1' then
            waitC<=1;    
        elsif waitC=waitTime then
            waitC<=0;
        elsif not(waitC=0) then
            waitC<=waitC+1;
        end if;

        if waitC=0 and inactivC<inactivTime then 
            inactivC<=inactivC+1;  
        elsif inactivC=inactivTime then
            inactivC<=0;
            Code_ent<="0000000000000000";
            Q<="00";
        else 
            inactivC<=0;
        end if;


       if waitC=0 and S_EN='1' and Q="00" then
            Code_ent(15 downto 12)<= Digit;
            Q<="01";
       end if;      
       
       if waitC=0 and S_EN='1' and Q="01" then
          Code_ent(11 downto 8)<= Digit;
          Q<="10";
       end if;
              
       if waitC=0 and S_EN='1' and Q="10" then
           Code_ent(7 downto 4)<= Digit;
           Q<="11";
       end if; 
             
       if waitC=0 and S_EN='1' and Q="11" then
          Code_ent(3 downto 0)<= Digit;
          Q<="00";
          EN_FIN <= '1';
       else
          EN_FIN <= '0';
       end if;  
   end if;
end process;
    
  --codage de la sortie
--I<=inactivC;
--C<=waitC;
Code_entier <= Code_ent;
end Behavioral;
