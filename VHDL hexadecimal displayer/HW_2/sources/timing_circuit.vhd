----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 02:16:22 PM
-- Design Name: 
-- Module Name: timing_circuit - Behavioral
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
entity Timing_circuit is
Port (
clk_in : in STD_LOGIC; -- 100 MHz input clock
reset : in STD_LOGIC; -- Reset signal
mux_select : inout STD_LOGIC_VECTOR (1 downto 0):="00"; -- Signal for the mux
anodes : out STD_LOGIC_VECTOR (3 downto 0) :="0000" -- Anodes signal for display
);
end Timing_circuit;
architecture Behavioral of Timing_circuit is
constant N : integer := 200000;-- <need to select correct value>
signal counter: integer := 0;
signal new_clk : STD_LOGIC := '1';
begin
--Process 1 for dividing the clock from 100 Mhz to 1Khz - 60hz
new_clock: process(clk_in, reset, counter)
variable cnt :integer:=0;
begin
    if reset = '1' then
    counter <=0;
    new_clk<='0';
    
    elsif rising_edge(clk_in) then
    counter<=counter+1;
    
    if counter=N-1 then
    counter<=0;
    new_clk<=not new_clk;
    end if;
    end if;
    
end process;
--Process 2 for mux select signal
MUX_selector: process(new_clk)
begin
    if rising_edge(new_clk) then
    case mux_select is
    when "00" =>
    mux_select <= "01";
    when "01" =>
    mux_select <= "10";
    when "10" =>
    mux_select <= "11";
    when others =>
    mux_select <= "00";
    end case;
--            mux_select <= mux_select1;
    end if;
end process;
--Process 3 for anode signal
ANODE_select: process(mux_select)
begin
case mux_select is
     when "00" =>
     anodes <= "1110";
     when "01" =>
     anodes <= "1101";
     when "10" =>
     anodes <= "1011";
     when others =>
     anodes <= "0111";
end case;
end process;
end Behavioral;