%Nota:        DO4      RE4      MI4      FA4     SOL4      LA4      SI4      DO5
%Frecventa: 261.63   293.66   329.63   349.23   392.00   440.00   493.88   523.25    https://pages.mtu.edu/~suits/notefreqs.html
clear                                    %sterge toate variabilele din zona lor de stocare
clc                                      %sterge textul din fereastra de comanda

f = 440.00;                              %frecventa notei
A = 0.1;                                 %amplitudinea semnalului

FS = 50000;                              %frecventa de esantionare
t = 0:1/FS:2;                            %generarea vectorului de timp
nota = A*sin(2*pi*f*t);                  %generarea semnalului audio
audiowrite("nota.wav",nota,FS)           %functie de crare a unui fisier audio functie de (nume,semnalul audio,rata de esantionare)
[sunet, FS1] = audioread("nota.wav");    %citeste un fisier audio in vectorul sunet cu frecventa de esantionare FS 
sound(sunet,FS1)                         %functie care timite un semnal audio de frecventa FS catre difuzor
plot(t(1:1000),sunet(1:1000))