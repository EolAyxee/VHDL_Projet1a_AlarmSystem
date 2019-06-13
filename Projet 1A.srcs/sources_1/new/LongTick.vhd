----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2019 10:22:05
-- Design Name: 
-- Module Name: LongTick - Behavioral
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

entity LongTick is
    generic (
    Ndiv : integer :=10000000;--100ms
    lenTick : integer := 40010);--400us
    Port ( clk : in STD_LOGIC;
           Tick : out STD_LOGIC);
end LongTick;

architecture Behavioral of LongTick is
    signal Q : integer range 0 to Ndiv := 0;
begin
         process(clk) begin
            if rising_edge(clk) then
                if (Q = Ndiv-1) then
                    Q<=0;
                else
                    Q <= Q+1;
                end if;
            end if;
        end process;
  Tick <= '1' when (Q <= Ndiv-1 and Q >= Ndiv-lenTick) else '0';
end Behavioral;
