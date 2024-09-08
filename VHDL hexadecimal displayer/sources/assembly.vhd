----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 04:23:58 PM
-- Design Name: 
-- Module Name: assembly - Behavioral
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

entity assembly is
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
end assembly;

architecture Behavioral of assembly is
component decoder 
Port ( p,q,r,s: in std_logic;
  C1,C2,C3,C4,C5,C6,C7: out std_logic
--  A1,A2,A3,A4: out std_logic
  );
end component;
component mux4to1
    Port ( A1 : in STD_LOGIC_VECTOR (3 downto 0);
           B1 : in STD_LOGIC_VECTOR (3 downto 0);
           C1 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           S  : in std_logic_vector (1 downto 0);
--           S1 : in STD_LOGIC;
--           S2 : in STD_LOGIC;
--           S3 : in STD_LOGIC;
           O : out std_logic_vector (3 downto 0));
end component;
component timing_circuit
Port (
clk_in : in STD_LOGIC; -- 100 MHz input clock
reset : in STD_LOGIC; -- Reset signal
mux_select : inout STD_LOGIC_VECTOR (1 downto 0) :="00"; -- Signal for the mux
anodes : out STD_LOGIC_VECTOR (3 downto 0)  -- Anodes signal for display
);
end component;
signal selector : std_logic_vector (1 downto 0):="00";
signal decoder_input : std_logic_vector (3 downto 0);
--signal reset : std_logic:='0';
--signal h1,h2,h3,h4 : std_logic;
--signal c11,c22,c33,c44 :std_logic;


--signal C1=
begin
timer : timing_circuit port map (clk_in,reset,selector,A);
mux : mux4to1 port map (C1,C2,C3,C4,selector,decoder_input);
d : decoder port map (decoder_input(0),decoder_input(1),decoder_input(2),decoder_input(3),C(0),C(1),C(2),C(3),C(4),C(5),C(6));--,h1,h2,h3,h4);


end Behavioral;
