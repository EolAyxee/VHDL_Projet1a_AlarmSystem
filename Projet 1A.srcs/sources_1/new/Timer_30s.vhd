----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 15:17:17
-- Design Name: 
-- Module Name: Timer_30s - Behavioral
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

entity Timer_30s is
    generic (Ndiv : integer := 1000000000); --30s
    Port ( clk : in STD_LOGIC;
           Timer_EN : in STD_LOGIC;
           Timer_CLR : in STD_LOGIC;
           Timer_OUT : out STD_LOGIC);
end Timer_30s;

architecture Behavioral of Timer_30s is
 signal Q : integer range 0 to Ndiv := 0;
begin
 process(clk) begin
    if rising_edge(clk) then
        if Timer_CLR='1' then
            Q<=0;
        else
            if Timer_EN='1' then
                if (Q = Ndiv-1) then
                    Q<=0;
                else
                    Q <= Q+1;
                end if;
            else
                Q<=Q;
            end if;
        end if;
    end if;
 end process;
 Timer_OUT <= '1' when Q = Ndiv-1 else '0';
end Behavioral;
