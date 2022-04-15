%Valoarea de la linia 23 se inmulteste cu tpas pentru a reduce amplitudinea
%semnalului obtinut in urma convolutiei.
%In urma convolutiei se obtine prin deplasarea semnalului dreptunghiular pe
%axa timpului ca la inceputul suprapunerii cu semnalul exponential
%o rampa crescatoate pana in momentul cand semnalele sunt suprapuse
%perfect in punctul de maxim dupa care prin continuarea deplasarii si obtine
%o scadere exponentiala pana in 0 cand semnalul dreptunghiular depaseste
%semnalul exponential
%Pentru obtinerea unei variatii mai line pentru exponentiala se poate
%micsora f;
clc
clear

tstart = 0;
tstop = 0.1;
tpas = 0.0001;
f = 100;

t = tstart : tpas : tstop;
x = 10*t;

subplot(3,1,1);
plot( t, x, 'linewidth',2);
axis([0, 0.1001, 0, 1]);
grid on;

h = 1 * exp(-f*t);

subplot(3, 1, 2);
plot( t, h, 'linewidth',2);
axis([0 0.1001 0 1]);
grid on;

t2 = 2*tstart : tpas : 2*tstop;
y = conv(x, h) * tpas;

subplot(3, 1, 3);
plot( t2, y, 'r', 'linewidth', 2);
grid on;