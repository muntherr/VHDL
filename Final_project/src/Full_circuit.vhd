LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY Full IS 
	PORT( a, b  : IN  std_logic_vector ( 7 DOWNTO 0 ); -- 8 bit inputs -> from 0-3 it is least significant digits and from 4 to 	7 it is most sig. bit 
	cin  , clk1 , clk2  , reset : IN std_logic;
	sum : OUT std_logic_vector( 7 DOWNTO 0);  -- 8 bit outputs
	Cout: OUT std_logic );
	
END;

-- build full circuit use the BCD adder made from the 4 bit adder
ARCHITECTURE Final OF Full IS

SIGNAL reg_in : std_logic_vector(16 DOWNTO 0 ) ;--a and b inputs for register
SIGNAL BCD_in : std_logic_vector(16 DOWNTO 0 ); -- all autputs from register Enter BCD 
SIGNAL BCD_sum: std_logic_vector(7 DOWNTO 0 );
SIGNAL BCD_Cout : std_logic;-- output of the BCD adder , input for output register
BEGIN	
	reg_in <= a&b& cin; -- add all inputs together   , cin will be BCD_in(0)
   input_reg: ENTITY work.nbit_Dreg(D_reg) GENERIC MAP (17) PORT MAP (clk1 ,reset , reg_in ,  BCD_in);	-- call t_register to a and b from 15 to 8 for most significant digit  and from 7 to 0  for least significant
   BCD_add1 : ENTITY work.twodigit_bcd(bcd_two) PORT MAP ( BCD_in(16 DOWNTO 9) ,  BCD_in(8 DOWNTO 1),  BCD_in(0) ,  BCD_sum , BCD_Cout);--Enter register outputs and enter it to BCD  to get BCD output   (most significant bit)
   regout:ENTITY work.nbit_Dreg(D_reg) GENERIC MAP (8) PORT MAP (clk2, reset, BCD_sum  ,sum); -- Enter BCD output and store it to register
   carry: ENTITY work.Dff(D_ff) PORT MAP (BCD_Cout , clk2 , reset , Cout); -- Enter Output from BCD and cin to register	  
END;

-- make Full circuit using Carry look Ahead adder 


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY CLK_Full IS 
	PORT( a, b  : IN  std_logic_vector ( 7 DOWNTO 0 ); -- 8 bit inputs -> from 0-3 it is least significant digits and from 4 to 	7 it is most sig. bit 
	cin  , clk1 , clk2  , reset : IN std_logic;
	sum : OUT std_logic_vector( 7 DOWNTO 0);  -- 8 bit outputs
	Cout: OUT std_logic );
	
END;

-- build full circuit use the BCD adder made from the 4 bit adder
ARCHITECTURE Final_CLK OF CLK_Full IS

SIGNAL reg_in : std_logic_vector(16 DOWNTO 0 ) ;--a and b inputs for register
SIGNAL BCD_in : std_logic_vector(16 DOWNTO 0 ); -- all autputs from register Enter BCD 
SIGNAL BCD_sum: std_logic_vector(7 DOWNTO 0 );
SIGNAL BCD_Cout : std_logic;-- output of the BCD adder , input for output register
BEGIN	
	reg_in <= a&b& cin; -- add all inputs together   , cin will be BCD_in(0)
   input_reg: ENTITY work.nbit_Dreg(D_reg) GENERIC MAP (17) PORT MAP (clk1 ,reset , reg_in ,  BCD_in);	-- call t_register to a and b from 15 to 8 for most significant digit  and from 7 to 0  for least significant
   BCD_add1 : ENTITY work.twodigit_bcd_clk(CLK_bcd_two) PORT MAP ( BCD_in(16 DOWNTO 9) ,  BCD_in(8 DOWNTO 1),  BCD_in(0) ,  BCD_sum , BCD_Cout);--Enter register outputs and enter it to BCD  to get BCD output   (most significant bit)
   regout:ENTITY work.nbit_Dreg(D_reg) GENERIC MAP (8) PORT MAP (clk2, reset, BCD_sum  ,sum); -- Enter BCD output and store it to register
   carry: ENTITY work.Dff(D_ff) PORT MAP (BCD_Cout , clk2 , reset , Cout); -- Enter Output from BCD and cin to register	  
END;

		