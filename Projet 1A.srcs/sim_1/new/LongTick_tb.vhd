----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.03.2019 10:36:13
-- Design Name: 
-- Module Name: LongTick_tb - Behavioral
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

entity LongTick_tb is
--  Port ( );
end LongTick_tb;

architecture Behavioral of LongTick_tb is
    component LongTick
        port( clk : in STD_LOGIC;
              Tick : out STD_LOGIC);
    end component;


   constant clk_period : time := 10 ns;
   signal clk, Tick : STD_LOGIC;
begin
   UUT : LongTick port map(clk=>clk, Tick=>Tick);
   clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk<= '1';
            wait for clk_period/2;
     end process;
     process
     begin
        wait for 10ms;
        wait;
     end process;
end Behavioral;
