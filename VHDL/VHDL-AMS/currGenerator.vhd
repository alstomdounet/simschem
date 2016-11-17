library ieee;
use disciplines.electrical_systems.all;

entity source_courant is 
	port (
		quantity consigne : IN CURRENT;
		quantity MAG : in CURRENT;
		quantity PHASE : in REAL;
		terminal p, m: ELECTRICAL);
end entity source_courant;

library ieee;
use ieee.math_real.all;
architecture analog of source_courant is 
	quantity v across i through p to m;
	quantity ac_spec : real spectrum MAG, MATH_2_PI * PHASE/360.0;

begin 
if (domain = quiescent_domain) or (domain = time_domain)
use
	i == consigne;
else
	i == ac_spec;
end use;
end architecture analog; 