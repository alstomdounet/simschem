library ieee; 
use disciplines.electrical_systems.all; 
entity capacity is generic
 (Vinit : VOLTAGE := 0.0); 
port
	(quantity C : CAPACITANCE;  
	terminal p, m  : ELECTRICAL); 
end entity capacity;

architecture analog of capacity is 
	quantity v across i through p to m; 
	quantity Q : CHARGE; 
BEGIN 
if (domain = quiescent_domain) 
use
      Q == C* Vinit; 
      v == Vinit; 
elsif (domain = time_domain)
use 
      Q == C * v ; 
      i == Q'dot; 
end use; 
end architecture analog; 