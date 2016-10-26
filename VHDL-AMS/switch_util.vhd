-- http://rouillard.org/ecrire-vhdl-et-ams.pdf
library ieee;use ieee.std_logic_1164.all; 
package switch_util is 
type genre_mos is (P, N);
component switch 
generic (genre: genre_mos);   
port (source, drain: inout std_logic; grille: std_logic); 
end component; 
end package switch_util; 