--muntherr anati 1182028 
--Build gates with delays to use it for whole circuit 
--And Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and2 IS
	PORT (a ,b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE a2 OF and2 IS
BEGIN	
	y <= a AND b AFTER 8 ns;   --Build behavioural and gate with 8 ns Delay 
END;




--And3 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and3 IS
	PORT (a ,b , c : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE a3 OF and3 IS
BEGIN	
	y <= a AND b and c AFTER 8 ns;   --Build behavioural and gate with 8 ns Delay 
END;

--And4 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and4 IS
	PORT (a ,b , c ,d : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE a4 OF and4 IS
BEGIN	
	y <= a AND b and c and d  AFTER 8 ns;   --Build behavioural and gate with 8 ns Delay 
END;


--And5 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and5 IS
	PORT (a ,b , c,d,e : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE a5 OF and5 IS
BEGIN	
	y <= a AND b and  c and d and e  AFTER 8 ns;   --Build behavioural and gate with 8 ns Delay 
END;



--Or Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or2 IS
	PORT (a ,b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE o2 OF or2 IS
BEGIN	
	y <= a OR b AFTER 8 ns;   --Build behavioural Or gate with 8 ns Delay 
END;

--Or3 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or3 IS
	PORT (a ,b ,c : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE o3 OF or3 IS
BEGIN	
	y <= (a OR b or c) AFTER 8 ns;   --Build behavioural Or gate with 8 ns Delay 
END; 

--Or4 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or4 IS
	PORT (a ,b ,c , d : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE o4 OF or4 IS
BEGIN	
	y <= (a OR b or c or d)  AFTER 8 ns;   --Build behavioural Or gate with 8 ns Delay 
END;


--Or5 Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY or5 IS
	PORT (a ,b ,c ,d , e : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE o5 OF or5 IS
BEGIN	
	y <= (a OR b or c or d or e) AFTER 8 ns;   --Build behavioural Or gate with 8 ns Delay 
END;



--Inverter Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY inverter2 IS
	PORT (a  : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE i2 OF inverter2 IS
BEGIN	
	y <= (NOT a)  AFTER 3 ns;   --Build behavioural Inverter gate with 3 ns Delay 
END;



--Nand Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Nand2 IS
	PORT (a , b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE N2 OF Nand2 IS
BEGIN	
	y <= (a NAND b ) AFTER 6 ns;   --Build behavioural Nand gate with 6 ns Delay 
END;

--NOR Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Nor2 IS
	PORT (a , b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE No2 OF Nor2 IS
BEGIN	
	y <= (a NOR b)  AFTER 6 ns;   --Build behavioural Nor gate with 6 ns Delay 
END; 

--XOR Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Xor2 IS
	PORT (a , b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE x2 OF Xor2 IS
BEGIN	
	y <= (a XOR b)  AFTER 12 ns;   --Build behavioural Xor gate with 12 ns Delay 
END;

--3 input XOR Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Xor3 IS
	PORT (a , b , c : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE x3 OF Xor3 IS
BEGIN	
	y <= ((a XOR b) XOR c)  AFTER 12 ns;   --Build behavioural Xor gate with 12 ns Delay 
END;

--XNOR Gates
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Xnor2 IS
	PORT (a , b : IN std_logic ;
	y : OUT std_logic);
END;

ARCHITECTURE xn2 OF Xnor2 IS
BEGIN	
	y <= (a XNOR b)  AFTER 10 ns;   --Build behavioural Xnor gate with 12 ns Delay 
END;


