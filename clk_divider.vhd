----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 01:02:35 AM
-- Design Name: 
-- Module Name: clk_divider - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clk_divider is
    Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC;
           anode_ref : out STD_LOGIC_VECTOR (1 downto 0));
end clk_divider;

architecture Behavioral of clk_divider is
signal count:std_logic_vector(31 downto 0):=(others=>'0');
signal tmp : std_logic := '0';
  
begin
  
process(clk)
begin
if(clk'event and clk='1') then
count <=count+1;
if (count = 50000000) then
tmp <= NOT tmp;
count <= "00000000000000000000000000000001";
end if;
end if;
end process;
clk_out <= tmp;
anode_ref<= count(20 downto 19);
end Behavioral;
