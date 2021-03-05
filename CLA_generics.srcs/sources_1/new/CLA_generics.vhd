----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2020 06:07:19 AM
-- Design Name: 
-- Module Name: CLA_generics - Behavioral
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

entity CLA_generics is
generic (delay_gate : time := 2ns);
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC);
end CLA_generics;

architecture Behavioral of CLA_generics is
signal G : std_logic_vector (3 downto 0);
signal P : std_logic_vector (3 downto 0);
signal C : std_logic_vector (3 downto 0);
begin
G <= A and B;
P <= A xor B;
C(0) <= G(0) or ( Cin and P(0)) after delay_gate := 3n;
C(1) <= G(1) or (Cin and P(0) and P(1));
C(2) <= G(2) or (P(2) and G(1)) or ( P(1) and P(2) and G(0)) or (Cin and P(0) and P(1) and P(2));
C(3) <= G(3) or (G(2) and P(3)) or (G(1) and P(2) and P(3)) or (G(0) and P(1) and P(2) and P(3));
Sum(0) <= P(0) xor Cin;
Sum(1) <= P(1) xor C(0);
Sum(2) <= P(2) xor C(1);
Sum(3) <= P(3) xor C(2);

end Behavioral;
