----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2019 10:28:20
-- Design Name: 
-- Module Name: gestionAlarme - Behavioral
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

entity gestionAlarme is
    Port ( CLK : in STD_LOGIC;
           Cap_IR : in STD_LOGIC;
           Cap_Porte : in STD_LOGIC;
           Code_Bon : in STD_LOGIC;
           B_ON : in STD_LOGIC;
           B_ON2 : in STD_LOGIC;
           Timer_OUT : in STD_LOGIC;
           Timer_EN : out STD_LOGIC;
           Timer_CLR : out STD_LOGIC;
           Alarme_EN : out STD_LOGIC);
           
end gestionAlarme;

architecture Behavioral of gestionAlarme is
        type liste_etat is (ATTENTE,ALARME,IDENTIFICATION,ETEINT);
        signal ETAT_PR,ETAT_FU : liste_etat :=ETEINT;
        
begin
-- bloc de synchronisation de l'état présent
    process(CLK)begin
        if rising_edge(CLK) then
            ETAT_PR <= ETAT_FU;
        end if;
    end process;
    
-- COMBINATOIRES : calcul de l'état futur
    process (ETAT_PR,Cap_IR,Cap_Porte,Code_Bon,B_ON,B_ON2,Timer_OUT)begin
        case ETAT_PR is
            when ETEINT =>
                if B_ON='1' or B_ON2='1' then
                    ETAT_FU <= ATTENTE;
                else 
                    ETAT_FU <= ETEINT;
                end if;
            when ATTENTE =>
                if B_ON='0' or B_ON2='0' then
                    ETAT_FU <= ETEINT;
                else
                    if Cap_IR='1' then
                        if Cap_Porte='0' then
                            ETAT_FU <= ALARME;
                        else
                            ETAT_FU <= IDENTIFICATION;
                        end if;
                    else
                        ETAT_FU <= ATTENTE;
                    end if;
                end if;
            when ALARME =>
                if B_ON='0' or B_ON2='0' then
                    ETAT_FU <= ETEINT;
                else
                    if Code_Bon='1' then
                        ETAT_FU <= ETEINT;
                    else
                        ETAT_FU <= ALARME;
                    end if;
                end if;
            when IDENTIFICATION =>
                if B_ON='0' or B_ON2='0' then
                    ETAT_FU <= ETEINT;
                else
                    if Timer_OUT='1' then
                        ETAT_FU <= ALARME;
                    else
                        if Code_Bon='1' then
                            ETAT_FU <= ETEINT;
                        else
                            ETAT_FU <= IDENTIFICATION;
                        end if;
                    end if;
                end if;
         end case;
    end process;
 -- le codage des sorties 
    Timer_EN <= '1' when ETAT_PR=IDENTIFICATION else '0';
    Timer_CLR <= '1' when ETAT_PR=ATTENTE else '0';
    Alarme_EN <= '1' when ETAT_PR=ALARME else '0';

end Behavioral;
