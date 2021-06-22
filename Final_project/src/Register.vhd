LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.ALL;
--uilding jkFlip flop register to store data
ENTITY Tff IS
	PORT ( t , Clk, reset : IN std_logic;
	Q : OUT std_logic);
END ; 

ARCHITECTURE t_ff OF tff IS	
signal outt : std_logic ;
BEGIN 
	PROCESS(Clk , reset)
	BEGIN
		IF(reset = '0') THEN 
			Q <= '0';
			--notQ <='1';
		ELSIF(rising_edge(Clk)) THEN 
			IF(t ='0') THEN
				outt <= outt ;
				--notQ <='1';
			ELSIF(t = '1') THEN 
				outt <= not(outt);
			
			END IF;	
			END IF;
		END PROCESS; 
		Q<=outt;
			END;
				
				
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY nbit_TReg IS
	GENERIC(n : positive := 4);
	PORT(clk , reset  : IN std_logic;  
	t : IN std_logic_vector( n-1 DOWNTO 0 ) ;
	q : OUT std_logic_vector	(n-1 DOWNTO 0 ));
	
END; 

ARCHITECTURE jk_reg OF nbit_jkreg IS

BEGIN 
	TFFLoop : FOR i  IN 0 TO n-1 GENERATE
	T_Flip_flop:ENTITY work.tff(t_ff) PORT MAP(t(i) , clk , reset , Q(i) ) ; 
	END GENERATE;
	END ;
	
			