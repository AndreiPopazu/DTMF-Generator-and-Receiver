clear
clf

N =32;          % nr de esantioane

T=4;
Ts = T/N;       % perioada de esantionare raportata la T secunde
fs = 1/Ts;      % frecventa de esantionare
df = fs/N;      % rezolutia în domeniul frecventa (cat de departate sa fie frecv intre ele)
n = [0:N-1]';   % vectorul coloana indicilor esantionati de timp
t = Ts*n;       % vectorul valorilor timpului la momentele de esantionare
f = 9-(t-3).^2;
x = f.*(t>0 & t<3); % vectorul valorilor functiei în momentele de esantionare.
X = Ts*fft(x);  % transformata fourier discret
k = [0:N/2-1]'; % valorile indicelui freceventelor

%Graficele
subplot(3,1,1)
plot(t,x,"k","LineWidth",2) 
xlabel("Timpul, t (s)")
ylabel("x(t)")
grid on

subplot(3,1,2)
plot(k*df,abs(X(1:N/2)),"k","LineWidth",2)
xlabel("Frecventa, f (Hz)") 
ylabel("|X(f)|")
grid on

subplot(3,1,3)
plot(k*df,angle(X(1:N/2)),"k","LineWidth",2)
grid on
xlabel( "Frecventa, f (Hz)")
ylabel("Faza X(f)")