% Calculul transformatei Fourier folosind 32 de esantioane in intervalul
% 0-2 secunde
clear all ; clf
N = 32 ; % nr de esantioane pt esantionarea semnalului pt cele 2 secunde
Ts = 3/N ; % perioada de esantionare raportata la 2 secunde
fs = 1/Ts ; % frecventa de esantionare
df = fs/N ; % rezolutia în domeniul frecventa
n = [0:N-1]' ; % vectorul coloana indicilor esantionati de timp
t = Ts*n ; % vectorul valorilor timpului la momentele de esantionare
x = t.*(1-t).*(sign(t)-sign(t-1))/2; % vectorul valorilor functiei în momentele de esantionare.
X = Ts*fft(x) ; % transformata fourieri discret
k = [0:N/2-1]' ; % valorile indicelui freceventelor
%X = fftshift(Ts*fft(x)) ; %folosit pentru a afisa tot spectrul semnalului
%k = [-N/2:N/2-1]'; % folosit impreuna cu fftshift
%Graficele
subplot(3,1,1) ;
p = plot(t,x,"k") ; set(p,"LineWidth",2) ; grid on ;
xlabel("Timpul, t (s)") ; ylabel("x(t)") ;
subplot(3,1,2) ;
p = plot(k*df,abs(X(1:N/2)),"k") ; set(p, "LineWidth",2) ; grid on;
%p = plot(k*df,abs(X(1:N/2)),"k") ; set(p, "LineWidth",2) ; grid on; %folosit impreuna cu fftshift
xlabel("Freceventa, f (Hz)") ; ylabel("|X(f)|") ;
subplot(3,1,3) ;
p = plot(k*df,angle(X(1:N/2)),"k") ; set(p,"LineWidth",2) ; grid on ;
%p = plot(k*df,angle(X(1:N/2)),"k") ; set(p,"LineWidth",2) ; grid on ; % folosit impreuna cu fftshift
xlabel( "Frecventa, f (Hz)") ; ylabel("Faza X(f)") ;