ibrary ieee;
use disciplines.electrical_systems.all;
use ieee.math_real.all;

entity generator is 
port 
	( quantity consigne : in VOLTAGE; 
	quantity MAG : in VOLTAGE; 
	quantity PHASE : in REAL; 
	terminal p, m: ELECTRICAL);
end entity generator;


architecture analog of generator is
	quantity v across i through p to m;
	quantity ac_spec : real spectrum MAG, MATH_2_PI * PHASE/360.0;

begin 
if (domain = quiescent_domain) or (domain = time_domain) 
use
	v == - consigne;
else
	v == - ac_spec;
end use;
end architecture analog;