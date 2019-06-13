----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 13:43:54
-- Design Name: 
-- Module Name: gestionAlarme_tb - Behavioral
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

entity gestionAlarme_tb is
--  Port ( );
end gestionAlarme_tb;

architecture Behavioral of gestionAlarme_tb is
    component gestionAlarme
    Port(CLK : in STD_LOGIC;
         Cap_IR : in STD_LOGIC;
         Cap_Porte : in STD_LOGIC;
         Code_Bon : in STD_LOGIC;
         B_ON : in STD_LOGIC;
         Timer_OUT : in STD_LOGIC;
         Timer_EN : out STD_LOGIC;
         Timer_CLR : out STD_LOGIC;
         Alarme_EN : out STD_LOGIC);
    end component;
    
    constant CLK_period : time := 10ns;
    signal clk, Cap_IR, Cap_Porte, Code_bon, B_ON, Timer_OUT: STD_LOGIC;
    signal Timer_EN, Timer_CLR, Alarme_EN: STD_LOGIC;
    
begin
    UUT: gestionAlarme port map(clk=>clk, Cap_IR=>Cap_IR, Cap_Porte=>Cap_Porte, Code_Bon=>Code_Bon, B_ON=>B_ON, Timer_OUT=>Timer_OUT, Timer_EN=>Timer_EN, Timer_CLR=>Timer_CLR, Alarme_EN=>Alarme_EN);
    clk_process :process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk<= '1';
            wait for clk_period/2;
    end process;
    process
    begin
        Timer_OUT<='0';
        Cap_IR<='0';
        Cap_Porte<='0';
        Code_Bon<='0';
        B_ON<='0';
        wait for 10ns;
        B_ON<='1';
        wait for 10ns;
        B_ON<='0';
        wait for 50ns;
        Cap_IR<='1';
        wait for 50ns;
        Cap_IR<='0';
        Code_Bon<='1';
        wait for 50ns;
        B_ON<='1';
        Code_Bon<='0';
        wait for 10ns;
        B_ON<='0';
        wait for 50ns;
        Cap_Porte<='1';
        Cap_IR<='1';
        wait for 50ns;
        Timer_OUT<='1';
        Cap_IR<='0';
        Cap_Porte<='0';
        wait for 50ns;
        Code_Bon<='1';
        wait for 50ns;
        B_ON<='1';
        Code_Bon<='0';
        Timer_OUT<='0';
        wait for 50ns;
        Cap_IR<='1';
        Cap_Porte<='1';
        wait for 50 ns;
        B_ON<='0';
        Cap_IR<='0';
        Cap_Porte<='0';
        Code_Bon<='1';
        wait;
    end process;
end Behavioral;
