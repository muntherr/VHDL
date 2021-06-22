									 --Build 1 bit full adder with gates with delays 

LIBRARY ieee;  
library work;
USE ieee.std_logic_1164.ALL;
use work.all;



ENTITY Fa IS --Define varibles in: a , b , Cin -> carry in | out:  s -> sum , Cout -> Carry out if there carry   
	PORT (a,b,cin :IN  std_logic;
	sum ,Cout : OUT std_logic );
	
END;

ARCHITECTURE sit OF Fa IS
signal s1 , s2 , s3 ,s4 :std_logic ;
BEGIN
  				  
 g0: entity work.Xor2(x2)port map(a,b, s1);  -- gate 0 with three inputs to get the Sum	 
 g1: entity work.Xor2(x2)port map(s1,cin,sum);
 g2: entity work.and2(a2) port map(a,b,s2);     -- and gate with input a , b and output s1
 g3: entity work.and2(a2) port map(a,cin,s3);   -- and gate with input a , cin and output s2
 g4: entity work.and2(a2) port map(b,cin ,s4);   -- and gate with input b , cin and output s3
 g5: entity work.or3(o3) port map(s2,s3 , s4 ,Cout);-- gate 1 with three input with Or gate and the output is Cout  

   ----have 1 bit Adder with 44 ns delay 
--   sum <= a xor b xor cin ;
--   Cout <=((a and b ) or( a and cin ) or( b and cin));
--   

end;   	



 --Here i will build 4 bit adder from 1 bit adder structurally

library ieee;
use ieee.std_logic_1164.all;
--entity of the four bit adder
entity Four_bit_adder is
	port( a, b : in std_logic_vector(3 downto 0 );
	cin: in std_logic;  --cin = 0 always 
	sum :out std_logic_vector(3 downto 0 ) ;
	Cout:out std_logic);
	
end; 																											  
--Architecture of Four bit adder 
architecture Four_adder of Four_bit_adder is
signal q1, q2 , q3 :std_logic;
begin	  
	--build four bit adder from 1 full Bit adder 
	


	g0: entity work.Fa(sit) port map(a(0), b(0) ,cin , sum(0), q1);
	g1: entity work.Fa(sit) port map(a(1), b(1) ,q1 , sum(1) , q2);
    g2: entity work.Fa(sit) port map(a(2), b(2) ,q2 , sum(2) , q3);
	g3: entity work.Fa(sit) port map(a(3), b(3) ,q3 , sum(3) , Cout);
end;
