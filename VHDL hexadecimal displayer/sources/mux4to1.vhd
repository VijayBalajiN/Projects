----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2024 04:06:27 PM
-- Design Name: 
-- Module Name: mux4to1 - Behavioral
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

entity mux4to1 is
    Port ( A1 : in STD_LOGIC_VECTOR (3 downto 0);
           B1 : in STD_LOGIC_VECTOR (3 downto 0);
           C1 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           S  : in std_logic_vector (1 downto 0);
--           S1 : in STD_LOGIC;
--           S2 : in STD_LOGIC;
--           S3 : in STD_LOGIC;
           O : out std_logic_vector (3 downto 0));
end mux4to1;

architecture Behavioral of mux4to1 is
begin
sample :process(S)
begin
if S = "00" then
    O <= A1;
elsif S = "01" then
    O <=B1;
elsif S="10" then
    O<=C1;
elsif S="11" then
    O<=D1;
end if;
end process;

end Behavioral;
