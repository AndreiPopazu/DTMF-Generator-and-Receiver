%Dupa compararea celor 3 spectre obtinute pentru sinusul cu frecventa de
%10hz si esantionat in cele trei cazuri cu 20hz 100hz si respectiv de 7hz 
%se poate observa ca semnalele esantionate cu 20hz si 7hz nu pot fi 
%reconstruite ca in cazul celui de frecventa 100hz deoarece conform
%teoremei Nyquist-Shannon un semnal poate fi reconstruit fara a se pierde
%informatie daca frecventa de esantionare este cel putin egala cu dublul 
%frecventei maxime din spectul semnalului analogic. Frecventa sinusului
%fiind de 10Hz inseamna ca frecventa limita de esantionare ar fi 20Hz in
%cazul careia sinusul este reconstruit ca o dreapta, in cazul esantionarii
%cu 7Hz are loc o subesantionare iar la 100Hz este indeplinita teorema lui
%Shannon semnalul fiind reconstruit ca o sinusoida.
%banda unui semnal cu suport finit(poarta) este reprezentata printr-un
%spectru continuu in timp ce banda unui semnal cu suport infinit(sinus)
%este reprezentata printr-un spectru discret
clear
close
clc

pas = 1/1000;
limita=2;
t=-limita:pas:limita;

fsin=10;

x = sin(2*pi*fsin*t);
figure(1)
plot(t,x)
xlabel('t [s]')
ylabel('Amplitudinea [V]')

k=10;
omega = -k*pi/1:1/10:k*pi/1;
X=zeros(1,length(omega));
for i=1:length(omega)
 X(i) = quad(@(t)sin(2*pi*fsin*t).*exp(-1i*omega(i)*t),-10,10);
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



%%% esantionare semnale sin
T=[1/20,1/100,1/7];
for i=1:1:length(T)
 figure(3)
 N=limita/T(i);
 for n=-N:N
  xd(n+N+1)=sin(2*pi*fsin*n*T(i));
 end
 %x reprezeninta varianta discreta a semnalului de tip sin
 %obtinut prin esantionare
 X=fft(xd);
 n=-N:N;
 subplot(length(T),1,i) 
 stem(n*T(i),xd)
 hold on
 legend('Sinus discret', 'Sinus analogic')
 title(['Comparatie sinus analogic vs sinus discret discret ',num2str(1/T(i)),'Hz'])
 plot(t,x,'r-')
 xlabel('t [s]')
 ylabel('Amplitudinea [V]')
 xlim([0 0.5])
 xd=[]; %golesc vectorul de valorile de la punctul tocmai executat
 
 figure(4)
 freq=n/(N*2*T(i));
 subplot(length(T),1,i) 
 plot(freq,2*fftshift(abs(X)/N))
 hold on
 stem(freq,2*fftshift(abs(X)/N),'r')
 xlabel('[Hz]')
 title(['Spectru discret al sinus Fs=',num2str(1/T(i)),'Hz'])
 legend('TFTD', 'TFD')
end