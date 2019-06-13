----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2018 15:36:47
-- Design Name: 
-- Module Name: Disp4D - Behavioral
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

entity Disp4D is
    Port ( Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (6 downto 0);
           ENAN : out STD_LOGIC_VECTOR (3 downto 0);
           A,B,C,D : in STD_LOGIC_VECTOR(3 downto 0));
end Disp4D;

architecture Behavioral of Disp4D is
    signal N : unsigned(1 downto 0);
    signal T : STD_LOGIC;
begin
 Timer : entity work.Tick_1ms
    port map (clk=>Clk, Tick=>T);
    
 Compteur : entity work.Cmpt0to3
    port map (Clk=>Clk, EN=>T, N=>N);
    
 Display : entity work.Disp1of4Digits
    port map (A=>A, B=>B, C=>C, D=>D, N=>STD_LOGIC_VECTOR(N), S=>S, ENAN=>ENAN);


end Behavioral;
