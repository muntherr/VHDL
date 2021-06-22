-- Creating look ahead adder
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;

-- Entity of carry look Ahead Adder 
ENTITY CLK IS
	PORT ( a, b : IN std_logic_vector(3 DOWNTO 0);
	cin :IN std_logic;
	sum : OUT std_logic_vector(3 DOWNTO 0 );
	Cout : OUT std_logic);
END;


ARCHITECTURE F_CLK OF CLK IS

	SIGNAL s:std_logic_vector(9 DOWNTO 0 );
	SIGNAL c : std_logic_vector(3 DOWNTO 0);
	SIGNAL p : std_logic_vector (3 DOWNTO 0 );
	SIGNAL g : std_logic_vector( 3 DOWNTO  0);
BEGIN 	
	-- CLk Propagate Loop 
		CLKPr: FOR i IN 3 DOWNTO 0 GENERATE
			CLKPr : ENTITY work.Xor2(x2) PORT MAP (a(i) , b(i) , p(i));
			END GENERATE;
    -- CLK Generate LOOP
		CLKGe : FOR i IN 3 DOWNTO 0 GENERATE
			CLKGe : ENTITY work.and2(a2) PORT MAP(a(i) , b(i) , g(i));
			END GENERATE;
			
			Cout <= c(3); --assign cout
			-- Carry look ahead generator
			
			g0:ENTITY work.and2(a2) PORT MAP(cin ,p(0) , s(0));
			Ca0:ENTITY work.or2(o2) PORT MAP(s(0) , g(0) , c(0));
				
				
			g1:ENTITY work.and3(a3) PORT MAP (cin , p(0), p(1),s(1));
			g2:ENTITY work.and2(a2) PORT MAP (g(0) , p(1)  , s(2) ); 
			Ca1:ENTITY work.or3(o3) PORT MAP (s(1) , s(2), c(1));
				
				
		    g3:ENTITY work.and4(a4) PORT MAP (cin , p(0) , p(1) ,p(2) ,s(3));
			g4:ENTITY work.and3(a3) PORT MAP (g(0) , p(1), p(2), s(4));
			g5:ENTITY work.and2(a2) PORT MAP (g(1) , p(2) , s(5) );
			Ca2:ENTITY work.or4(o4) PORT MAP (s(3) , s(4) , s(5) , c(2));
				
			
			g6:ENTITY work.and2(a2) PORT MAP (g(2) , p(3) , s(6));
			g7:ENTITY work.and3(a3) PORT MAP(g(1) , p(2) , p(3) , s(7));
			g8:entity work.and4(a4) port map(g(0) , p(1) , p(2) , p(3) , s(8));
			g9: entity work.and5(a5) port map(cin , p(0),p(1), p(2) , p(3) ,s(9));
			Ca3: entity work.or5(o5) port map (g(3) , s(6) , s(7) , s(8) , s(9) ,c(3)); 
														 
											  
			-- final connection to find Sum and Carry
			
			CLksum : for i in 0 to 3 generate
				Clksu : entity work.Xor2(x2) port map(c(i) , p(i) , sum(i));
			end generate;
			end;
			
				
			
			
		
	
	