% Calculul transformatei Laplace inverse
% pkg load symbolic %pentru octave decomentati aceasta linie
syms X s x ; %simbolurile
X = (s+2)/(s^3+4*s^2+3*s); %transformat
x = ilaplace(X) %transformata inversa