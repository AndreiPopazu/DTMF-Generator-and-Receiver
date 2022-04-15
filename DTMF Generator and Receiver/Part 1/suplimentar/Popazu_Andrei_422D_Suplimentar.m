clear                                           %sterge toate variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda

%A
FS = 500;                                        %frecventa de esantionare
t = 0:1/FS:0.3;                                  %generarea vectorului de timp
f=10;                                            %frecventa semnalului
semnal = sin(2*pi*f*t);

semnal_redresat_mono = sm(semnal);
semnal_redresat_dublu = sd(semnal);

figure; 
plot(t,semnal_redresat_mono,'-r');
grid on;
figure
plot(t,semnal_redresat_dublu,'-r');
grid on;

%B
M = round(10*rand(10,10));
%1
suma_colturi = M(1,1)+M(1,end)+M(end,1)+M(end,end);     %suma elementelor din colturile matricii
%2
suma_elemente = sum(M,'all');                           %suma tuturor elementelor matricii
%3
M3 = matrice_unitate(2,3);                              %creeare matrice unitate
%4
ex4 = suma_linii(M);                                    %sumele fiecarei linii ale matricii
%5
ex5 = schimbare_element(M3,1,-100);                     %inlocuirea elementului 1 cu -100 in toata matricea
%6
[ex6,k] = aprox_pi(0.01);                               %functia intoarce valoarea lui pi in ex6 si k min folosit
%7
[V1,V2] =  par_impar(M);                                %functie care sorteaza elementele impare in vectorul v1 si elementele pare in vectorul v2
%8
ex8 = sinc_calcul(2,1);                                 %functie care calculeaza expresia ∑sin((2𝑘 − 1) ∗ 𝑡)/2𝑘 − 1
%9
t=linspace(0,4*pi,1001);  %instructiunea linespace creeaza un vector cu valori 
                          %distribuite liniar intre capetele intervalului
p = zeros(1,1001);        %initializez un vector cu 1001 valori de 0
for i = 1:1001
    p(i) = sinc_calcul(10,t(i));
end
figure;
plot(t,p);
grid on;
