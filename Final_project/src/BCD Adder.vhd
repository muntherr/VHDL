library ieee;
use ieee.std_logic_1164.all;

entity BCD is 
	port ( a, b : in std_logic_vector(3 downto 0 );
	cin:in std_logic ;
	sum: out std_logic_vector(3 downto 0);
	Cout:out std_logic);
end;

architecture stBCD of BCD is	--architecture of the BCD adder built structurally using the ripple adder

signal n1 , n2  ,ignored_Cout, C_out , O_carry : std_logic; --signals for the outputs gates in BCD circuit
signal s1 , s2 : std_logic_vector( 3 downto 0);
begin 									   
	
	g0 : entity work.Four_bit_adder(Four_adder) port map (a  , b , cin , s1 , C_out);
	g1 : entity work.and2(a2) port map(s1(3), s1(2) , n1);
	g2 : entity work.and2(a2) port map(s1(3), s1(1) , n2); 
	g3 : entity work.or3(o3) port map ( n1 , n2 ,C_out , O_carry) ;	
	s2<="0110" when O_carry = '1' else "0000" ;
		Cout <= '1' when O_carry = '1'
	else '0';
	g5 : entity work.Four_bit_adder(Four_adder) port map (s1 , s2 , '0' , sum , ignored_Cout);
end;
		

--build  2-Digit BCD Adder form 1-Digit BCD adder
library ieee;
use ieee.std_logic_1164.all;


entity twoDigit_bcd is
	port( a, b : in std_logic_vector(7 downto 0 ) ;  
	cin : in std_logic := '0' ;
	sum	: out std_logic_vector(7 downto 0);
	Cout : out std_logic);
end; 

architecture Bcd_two of twoDigit_bcd is	 
signal in_a , in_b , sum_s : std_logic_vector(7 downto 0 ) ;
signal carry1 , carry2 , carry3: std_logic;
begin 
	in_a <= (a);
	in_b <=(b);
	sum <= sum_s;

l1: entity work.bcd(stbcd) port map (in_a(3 downto 0 ) , in_b ( 3 downto 0 ) , cin , sum_s(3 downto 0), carry1 )	; 
l2: entity work.bcd(stbcd) port map ( in_a(7 downto 4) , in_b ( 7 downto 4) , carry1 , sum_s( 7 downto 4 ), Cout);	 
	--sum <= sum_s(7 downto 0 );
--l3: entity work.bcd(stbcd) port map ( in_a(11 downto 8) , in_b ( 11 downto 8) , carry1 , sum_s( 11 downto 8) , carry2 );	
--l3: entity work.bcd(stbcd) port map ( in_a(15 downto 8) , in_b ( 11 downto 8) , carry1 , sum_s( 11 downto 8) , carry2 );
 --sums <= sum1 & sum2; --concatinating sum1 and sum2 to be all in 8 bit sum 
 
 end ; 
 


library ieee;
use ieee.std_logic_1164.all;

entity BCD_CLK is 
	port ( a, b : in std_logic_vector(3 downto 0 );
	cin:in std_logic ;
	sum: out std_logic_vector(3 downto 0);
	Cout:out std_logic);
end;

architecture stBCD_CLK of BCD_CLK is	--architecture of the BCD_Carry look ahead Adder built structurally using the Look ahead adder

signal n1 , n2  ,ignored_Cout, C_out , O_carry : std_logic; --signals for the outputs gates in BCD circuit
signal s1 , s2 : std_logic_vector( 3 downto 0);
begin 									   
	
	g0 : entity work.CLK(f_CLK) port map (a  , b , cin , s1 , C_out);
	g1 : entity work.and2(a2) port map(s1(3), s1(2) , n1);
	g2 : entity work.and2(a2) port map(s1(3), s1(1) , n2); 
	g3 : entity work.or3(o3) port map ( n1 , n2 ,C_out , O_carry) ;	
	s2<="0110" when O_carry = '1' else "0000" ;
		Cout <= '1' when O_carry = '1'
	else '0';
	g5 : entity work.CLK(f_CLk) port map (s1 , s2 , '0' , sum , ignored_Cout);
end;																			  

--build  2-Digit BCD Adder form 1-Digit BCD adder made form Carry look ahead adder
library ieee;
use ieee.std_logic_1164.all;


entity twoDigit_bcd_CLK is
	port( a, b : in std_logic_vector(7 downto 0 ) ;  
	cin : in std_logic := '0' ;
	sum	: out std_logic_vector(7 downto 0);
	Cout : out std_logic);
end; 

architecture CLk_Bcd_two of twoDigit_bcd_CLk is	 
signal in_a , in_b , sum_s : std_logic_vector(7 downto 0 ) ;
signal carry1 , carry2 , carry3: std_logic;
begin 
	in_a <= (a);
	in_b <=(b);
	sum <= sum_s;

l1: entity work.bcd_CLK(stbcd_CLk) port map (in_a(3 downto 0 ) , in_b ( 3 downto 0 ) , cin , sum_s(3 downto 0), carry1 )	; 
l2: entity work.bcd_CLK(stbcd_CLk) port map ( in_a(7 downto 4) , in_b ( 7 downto 4) , carry1 , sum_s( 7 downto 4 ), Cout);	 
 
 end ; 
 














