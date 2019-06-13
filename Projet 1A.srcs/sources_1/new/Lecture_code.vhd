----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 15:59:17
-- Design Name: 
-- Module Name: Lecture_code - Behavioral
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

entity Lecture_code is
    Port ( E0 : in STD_LOGIC :='0';          
           E1 : in STD_LOGIC :='0';
           E2 : in STD_LOGIC :='0';
           E3 : in STD_LOGIC :='0';
           S0 : out STD_LOGIC :='0';
           S1 : out STD_LOGIC :='0';
           S2 : out STD_LOGIC :='0';
           S3 : out STD_LOGIC :='0';
           CLK : in STD_LOGIC;
           S_EN : out STD_LOGIC;
           Digit : out STD_LOGIC_VECTOR (3 downto 0);
           --Digit_Pressed : out STD_LOGIC;
           O0,O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,O11,O12,O13,O14,O15 : out STD_LOGIC :='0');
end Lecture_code;

architecture Behavioral of Lecture_code is
     type liste_etat is (B0,B1,B2,B3);
     signal ETAT_PR,ETAT_FU : liste_etat :=B0;
     signal L0,L1,L2,L3 : STD_LOGIC;
     signal EN : STD_LOGIC;
begin
    Tick_100us : entity work.Tick_1ms
        generic map (Ndiv=>12500)
        Port map (clk=>clk, Tick=>EN);
    
     process(CLK)begin
       if rising_edge(CLK) then
           ETAT_PR <= ETAT_FU;
       end if;
    end process;

    process(clk, EN)
    begin
        
        case ETAT_PR is
            when B0 =>
                if EN='1' then
                    ETAT_FU <= B1;
                 else
                    ETAT_FU <= B0;
                 end if;
            when B1 =>
                if EN='1' then
                    ETAT_FU <= B2;
                else
                    ETAT_FU <= B1;
                end if;
            when B2 =>
                if EN='1' then
                    ETAT_FU <= B3;
                else
                    ETAT_FU <= B2;
                end if;
            when B3 =>
                if EN='1' then
                    ETAT_FU <= B0;
                else
                    ETAT_FU <= B3;
                end if;
        end case;
    end process;
-- le codage des sorties 
    L0 <= '1' when ETAT_PR=B0 else '0';
    L1 <= '1' when ETAT_PR=B1 else '0';
    L2 <= '1' when ETAT_PR=B2 else '0';
    L3 <= '1' when ETAT_PR=B3 else '0';
    
    S_EN <= '1' when (E0='1' or E1='1' or E2='1' or E3='1') else '0';
    
    Digit <= "0000" when L2='1' and E3='1' else--0
         "0001" when L3='1' and E0='1' else--1
         "0010" when L2='1' and E0='1' else--2
         "0011" when L1='1' and E0='1' else--3
         "0100" when L3='1' and E1='1' else--4
         "0101" when L2='1' and E1='1' else--5
         "0110" when L1='1' and E1='1' else--6
         "0111" when L3='1' and E2='1' else--7
         "1000" when L2='1' and E2='1' else--8
         "1001" when L1='1' and E2='1' else--9
         "1010" when L3='1' and E3='1' else--A
         "1011" when L1='1' and E3='1' else--B
         "1100" when L0='1' and E3='1' else--C
         "1101" when L0='1' and E2='1' else--D
         "1110" when L0='1' and E1='1' else--E
         "1111";                           --F
         
     O0 <='1' when L2='1' and E3='1' else '0';
     O1 <='1' when L3='1' and E0='1' else '0';--1
     O2 <='1' when L2='1' and E0='1' else '0';--2
     O3 <='1' when L1='1' and E0='1' else '0';--3
     O4 <='1' when L3='1' and E1='1' else '0';--4
     O5 <='1' when L2='1' and E1='1' else '0';--5
     O6 <='1' when L1='1' and E1='1' else '0';--6
     O7 <='1' when L3='1' and E2='1' else '0';--7
     O8 <='1' when L2='1' and E2='1' else '0';--8
     O9 <='1' when L1='1' and E2='1' else '0';--9
     O10 <='1' when L3='1' and E3='1' else '0';--A
     O11 <='1' when L1='1' and E3='1' else '0';--B
     O12 <='1' when L0='1' and E3='1' else '0';--C
     O13 <='1' when L0='1' and E2='1' else '0';--D
     O14 <='1' when L0='1' and E1='1' else '0';--E
     O15 <='1' when L0='1' and E0='1' else '0';--F
         
    S0 <= L0;
    S1 <= L1;
    S2 <= L2;
    S3 <= L3;
    
   -- Digit_Pressed <= '1' when (E0='1' or E1='1' or E2='1' or E3='1') else '0';

end Behavioral;
