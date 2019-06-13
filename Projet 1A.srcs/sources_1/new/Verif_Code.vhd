----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.03.2019 11:56:21
-- Design Name: 
-- Module Name: Verif_Code - Behavioral
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

entity Verif_Code is
    Port ( clk : in STD_LOGIC;
           Code_entier : in STD_LOGIC_VECTOR (15 downto 0);
           EN_FIN : in STD_LOGIC :='0';
           Code_Bon : out STD_LOGIC:='0');
end Verif_Code;

architecture Behavioral of Verif_Code is

begin
Code_bon <= '1' when Code_entier="0001001000110100" and EN_FIN='1' else '0'; --1234
end Behavioral;
