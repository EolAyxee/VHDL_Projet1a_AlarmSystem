----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 15:24:09
-- Design Name: 
-- Module Name: Timer_30s_tb - Behavioral
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

entity Timer_30s_tb is
--  Port ( );
end Timer_30s_tb;

architecture Behavioral of Timer_30s_tb is
component Timer_30s
port( clk : in STD_LOGIC;
      Timer_EN : in STD_LOGIC;
      TIMER_CLR : in STD_LOGIC;
      Timer_OUT : out STD_LOGIC);
end component;

    constant clk_period : time := 10 ns;
    signal clk, Timer_EN, Timer_CLR : STD_LOGIC;
    signal Timer_OUT : STD_LOGIC;
begin 
    UUT : Timer_30s port map (clk => clk, Timer_EN=>Timer_EN, Timer_CLR=>Timer_CLR, Timer_OUT=>Timer_OUT);
    clk_process :process
     begin
         clk <= '0';
         wait for clk_period/2;
         clk<= '1';
         wait for clk_period/2;
  end process;
  
  process
  begin
     Timer_EN<='0';
     Timer_CLR<='0';
     wait for 20ns;
     Timer_EN<='1';
     wait for 25ns;
     Timer_CLR<='1';
     wait for 10ns;
     Timer_CLR<='0';
     wait;
  end process;


end Behavioral;
