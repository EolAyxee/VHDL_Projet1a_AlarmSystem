----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.03.2019 11:52:49
-- Design Name: 
-- Module Name: Assemble_Code_tb - Behavioral
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

entity Assemble_Code_tb is
--  Port ( );
end Assemble_Code_tb;

architecture Behavioral of Assemble_Code_tb is
        component Assemble_code
        Port ( clk : in STD_LOGIC;
               Digit : in STD_LOGIC_VECTOR (3 downto 0);
               S_EN: in STD_LOGIC;
               EN_FIN : out STD_LOGIC := '0';
               --C : out integer := 0;
               --I : out integer := 0;
               Code_entier : out STD_LOGIC_VECTOR (15 downto 0));
        end component;       
        
        constant CLK_period : time := 10ns;
        signal clk, S_EN: STD_LOGIC;
        signal Digit : STD_LOGIC_VECTOR(3 downto 0);
        signal EN_FIN : STD_LOGIC;
        --signal C, I : integer;
        signal Code_entier : STD_LOGIC_VECTOR(15 downto 0);
begin
    UUT: Assemble_Code port map (clk=>clk,Digit=>Digit,S_EN=>S_EN,EN_FIN=>EN_FIN,Code_entier=>Code_entier);--C=>C,I=>I,
        clk_process :process
        begin 
            clk <= '0';
            wait for clk_period/2;
            clk<= '1';
            wait for clk_period/2;
    end process;
    process 
    begin
    S_EN<='1';
    Digit<= "0001";
    wait for 10ns;
    S_EN<='0';
    wait for 1ms;
    S_EN<='1';
    Digit<= "0010";
    wait for 10ns;
    S_EN<='0';
    wait for 1ms;
    S_EN<='1';
    Digit<= "0011";
    wait for 10ns;
    S_EN<='0';
    wait for 1ms;
    S_EN<='1';
    Digit<= "0100";
    wait for 10ns;
    S_EN<='0';
    wait;   
    
    end process;
end Behavioral;
