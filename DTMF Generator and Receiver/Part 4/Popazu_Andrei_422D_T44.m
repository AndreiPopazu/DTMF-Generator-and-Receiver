clear
clc
syms x s t

%simbolic
x(s)=(5*s-1)/(s^3-3*s-2);
xs=ilaplace(x(s))

%numeric
numaratorul = [5 -1]; %coeficientii numaratorului
numitorul = [1 0 -3 -2]; %coeficientii numitorului
[r,p] = residue(numaratorul,numitorul); %calculul reziduurilor (r) si polilor(p)

xn=r(1)*exp(p(1)*t) + r(2)*exp(p(2)*t) + r(3)*t*exp(p(3)*t)