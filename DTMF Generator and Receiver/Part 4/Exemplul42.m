% Calculul transformatei Fourier in timp discret
clear all;
xn = ones(1,10); % semnalul x[n]
puteri=linspace(0,9,10); %puterile exponentialei din formula transformatei Fourier in timp discret (n)
Omega = [-0.1:0.01:1.1]*2*pi; %vectorul 'Omega' necesar calcului transformatei Fourier în timp discret
TFTD= sum(exp(-1i*puteri'*Omega),1); %transformata fourier în timp discret
%TFTD = sin(5*Omega)./sin(0.5*Omega).*exp(-1i*4.5*Omega); %transformata
%fourier în timp discret metoda alternativa de calcul folosind
%proprietatile seriilor in progresie geometrica
% Grafic
figure(1)
subplot(211);
plot(Omega,abs(TFTD)); grid;
axis([-0.2*pi,2.2*pi,-1,11]);
xlabel('\Omega (rad)');
ylabel('Amplitudine')
subplot(212)
plot(Omega,angle(TFTD)); grid;
axis([-0.2*pi,2.2*pi,-pi,pi]);
xlabel('\Omega (rad)');
ylabel('Faza (rad)');