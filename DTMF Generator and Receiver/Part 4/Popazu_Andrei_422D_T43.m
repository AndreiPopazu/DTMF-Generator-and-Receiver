clear
clc
syms x w t;
x = cos(w*t);
X = laplace(x) %funcție care generează transformata laplace pentru scrierea simbolica
