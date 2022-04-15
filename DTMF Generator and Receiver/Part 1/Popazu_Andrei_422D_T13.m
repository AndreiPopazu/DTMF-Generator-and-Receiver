clear                                           %sterge toate variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda
syms t x y;                                     %definirea variabilelor ca simboluri
x = sin(t)/t;
y = int(x.^2)                                   %functie de integrare int(expresie)

figure 
subplot(211)
ezplot(x,[0,2*pi])                              %afiseaza graficul functiei x in intervalul stabilit
grid on
hold on
subplot(212)
ezplot(y,[0,2*pi])
grid on
