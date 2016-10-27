-- http://rouillard.org/ecrire-vhdl-et-ams.pdf

library ieee;
use ieee.std_logic_1164.all; 
use work.switch_util.all; 
entity switch is
generic (genre: genre_mos);   
port (source, drain: inout std_logic; grille: std_logic); 
end entity switch;

architecture arch of switch is 
begin 
  process 
     impure function passant return boolean is  
     -- Une fonction pour factoriser la condition “transistor passant” 
     -- On pourrait optimiser tout ça en dupliquant l’architecture 
     -- et en faisant un Mos P et un Mos N, et deux entités non génériques. 
      begin 
         return (grille ='1' and genre=N ) or (grille ='0' and genre=P);  
      end; 
    variable lasttime:time:=-1 ns; 
  begin  
      source <='Z'; -- on libère source et drain "de l'intérieur" 
      drain <='Z';  -- pour connaître les contributions extérieures 
	  
      wait for 0 ns;
         -- wait pour que source et drain contiennent 
         -- les valeurs "extérieures" 
		 
      if passant then  
          -- ici le switch est passant, il faut propager 
          source <= drain; -- deux affectations croisées qui prendront  
          drain <= source; -- effet simultanément sur le wait suivant 
                           -- (et pas avant, ce sont des signaux) 
      end if; 
      lasttime:=now; 
      wait on source 'transaction, drain 'transaction, grille
                  until now/=lasttime or (passant and (source /= drain));
  end process; 
end; 