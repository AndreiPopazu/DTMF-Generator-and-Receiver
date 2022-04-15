clear                                   %sterge variabilele din workspace
close                                   %inchide figura curenta
clc                                     %sterge textul din fereastra de comanda

syms t n                                %declar variabilele de tip simbol care apar in expresiile functiilor urmatoare
T=20;                           %#input %perioada semnalului
P=T/2;                                  %jumatate de perioada
s1=-10;                         %#input %valoarea inferioara a intervalului ramura 1
d1=-5;                          %#input %valoarea superioara a intervalului ramura 1
s2=-5;                          %#input %valoarea inferioara a intervalului ramura 2
d2=5;                           %#input %valoarea superioara a intervalului ramura 2
s3=5;                           %#input %valoarea inferioara a intervalului ramura 3
d3=10;                          %#input %valoarea superioara a intervalului ramura 3

%zona de definire a coeficientilor fourier
f1(t) = 0*t;                    %#input %semnalul de intrare ramura 1
f2(t) = cos(pi*t/10);           %#input %semnalul de intrare ramura 2
f3(t) = 0*t;                    %#input %semnalul de intrare ramura 3

fsin1 = f1(t)*sin(n*pi*t/P);            %expresia de sub integrala pentru coeficientii an1 ai seriei
fsin2 = f2(t)*sin(n*pi*t/P);            %expresia de sub integrala pentru coeficientii an2 ai seriei
fsin3 = f3(t)*sin(n*pi*t/P);            %expresia de sub integrala pentru coeficientii an3 ai seriei
fcos1 = f1(t)*cos(n*pi*t/P);            %expresia de sub integrala pentru coeficientii bn1 ai seriei
fcos2 = f2(t)*cos(n*pi*t/P);            %expresia de sub integrala pentru coeficientii bn2 ai seriei
fcos3 = f3(t)*cos(n*pi*t/P);            %expresia de sub integrala pentru coeficientii bn3 ai seriei

%zona de calculare simbolica a coeficientilor fourier
a01 = (1/P)*int(f1(t),t,s1,d1); 
a02 = (1/P)*int(f2(t),t,s2,d2);
a03 = (1/P)*int(f3(t),t,s3,d3);
an1 = (1/P)*int(fcos1,t,s1,d1); 
an2 = (1/P)*int(fcos2,t,s2,d2);
an3 = (1/P)*int(fcos3,t,s3,d3);
bn1 = (1/P)*int(fsin1,t,s1,d1); 
bn2 = (1/P)*int(fsin2,t,s2,d2);
bn3 = (1/P)*int(fsin3,t,s3,d3);

a0 = a01+a02+a03;               
an(n) = an1+an2+an3;                    %atribui expresia calculata cu simboluri in an variabilei an(n) pentru a putea inlocuii valoarile lui n ulterior
bn(n) = bn1+bn2+bn3;                    %atribui expresia calculata cu simboluri in bn variabilei bn(n) pentru a putea inlocuii valoarile lui n ulterior

F = a0/2;                               %initializez suma Fourier cu componenta continua
t = linspace(s1, d3, 3000);             %creez un vezctor de timp pe toata lungimea intervalului
t1=linspace(s1, d1, 1000);              %creez un vezctor de timp pe ramura 1
t2=linspace(s2, d2, 1000);              %creez un vezctor de timp pe ramura 2
t3=linspace(s3, d3, 1000);              %creez un vezctor de timp pe ramura 3

k = 0;                                  %initializez un contor pentru indexul graficelor
figure(1);                              %creez figura 1
%Calculul sumei Fourier
for n=1:1:10
    
    F=F + (an(n))*cos(n*pi*t/P) + (bn(n))*sin(n*pi*t/P);
   
    %zona de afisare a graficelor
    if (n == 2 || n == 4 || n == 7 || n == 10)
        k = k+1;
        subplot(2,2,k);                             %creez 4 subploturi in interior figurii 1
        plot(t1,0*t1,'-k','LineWidth',1)            %graficul semnalului de intrare ramura 1
        hold on
        plot(t2,cos(pi*t2/10),'-k','LineWidth',1)   %graficul semnalului de intrare ramura 2
        hold on
        plot(t3,0*t3,'-k','LineWidth',1)            %graficul semnalului de intrare ramura 3
        hold on
        plot(t,F,'-r','LineWidth',1)                %graficul semnalului de iesire
        title(["NrArmonici=",n]);
        grid on
    end
end