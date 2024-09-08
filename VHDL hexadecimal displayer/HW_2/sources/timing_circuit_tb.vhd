----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2024 04:26:30 PM
-- Design Name: 
-- Module Name: mux4to1_tb - tb
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
library ieee;
use ieee.std_logic_1164.all;
-- No ports for this TB so entity is empty
entity timing_circuit_tb is
end timing_circuit_tb;
architecture tb of timing_circuit_tb is
-- In this TB modeling Style, the test bench instantiates the DUT as a component
-- and passes the inputs from a separate VHDL process via signals
component timing_circuit
Port (
clk_in : in STD_LOGIC; -- 100 MHz input clock
reset : in STD_LOGIC; -- Reset signal
mux_select : inout STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
);
end component;
--constant N : integer := 10;-- change it to 200000-- <need to select correct value>
--signal counter: integer := 0;
--signal new_clk : STD_LOGIC := '0';
signal clk_in : STD_LOGIC :='0'; -- 100 MHz input clock
signal reset : STD_LOGIC :='0'; -- Reset signal
signal mux_select : STD_LOGIC_VECTOR (1 downto 0):="00"; -- Signal for the mux
signal anodes : STD_LOGIC_VECTOR (3 downto 0):="1110"; -- Anodes signal for display
begin
-- connecting testbench signals with AND_gate.vhd
UUT : timing_circuit port map (clk_in,reset,mux_select,anodes);
clk_in<=not clk_in after 10 ns;

end tb ;