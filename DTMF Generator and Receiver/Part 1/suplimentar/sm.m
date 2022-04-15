% Definirea funcției sm în fișierul sm.m
% x rezultatul funcției
% t variabila pentru care apelăm funcția
% Aceasta functie returneaza semnalul redresat dublu monoalternanta
function x = sm(t)
for i=1:1:length(t) %bucla de parcurgere in cazul in care t este un vector
    if t(i) < 0
        t(i) = 0;
    end
end  
x = t;
end

