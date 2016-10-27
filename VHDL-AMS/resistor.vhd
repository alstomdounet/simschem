library ieee; 
use disciplines.electrical_systems.all; 
entity resist is
port (quantity R : RESISTANCE;  
	terminal p, m : ELECTRICAL); 
end entity resist;

architecture analog of resist is
	quantity v across i through p to m; 
begin 
	v == i*R; 
end architecture analog; 