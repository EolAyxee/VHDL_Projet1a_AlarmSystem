----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.03.2019 16:33:10
-- Design Name: 
-- Module Name: Lecture_code_tb - Behavioral
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

entity Lecture_code_tb is
--  Port ( );
end Lecture_code_tb;

architecture Behavioral of Lecture_code_tb is
component Lecture_code
    Port(CLK : in STD_LOGIC;
         Code_EN : in STD_LOGIC;
         E0 : in STD_LOGIC;
         E1 : in STD_LOGIC;
         E2 : in STD_LOGIC;
         E3 : in STD_LOGIC;
         S0 : out STD_LOGIC;
         S1 : out STD_LOGIC;
         S2 : out STD_LOGIC;
         S3 : out STD_LOGIC;
         S : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    
    constant CLK_period : time := 10ns;
    signal clk, E0, E1, E2, E3, Code_EN : STD_LOGIC;
    signal S0, S1, S2, S3 : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR(3 downto 0);
begin
    UUT: Lecture_code port map(clk=>clk, Code_EN=>Code_EN, E0=>E0, E1=>E1,E2=>E2,E3=>E3,S0=>S0,S1=>S1,S2=>S2,S3=>S3, S=>S);
    clk_process :process
       begin
           clk <= '0';
           wait for clk_period/2;
           clk<= '1';
           wait for clk_period/2;
    end process;
    process
    begin
        Code_EN<='0';
        E0<='0';
        E1<='0';
        E2<='0';
        E3<='0';
        wait for 50ns;
        Code_EN<='1';
        E0<='1';
        wait for 20ns;
        E0<='0';
        E2<='1';
        wait for 20ns;
        E2<='0';
        E3<='1';
        wait for 500ns;
        Code_EN<='0';
        wait; 
    end process;
end Behavioral;
