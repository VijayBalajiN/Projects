----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2024 03:20:43 PM
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture tb of decoder_tb is
component decoder is 
  Port ( p,q,r,s: in std_logic;
  C1,C2,C3,C4,C5,C6,C7: out std_logic
--  A1,A2,A3,A4: out std_logic
  );
end component;
signal p,q,r,s: std_logic;
signal C1,C2,C3,C4,C5,C6,C7: std_logic;
--signal A1,A2,A3,A4: std_logic;
begin
UUT : decoder port map (p => p,q => q,r => r, s=> s, C1 => C1,C2 => C2, C3 => C3, C4 => C4, C5 => C5, C6 => C6, C7 => C7);-- A1 => A1, A2 => A2, A3 => A3, A4 =>A4);

p <= '0', '0' after 20 ns, '0' after 40 ns, '0' after 60 ns, '0' after 80 ns, '0' after 100 ns, '0' after 120 ns, '0' after 140 ns, '1' after 160 ns, '1' after 180 ns, '1' after 200 ns, '1' after 220 ns, '1' after 240 ns, '1' after 260 ns, '1' after 280 ns, '1' after 300 ns; 
q <= '0', '0' after 20 ns, '0' after 40 ns, '0' after 60 ns, '1' after 80 ns, '1' after 100 ns, '1' after 120 ns, '1' after 140 ns, '0' after 160 ns, '0' after 180 ns, '0' after 200 ns, '0' after 220 ns, '1' after 240 ns, '1' after 260 ns, '1' after 280 ns, '1' after 300 ns; 
r <= '0', '0' after 20 ns, '1' after 40 ns, '1' after 60 ns, '0' after 80 ns, '0' after 100 ns, '1' after 120 ns, '1' after 140 ns, '0' after 160 ns, '0' after 180 ns, '1' after 200 ns, '1' after 220 ns, '0' after 240 ns, '0' after 260 ns, '1' after 280 ns, '1' after 300 ns; 
s <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns, '0' after 120 ns, '1' after 140 ns, '0' after 160 ns, '1' after 180 ns, '0' after 200 ns, '1' after 220 ns, '0' after 240 ns, '1' after 260 ns, '0' after 280 ns, '1' after 300 ns; 

end tb;
