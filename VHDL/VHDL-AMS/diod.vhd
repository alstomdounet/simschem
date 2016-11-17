library IEEE, Disciplines; 
use disciplines.electrical_system.all; 
entity Diod is 
generic(
	iss: REAL := 1.0e-14; 
	n, af: REAL := 1.0; 
	tt, cj0, vj, rs, kf: REAL := 0.0
	); 
port (
	terminal anode, cathode: electrical); 
end entity Diod; 

library IEEE;
use IEEE.math_real.all;

architecture Level0 of Diod is
	quantity vd across id, ic through anode to cathode;
	quantity qc: charge;
	constant vt: REAL := 0.0258;     -- thermal voltage 
begin 
 id==iss * (exp((vd-rs*id)/(n*vt)) - 1.0); 
 qc==tt*id - 2.0*cj0 * sqrt(vj**2 - vj*vd); 
 ic == qc’dot; 
end architecture Level0; 