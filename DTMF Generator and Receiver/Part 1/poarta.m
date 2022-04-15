% Definirea funcției poarta în fișierul poarta.m
% x rezultatul funcției
% t variabila pentru care apelăm funcția
%Aceasta functie returneaza valoarea '1' pentru |t|<0.5 si 0 in rest
function x = poarta(t)
x = 1*(abs(t)<0.5); %returneaza 1 pentru |t|<0.5 altfel returneaza 0 
end