clc
clear

tstart = 0;
tstop = 0.1;
tpas = 0.0001;

t = tstart : tpas : tstop;
x = ones(1,1001);

subplot(3,1,1);
plot( t, x, 'linewidth',3);
axis([-0.102, 0.212, 0, 1.2]);
grid on;

h = ones(1,1001);
subplot(3, 1, 2);
plot( t, h, 'linewidth',3);
axis([-0.102 0.212 0 1.2]);
grid on;

t2 = 2*tstart : tpas : 2*tstop;
y = conv(x, h) * tpas;

subplot(3, 1, 3);
plot( t2, y, 'r', 'linewidth', 2);
%axis([-0.102 0.312 0 0.12]);
grid on;

