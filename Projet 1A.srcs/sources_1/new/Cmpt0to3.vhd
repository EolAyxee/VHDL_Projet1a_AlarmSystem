----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2018 14:18:37
-- Design Name: 
-- Module Name: Cmpt0to3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: <
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

entity Cmpt0to3 is
    Port ( Clk : in STD_LOGIC;
           EN : in STD_LOGIC;
           N : out unsigned(1 downto 0));
end Cmpt0to3;

architecture Behavioral of Cmpt0to3 is
 signal M: unsigned(1 downto 0) :=(OTHERS =>'0');
begin
  process(clk) begin
    if rising_edge(clk) then
        
        if(EN = '1') then
            M<=M+1;
        else
            M<=M;
        end if;
    end if;
 end process;
 N<=M;

end Behavioral;
