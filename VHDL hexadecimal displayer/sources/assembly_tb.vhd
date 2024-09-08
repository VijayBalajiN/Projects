----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 05:25:58 PM
-- Design Name: 
-- Module Name: assembly_tb - tb
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

entity assembly_tb is
--  Port ( );
end assembly_tb;

architecture tb of assembly_tb is
    component assembly
    Port ( 
    C1 : in STD_LOGIC_VECTOR (3 downto 0);
    C2 : in STD_LOGIC_VECTOR (3 downto 0);
    C3 : in STD_LOGIC_VECTOR (3 downto 0);
    C4 : in STD_LOGIC_VECTOR (3 downto 0);
    A  : out std_logic_vector (3 downto 0);
    C  : out std_logic_vector (6 downto 0);
    reset : in std_logic;
    clk_in : in STD_LOGIC -- 100 MHz input clock
    );
    end component;
--constant N : integer := 10;-- change it to 200000-- <need to select correct value>
--signal counter: integer := 0;
--signal new_clk : STD_LOGIC := '0';
    signal C1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    signal C2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    signal C3 : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    signal C4 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    signal A  : std_logic_vector (3 downto 0) := "0010";
    signal C  : std_logic_vector (6 downto 0) := "0000000";
    signal reset :std_logic;
    signal clk_in : std_logic := '0';
begin
-- connecting testbench signals with AND_gate.vhd
UUT : assembly port map (C1, C2, C3, C4, A, C, reset, clk_in);
clk_in<=not clk_in after 10 ns;
reset <='0';
end tb ;
