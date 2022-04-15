clc;
clear all;
close all;

tstart=0;
tstop=0.1;
tpas=0.0001;
f=2;

t=tstart:tpas:tstop;
x=10*t;
figure(2)
subplot(3,1,1);
plot(t,x,'linewidth',3);
axis([0 0.1001 0 1]);grid;

h=1*exp(-f*t);

subplot(3,1,2);
plot(t,h,'linewidth',3);
axis([0 0.1001 0 1]);grid;

t2=2*tstart:tpas:2*tstop;
y=conv(x,h)*tpas;

subplot(3,1,3);
plot(t2,y,'linewidth',2);
axis();grid;

%Pentru o variatie mai lina a exponentialei putem reduce frecventa.
%Observam ca zona de convolutie maxima este ascutita din cauza ca avem un semnal
%crescator si unul descrescator. 
%Raspunsul convolutiei are amplitudinea mult mai mare si inmultim cu tpas
%pentru a avea valori convenabile.