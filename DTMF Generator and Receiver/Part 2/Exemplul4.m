clear, clf ,clc
global P D
N=10; % Nr de coeficienti fourier
D=1; 
P=2; 
CSF('dreptunghiular',P,N/2,221);
w0=2*pi/P; 
k1=linspace(-N/2,N/2);
RD1=sinc(k1*w0*D/2/pi); % Spectrul semnalului dreptunghiular
hold on, 
plot(k1,abs(RD1),':') % Anvelopa spectrului semnalului dreptunghiular
axis([-N/2 N/2 -0.2 1.2])
P=2; 
CSF('triunghiular',P,N/2,223);
w0=2*pi/P;
Tri=sinc(k1*w0*D/2/pi); 
Tri1=Tri.*Tri; % Spectrul semnalului triunghiular
hold on, 
plot(k1,Tri1,':') % Anvelopa spectrului semnalului triunghiular
axis([-N/2 N/2 -0.2 1.2])
