----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/30/2024 02:32:40 PM
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is 
  Port ( p,q,r,s: in std_logic;
  C1,C2,C3,C4,C5,C6,C7: out std_logic
--  A1,A2,A3,A4: out std_logic
  );
end decoder;

architecture Behavioral of decoder is

begin
C1 <= ((not p) and (not q) and (not r) and s) or ((not p) and q and (not r) and (not s)) or (p and q and (not r) and s) or (p and (not q) and r and s);
C2 <= ((not p) and q and (not r) and s) or (q and r and (not s)) or (p and q and (not s)) or (p and r and s);
C3 <= ((not p) and (not q) and r and (not s)) or (p and q and r) or (p and q and (not s));
C4 <= (q and r and s) or ((not p) and (not q) and (not r) and s) or ((not p) and q and (not r) and not s) or (p and (not q) and r and (not s));
C5 <= ((not p) and s) or ((not p) and q and (not r)) or ((not q) and (not r) and s);
C6 <= ((not p) and (not q) and s) or ((not p) and (not q) and r) or ((not p) and r and s) or (p and q and (not r) and s);
C7 <= ((not p) and (not q) and (not r)) or ((not p) and q and r and s) or (p and q and (not r) and (not s));
--A1 <= '0';
--A2 <= '1';
--A3 <= '1';
--A4 <= '1';

end Behavioral;
