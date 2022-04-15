%Convolutia a doua semnale dreptunghiulare de perioade diferite este un
%semnal sub forma de trapez ,deplasand semnalul negru pe axa timpului se
%observa ca atunci cand incepe sa se suprapuna cu semnalul albastru se
%obtine o rampa crescatoare, atunci cand semnalul negru este suprapus 
%perfect peste semnalul albastru obtinem o dreapta, iar atunci cand 
%semnalul negru depaseste incepe sa depaseasca semnalul albastru in urma 
%convolutiei rezulta o rampa descrescatoare
clc
clear

tstart = 0;
tstop = 0.1;
tpas = 0.0001;

t = tstart : tpas : tstop;
x = ones(1,1001);

subplot(3,1,1);
plot( t, x, 'b', 'linewidth',3);
axis([0, 0.15, 0, 1.2]);
grid on;

t1 = tstart : tpas : tstop/2;
h = ones(1,501);

subplot(3, 1, 2);
plot( t1, h, 'k', 'linewidth',3);
axis([0 0.15 0 1.2]);
grid on;

t2 = 1.5*tstart : tpas : 1.5*tstop;
y = conv(x, h) * tpas;

subplot(3, 1, 3);
plot( t2, y, 'r', 'linewidth', 2);
axis([0 0.15 0 0.12]);
grid on;
