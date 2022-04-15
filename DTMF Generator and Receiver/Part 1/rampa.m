% Definirea funcției rampa în fișierul rampa.m
% x rezultatul funcției
% t variabila pentru care apelăm funcția
%Aceasta functie returneaza valoarea 't' pentru t>=0 si 0 in rest
function x = rampa(t)
for i=1:1:length(t) %bucla de parcurgere in cazul in care t este un vector
    if t(i) < 0
        t(i) = 0;
    end
end    
x = t; %returneaza t cand t>=0 si 0 pt t<0
end