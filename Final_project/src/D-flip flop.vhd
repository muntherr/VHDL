
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Dff IS
PORT(d, clk, reset : IN STD_LOGIC;
q: OUT STD_LOGIC);
END ;
--synchronous reset
ARCHITECTURE D_ff OF Dff IS
 BEGIN
     PROCESS (clk)
 BEGIN
	IF ( rising_edge(clk) ) THEN
		IF ( reset='1' ) THEN
			q <= '0';
		ELSE
			q <= d;
		END IF;
	END IF;
END PROCESS;
END ;
--Creating an n_bit register 


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY nbit_Dreg IS
GENERIC(n : positive := 4);
PORT(clk, reset : IN STD_LOGIC;
d : IN std_logic_vector(n-1 DOWNTO 0);
q: OUT STD_LOGIC_vector(n-1 DOWNTO 0));
END;
ARCHITECTURE D_reg OF nbit_Dreg IS
BEGIN
register_loop:FOR I IN 0 TO n-1 GENERATE
D_FF:ENTITY work.Dff(D_ff)
PORT MAP(d(i), clk, reset,q(i));
END GENERATE;
END;   



-- I used T flip flop but it does not worked
--LIBRARY ieee;
--USE IEEE.STD_LOGIC_1164.ALL;
----uilding jkFlip flop register to store data
--ENTITY Tff IS
--	PORT ( t , Clk, reset : IN std_logic;
--	Q : OUT std_logic);
--END ; 
--
--ARCHITECTURE t_ff OF tff IS	
--signal outt : std_logic ;
--BEGIN 
--	PROCESS(Clk , reset)
--	BEGIN
--		IF(reset = '1') THEN 
--			Q <= '0';
--			--notQ <='1';
--		ELSIF clk'event and clk  ='1' THEN 
--			IF(t ='1') THEN
--				outt <= not outt ;
--				--notQ <='1';
--			--ELSIF(t = '0') THEN 
--			--	outt <= not(outt);
--			
--			END IF;	
--			END IF;
--		END PROCESS; 
--		--Q<=outt;
--			END;
--				
--				
--LIBRARY ieee;
--USE ieee.std_logic_1164.ALL;
--
--ENTITY nbit_TReg IS
--	GENERIC(n : positive := 4);
--	PORT(clk , reset  : IN std_logic;  
--	t : IN std_logic_vector( n-1 DOWNTO 0 ) ;
--	q : OUT std_logic_vector	(n-1 DOWNTO 0 ));
--	
--END; 
--
--ARCHITECTURE T_REG OF nbit_treg IS
--
--BEGIN 
--	TFFLoop : FOR i  IN 0 TO n-1 GENERATE
--	T_Flip_flop:ENTITY work.tff(t_ff) PORT MAP(t(i) , clk , reset , q(i) ) ; 
--	END GENERATE;
--	END ;
--	