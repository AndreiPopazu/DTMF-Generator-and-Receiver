% Definirea funcției sd în fișierul sd.m
% x rezultatul funcției
% t variabila pentru care apelăm funcția
% Aceasta functie returneaza semnalul redresat dublu alternanta
function x = sd(t)
for i=1:1:length(t) %bucla de parcurgere in cazul in care t este un vector
    if t(i) < 0
        t(i) = abs(t(i));
    end
end  
x = t;
end

