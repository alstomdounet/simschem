-- http://rouillard.org/ecrire-vhdl-et-ams.pdf

library
 ieee;use ieee.std_logic_1164.all; 
use work.switch_util.all; 
entity switch is
generic (genre: genre_mos);   
port (source, drain: inout std_logic; grille: std_logic); 
end entity switch;

architecture arch of switch is 
begin 
  process 
     impure function passant return boolean is  
     -- Une fonction pour factoriser la condition �transistor passant� 
     -- On pourrait optimiser tout �a en dupliquant l�architecture 
     -- et en faisant un Mos P et un Mos N, et deux entit�s non g�n�riques. 
      begin 
         return (grille ='1' and genre=N ) or (grille ='0' and genre=P);  
      end; 
    variable lasttime:time:=-1 ns; 
  begin  
      source <='Z'; -- on lib�re source et drain "de l'int�rieur" 
      drain <='Z';  -- pour conna�tre les contributions ext�rieures 
	  
      wait for 0 ns;
         -- wait pour que source et drain contiennent 
         -- les valeurs "ext�rieures" 
		 
      if passant then  
          -- ici le switch est passant, il faut propager 
          source <= drain; -- deux affectations crois�es qui prendront  
          drain <= source; -- effet simultan�ment sur le wait suivant 
                           -- (et pas avant, ce sont des signaux) 
      end if; 
      lasttime:=now; 
      wait on source 'transaction, drain 'transaction, grille
                  until now/=lasttime or (passant and (source /= drain));
  end process; 
end; 