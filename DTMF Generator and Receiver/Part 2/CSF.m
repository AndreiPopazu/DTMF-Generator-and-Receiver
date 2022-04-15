% Functie de determinare a Coeficienților Seriei Fourier
function [Xk,kk,xht,tt]=CSF(x,P,N,nrfig)
% Functie de determinare a Coeficienților Seriei Fourier.
% x – nume sub forma de string a functiei ce implementeaza semnalul periodic
% pentru care se vor calcula Coeficieníi Seriei F
% P – perioada semalului
% N – numarul de Coeficienti ai Seriei F ce vor fi folosti pentru
% reconstructia semnalului
% nrfig – numarul de subfiguri in acelasi grafic
% Xk – vectorul coeficientilor seriei fourier
% kk – indexul necesar pentru reconstructia semnaului initial
% xht – semnalul initial recenstruit cu ajutorul coeficientilor
% tt - indexul necesar pentru semnalul in domeniul timp 

if nargin<4, nrfig=221; end
if nargin<3, N=10; end %daca nr argumente pt CTFS este mai mic de 3 N=10
kk=[-N:N]; w0=2*pi/P; %se definesc indexul kk si frecvená unghiulara
T=2*P; tt=[-T:T/100:T]; %se vor vizualiza doua perioade negative si doua perioade positive
xejkw=[x '(t).*exp(-j*k*w0*t)']; %se defineste un string de forma ‘x(t).*exp(-j*k*w0*t)’
xejkwt=inline(xejkw,'t','k','w0'); %se defineste o functie cu parametrii t,k,w0
tol=0.001; %o toleranta
for k=0:N
 X(k+1)=quadl(xejkwt,-P/2,P/2,tol,[],k,w0); %calculul integralei pentru definirea coeficientilor seriei Fourier folosind formula din cap 2.1
end
Xk =[conj(X(N+1:-1:2)) X]; %spectrul simetric

X_mag= abs(Xk); %Xph= angle(Xk); % modulul si faza
k=1:N; jkw0t=j*k.'*w0*tt;
xht=(2*real(X(k+1)*exp(jkw0t))+X(1))/P; % Semnalul reconstruit folosind formula din cap 2.1
xt=feval(x,tt); %semnalul initial 
subplot(nrfig),plot(tt,xt,'k-', tt,xht,'b:')
set(gca,'fontsize',9), %set(gca,'XLim',[-T T])
axis([tt([1 end]) -0.2 1.2]), title('x(t)(linie solida) si reconstructia folosind N coeficienti (linie punctata)')
subplot(nrfig+1),stem(kk,X_mag,'MarkerSize',5,'LineWidth',1),
set(gca,'fontsize',9)
axis([kk([1 end]) -0.2 1.2]), title('Spectrul lui x(t)')
end