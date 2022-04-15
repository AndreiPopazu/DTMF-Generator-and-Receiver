clear
close
clc

pas = 1/1000;
limita=2;
t=-limita:pas:limita;
t0 = 0; %deplasarea porÈ›ii
A = 1;
x = poarta(-A/2,A/2,1,t-t0);
figure(1)
plot(t,x)
xlabel('t [s]')
ylabel('Amplitudinea [V]')
k=10;
omega = -k*pi/A:1/10:k*pi/A;
X = zeros(1,length(omega));
for i=1:length(omega)
 X(i) = quad(@(t)poarta(-A/2,A/2,1,t-t0).*exp(-1i*omega(i)*t),-10,10);
 re = real(X(i));
 im = imag(X(i));
 if abs(re)<10^-10
 re = 0;
 end
 if abs(im)<10^-10
 im = 0;
 end
 X(i) = re+1i*im;
end
figure(2);
subplot(2,1,1);
plot(omega/(2*pi),abs(X)), title('Parte reala');
xlabel('[Hz]');
subplot(2,1,2);
plot(omega/(2*pi),angle(X)), title('Parte imaginara');
xlabel('[Hz]'); 
figure(3);
plot3(omega,real(X),imag(X));
xlabel('Frecventa unghiulara');
ylabel('Partea reala');
zlabel('Partea imaginara');
%%% esantionare semnale poarta
T=0.09;
N=limita/T;
for n=-N:N
 xd(n+N+1)=poarta(-A/2,A/2,1,n*T);
end
%x reprezeninta varianta discreta a semnalului de tip poarta
%obtinut prin esantionare
X=fft(xd);
n=-N:N;
figure, stem(n*T,xd);
hold on
plot(t,x,'r-');
hold off
legend('Poarta discreta', 'Poarta analogica');
title('Comparatie poarta analogica vs. poarta discreta');
xlabel('t [s]');
ylabel('Amplitudinea [V]');
freq=n/(N*2*T);
figure, plot(freq,2*fftshift(abs(X)/N));
hold on
stem(freq,2*fftshift(abs(X)/N),'r');
xlabel('[Hz]');
title('Spectru discret al portii discrete');
legend('TFTD', 'TFD');
hold off
function y = poarta( a ,b, amp, t)
% functia returneaza o treapta in intervalul [a,b],conform cu baza de timp
% t
y = zeros(1,length(t));
for i=1:length(t)
 if t(i)>=a && t(i)<=b
 y(i) = amp;
 end
end
end
