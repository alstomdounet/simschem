library ieee; 
use disciplines.electrical_systems.all; 
entity self is
generic
	(Iinit: CURRENT := 0.0); 
port (
	quantity L : INDUCTANCE ; 
	terminal p, m : ELECTRICAL); 
end entity self; 

architecture analog of self is 
	quantity v across i through p to m;
	quantity F : FLUX; 
BEGIN 
if
 (domain = quiescent_domain) 
use
   F == L * Iinit; 
   i == IInit; 
elsif
 (domain = time_domain) 
use
   F == L * i; 
   v == F'dot; 
end use;
end architecture analog;