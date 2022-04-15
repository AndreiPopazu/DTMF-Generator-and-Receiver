clear                                   %sterge variabilele din workspace
close                                   %inchide figura curenta
clc                                     %sterge textul din fereastra de comanda

syms t n                                %declar variabilele de tip simbol care apar in expresiile functiilor urmatoare
T=20;                           %#input %perioada semnalului
P=T/2;                                  %jumatate de perioada
s=-10;                          %#input %valoarea inferioara a intervalului
d=10;                           %#input %valoarea superioara a intervalului

%zona de definire a coeficientilor fourier
f(t) = t ;                      %#input %semnalul de intrare 

fsin = f(t)*sin(n*pi*t/P);              %expresia de sub integrala pentru coeficientii an ai seriei
fcos = f(t)*cos(n*pi*t/P);              %expresia de sub integrala pentru coeficientii bn ai seriei

%zona de calculare a coeficientilor fourier
a0 = (1/P)*int(f(t),t,s,d);     
an = (1/P)*int(fcos,t,s,d); 
bn = (1/P)*int(fsin,t,s,d); 
an(n) = an;                             %atribui expresia calculata cu simboluri in an variabilei an(n) pentru a putea inlocuii valoarile lui n ulterior
bn(n) = bn;                             %atribui expresia calculata cu simboluri in bn variabilei bn(n) pentru a putea inlocuii valoarile lui n ulterior

F = a0/2;                               %initializez suma Fourier cu componenta continua
t = linspace(s, d, 2000);               %creez un vezctor de timp pe toata lungimea intervalului
k = 0;                                  %initializez un contor pentru indexul graficelor
figure(1);                              %creez figura 1
%Calculul sumei Fourier
for n=1:1:10
    
    F = F + (an(n))*cos(n*pi*t/P) + (bn(n))*sin(n*pi*t/P);
    
    %zona de afisare a graficelor
    if (n == 2 || n == 4 || n == 7 || n == 10)
        k = k+1;
        subplot(2,2,k);                 %creez 4 subploturi in interior figurii 1
        plot(t,t,'-k','LineWidth',1)    %graficul semnalului de intrare
        hold on
        plot(t,F,'-r','LineWidth',1)    %graficul semnalului de iesire
        title(["NrArmonici=",n]);
        grid on
    end
end