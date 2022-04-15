%DTMF-Dual Tone Multi-Frequency
clear
close
clc

DTMF_keypad=[{'1'} {'2'} {'3'} {'A'}; 
             {'4'} {'5'} {'6'} {'B'};
             {'7'} {'8'} {'9'} {'C'};
             {'*'} {'0'} {'#'} {'D'}];
low_freq=[697 770 852 941];
high_freq=[1209 1336 1477 1633];
Fs=8000;            %frecventa de esantioare
Ts=1/Fs;            %perioada de esantionare
fNy=Fs/2;           %frecventa Nyquist toate componentele importante ale 
                    %frecventei se gasesc pana la frecventa nyquist
switch(duration)
    case '1': DTMF(0.1)
              
    case '2': DTMF(0.5)
              
    case '3': DTMF(1)
              
end
%T=1;                %perioada semnalului
function [] = DTMF(T)
t=0:Ts:T-Ts;        %vector de timp
N=length(t);        %numar de esantioane

%BLOC MODELARE SEMNAL DTFM
prompt= 'Apasati o tasta:';
key=input(prompt,'s');
for i = 1:1:4
    for j = 1:1:4
       if strcmp(key,DTMF_keypad(i,j))  
           signal=sin(2*pi*low_freq(i).*t)+sin(2*pi*high_freq(j).*t);
           %sound(signal,Fs);
           figure(1)
           plot(t,signal)
           grid on
           axis([0 0.01 -2 2]),xlabel("Timp"),ylabel("Amp"),title("Analiza in domeniul timp")
       end
    end
end

%BLOC DECODARE SEMNAL DTFM
%Analiza in domeniu Frecventa
N=0.5*8000
f=0:Fs/N:Fs-Fs/N;   %vectorul frecventelor

%fft=2*abs(fft(signal))/N;
%figure(2)
%plot(f,fft)
%grid on
%xlim([0 fNy]),xlabel("Freq"),ylabel("Amp"),title("FFT")

goertzel=2*abs(goertzel(signal))/N;
figure(3)
plot(f,goertzel)
grid on
xlim([0 fNy]),xlabel("Freq"),ylabel("Amp"),title("Goertzel")

%Identificare frecventelor tastei apasate
freq_comp=[-1 -1];
k=1;
for i = 1:1:length(goertzel)/2
    if goertzel(i)> 0.1
        freq_comp(k)=f(i);
        k=k+1;
    end
end

%Cautarea in matrice a tastei pe baza indiciilor frecventelor
i=1;
while(low_freq(i)~=freq_comp(1))
   i=i+1;
end
j=1;
while(high_freq(j)~=freq_comp(2))
   j=j+1;
end
display("Tasta apasata:" + DTMF_keypad(i,j)) %afisarea tastei apasate
end
