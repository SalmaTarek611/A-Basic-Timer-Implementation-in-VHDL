----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2023 12:58:43 AM
-- Design Name: 
-- Module Name: Timer - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Timer is
Port (clk,up,down: in std_logic;
reset: in std_logic;
anode: std_logic_vector(3 downto 0);
led: std_logic_vector(6 downto 0));
end Timer;

architecture Behavioral of Timer is
signal count: std_logic_vector(15 downto 0);
signal clk_in: std_logic;
signal anode_ref: std_logic_vector(1 downto 0);
component Counter is  Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           count_out : out STD_LOGIC_VECTOR (15 downto 0);
           up : in STD_LOGIC;
           down : in STD_LOGIC);
end component;
component Decoder is Port ( count_in : in STD_LOGIC_VECTOR (15 downto 0);
           anode_ref : in STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0));
end component;
component clk_divider is  Port ( clk : in STD_LOGIC;
           clk_out : out STD_LOGIC;
           anode_ref : out STD_LOGIC_VECTOR (1 downto 0));
end component;
begin
clkDiv: clk_divider port map(clk,clk_in,anode_ref);
Counter1: Counter port map(reset,clk_in,count,up,down);
Dec1: Decoder port map(count,anode_ref,led,anode);

end Behavioral;
