% Calculul transformatei Fourier in timp discret
% pkg load symbolic %pentru octave decomentati aceasta linie
syms x a t;
x = exp(-a*t);
X = laplace(x) %funcție care enerează transformata laplace pentru scriereasimbolica
