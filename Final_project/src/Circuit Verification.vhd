--Here i will verification excepted output and BCD adder Output  , and write it to file 
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;

-- put 3 main input -> two clock and the reset
ENTITY Ver IS 
	PORT(clk1 , clk2 , reset : IN std_logic);
END;

--in this archeticture i will do a verification for BCD adder made from four bit adder 
ARCHITECTURE Ver_BCD_FourBit OF Ver IS

SIGNAL Expected_Res: std_logic_vector(8 DOWNTO 0); --computed behavioraly
SIGNAL BCD_Res: std_logic_vector( 7 DOWNTO 0 );							 
SIGNAL BCD_carry : std_logic;
SIGNAL in_a , in_b : std_logic_vector(7 DOWNTO  0) :="00000000";  --initialize two inputs
SIGNAL in_carry : std_logic := '0' ; -- initialize the carry to 0  	
SIGNAL Res :std_logic_vector(8 DOWNTO 0);

BEGIN 
	
	t1: ENTITY work.full(final) PORT MAP ( in_a, in_b, in_carry ,  clk1 , clk2 ,reset , BCD_Res , BCD_carry);
	Res <=   BCD_carry&BCD_Res  ; -- adding carry with inputs (concatinating it together)
	--Print  result to the file 
	
	PROCESS 
	FILE output_File : TEXT ;
	VARIABLE row : line;
    VARIABLE data_write : integer;
	
	BEGIN 
		file_open(output_file , "BCD_VERIFICATION.txt" , Write_mode);
		
		-- for loop for print all input with carry and print expected reuslt 
			FOR i IN 0 TO 16 LOOP	   -- for input a 
				FOR j IN 0 TO 16 LOOP  -- for input b
					FOR k IN 0 TO 1 LOOP  --for carry input  
						-- Set the inputs to the adder
     					 in_a <= CONV_STD_LOGIC_VECTOR(i,8);
      					 in_b <= CONV_STD_LOGIC_VECTOR(j,8);  
						   
						   IF(k =0) THEN in_carry<='0';
						   ELSE in_carry <= '1';
						   END IF ;	   
						   WAIT UNTIL rising_edge(clk2);
						   
      					 -- Calculate what the output of the BCD_ADDER should be  "Behaviorly"
						   data_write:= i + j + k ;
						   IF(data_write > 9 ) THEN 
							  data_write:= data_write+6 ; 
							  END IF;
	
     					 Expected_Res <= CONV_STD_LOGIC_VECTOR(data_write,9);
     					 -- Wait until adder output has settled		  
						  WAIT FOR 210 ns ;
						  	  -- if all is good and Expected output == actual output 
						  IF(( Expected_Res(7 DOWNTO 0 ) = BCD_Res) AND (Expected_Res (8) =  BCD_carry)	)
							  THEN 
							  write(row , in_a) ; 
							  write(row, "+");
							  write(row, in_b);
							  write(row,"+");
							    write(row, in_carry);
							  write(row, "==");
							  write(row , Expected_Res);					   
							  write(row , "=");
							  write(row , Res);
							  writeline(output_file, row);
						  ELSE
							 write(row , in_a) ; 
							  write(row, "+");
							  write(row, in_b);
							  write(row,"+");
							  write(row, in_carry);
							  write(row, "==");
							  write(row , Expected_Res);					   
							  write(row , "!=");
							  write(row , Res);
							  write(row , " Wrong ,Not as Expected output!!");
							  writeline(output_file, row);
						  END IF;  
						  
						  IF (i = 16 AND j = 16 AND k=1) THEN
							  ASSERT FALSE
							REPORT ("Done , all possible inputs for BCD well be reporting to file (BCD_VERIFICATION.txt)")
						SEVERITY WARNING;	
						
					END IF;
						END LOOP;
						END LOOP;
					    END LOOP;
						
						FILE_CLOSE(output_file);
						WAIT;
						
						END PROCESS; 
						
					--	IF rising_edge(clk) THEN
        				-- Check whether adder output matches expectation 
       					 ASSERT   ( Expected_Res(7 DOWNTO 0) =  Res )  
               			  AND Expected_Res(8) = in_carry 
     					  REPORT   "Adder output is incorrect" 
      					  SEVERITY warning;
						--END IF;
						END;

	
						
						
--building Circuit verification for BCD  MADE FROM CLK ADDER 

LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;

-- put 3 main input -> two clock and the reset
ENTITY Ver_CLK IS 
	PORT(clk1 , clk2 , reset : IN std_logic);
END;

--in this archeticture i will do a verification for BCD adder made from four CLK
ARCHITECTURE Ver_BCD_FourBit_CLK OF Ver_cLK IS

SIGNAL Expected_Res: std_logic_vector(8 DOWNTO 0); --computed behavioraly
SIGNAL BCD_Res: std_logic_vector( 7 DOWNTO 0 );							 
SIGNAL BCD_carry : std_logic;
SIGNAL in_a , in_b : std_logic_vector(7 DOWNTO  0) :="00000000";  --initialize two inputs
SIGNAL in_carry : std_logic := '0' ; -- initialize the carry to 0  	
SIGNAL Res :std_logic_vector(8 DOWNTO 0);

BEGIN 
	
	t1: ENTITY work.CLK_full(final_CLK) PORT MAP ( in_a, in_b, in_carry ,  clk1 , clk2 ,reset , BCD_Res , BCD_carry);
	Res <=   BCD_carry&BCD_Res  ; -- adding carry with inputs (concatinating it together)
	--Print  result to the file 
	
	PROCESS 
	FILE output_File : TEXT ;
	VARIABLE row : line;
    VARIABLE data_write : integer;
	
	BEGIN 
		file_open(output_file , "CLK_BCD_VERIFICATION.txt" , Write_mode);
		
		-- for loop for print all input with carry and print expected reuslt 
			FOR i IN 0 TO 16 LOOP	   -- for input a 
				FOR j IN 0 TO 16 LOOP  -- for input b
					FOR k IN 0 TO 1 LOOP  --for carry input  
						-- Set the inputs to the adder
     					 in_a <= CONV_STD_LOGIC_VECTOR(i,8);
      					 in_b <= CONV_STD_LOGIC_VECTOR(j,8);  
						   
						   IF(k =0) THEN in_carry<='0';
						   ELSE in_carry <= '1';
						   END IF ;	   
						   WAIT UNTIL rising_edge(clk2);
						   
      					 -- Calculate what the output of the BCD_ADDER_CLK should be  "Behaviorly"
						   data_write:= i + j + k ;
						   IF(data_write > 9 ) THEN 
							  data_write:= data_write+6 ; 
							  END IF;
	
     					 Expected_Res <= CONV_STD_LOGIC_VECTOR(data_write,9);
     					 -- Wait until adder output has settled		  
						  WAIT FOR 300 ns ;
						  	  -- if all is good and Expected output == actual output 
						  IF(( Expected_Res(7 DOWNTO 0 ) = BCD_Res) AND (Expected_Res (8) =  BCD_carry)	)
							  THEN 
							  write(row , in_a) ; 
							  write(row, "+");
							  write(row, in_b);
							  write(row,"+");
							    write(row, in_carry);
							  write(row, "==");
							  write(row , Expected_Res);					   
							  write(row , "=");
							  write(row , Res);
							  writeline(output_file, row);
						  ELSE
							 write(row , in_a) ; 
							  write(row, "+");
							  write(row, in_b);
							  write(row,"+");
							  write(row, in_carry);
							  write(row, "==");
							  write(row , Expected_Res);					   
							  write(row , "!=");
							  write(row , Res);
							  write(row , " Wrong ,Not as Expected output!!");
							  writeline(output_file, row);
						  END IF;  
						  
						  IF (i = 16 AND j = 16 AND k=1) THEN
							  ASSERT FALSE
							REPORT ("Done , all possible inputs for BCD well be reporting to file (CLK_BCD_VERIFICATION.txt)")
						SEVERITY WARNING;	
						
					END IF;
						END LOOP;
						END LOOP;
					    END LOOP;
						
						FILE_CLOSE(output_file);
						WAIT;
						
						END PROCESS; 

        				-- Check whether adder output matches expectation 
       					 ASSERT   ( Expected_Res(7 DOWNTO 0) =  Res )  
               			  AND Expected_Res(8) = in_carry 
     					  REPORT   "Adder output is incorrect" 
      					  SEVERITY warning;

						END;

	
							  
						
	




	

