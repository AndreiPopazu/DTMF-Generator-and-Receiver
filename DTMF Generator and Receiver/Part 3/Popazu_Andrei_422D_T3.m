%TF a prod conv este produsul transformatelor fourier ale celor doua
%semnale
clear
clc

syms t w

tstart = 0;
tstop = 0.1;
tpas = 0.0001;

f1(t) = 10*t;
f2(t) = 10*t;


fft1 = fourier(f1(t))
fft2 = fourier(f2(t))

fft = fft1 * fft2;

convolution = 2*pi*f1(t)*f2(t);



figure(1);
t = tstart : tpas : tstop;

subplot(3,1,1);
plot( t, f1(t), 'linewidth',2);
axis([-0.102, 0.212, 0, 1.2]);
grid on;

subplot(3, 1, 2);
plot( t, f2(t), 'linewidth',2);
axis([-0.102 0.212 0 1.2]);
grid on;

subplot(3, 1, 3);
fplot(convolution);
axis([-0.102 0.212 0 1.2]);%grid on;


