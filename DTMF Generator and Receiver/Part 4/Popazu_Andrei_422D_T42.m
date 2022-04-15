clear
clc

n1=-10:1:0;
n2=1:1:10;

xn1 = -log(-n1+1);   % semnalul x1[n]
xn2 = log(n2+1);     % semnalul x2[n]
%omega=2pi/T
T=20;
Omega = linspace(-1/T,1/T,21)*2*pi;  %vectorul 'Omega' necesar calcului transformatei Fourier în timp discret
TFTD = sum(xn1*exp(-1i*n1'*Omega),1)+sum(xn2*exp(-1i*n2'*Omega),1);  %transformata fourier în timp discret

% Grafic
figure(1)

subplot(311)
plot(xn1,n1,'-k',xn2,n2,'-k')
xlabel('x[n]')
ylabel('n')
grid on

subplot(312)
plot(Omega,abs(TFTD),'-k')
xlabel('\Omega (rad)')
ylabel('Amplitudine')
grid on

subplot(313)
plot(Omega,angle(TFTD),'-k')
xlabel('\Omega (rad)')
ylabel('Faza (rad)')
grid on