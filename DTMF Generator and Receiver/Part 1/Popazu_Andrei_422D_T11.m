clear                                           %sterge toate variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda
                                                %zona de initializare a variabilelor
z = 1 - 1i;                                     
x = 1;
y = 0;
w = 2.7182;
v1 = [1,2,3];
v2 = [4,5,6];
v3 = 7:1:9;
v4 = linspace(1,10,20);                         %linespace() defineste un vector cu 20 de elemente generate uniform de la val 1 la 10
M1 = [];
M2 = [v1;v2];
M3 = ones(3,4);                                 %ones() initializeaza o matrice cu toate elementele egale cu 1
M4 = zeros(4,3);                                %zeros() initializeaza o matrice cu toate elementele egale cu 0
M5 = eye(3,3);                                  %eye() initializeaza o matrice cu 1 pe diagonala principala si zero in rest


modul = abs(z);                                 %abs functia modul
faza = angle(z);                                %angle() functie care calculeaz faza unui nr complex
conjugata = conj(z);                            %conj() functie care intoarce conjugata unui nr complex
part_imag = imag(z);                            %imag() functie care intoarce partea imaginara a unui nr complex
part_real = real(z);                            %real() functie care intoarce partea reala a unui nr complex

invers_cos = acos(x);                           %///////////
invers_sin = asin(x);
invers_tan = atan(x);                           %inversele functiilor trigonometrice
invers_cosh = acosh(x);
invers_sinh = asinh(x);
invers_tanh = atanh(x);                         %///////////
cos = cos(y);                                   %///////////
sin = sin(y);
tan = tan(y);                                   %functiile trigonometrice
cosh = cosh(y);
sinh = sinh(y); 
tanh = tanh(y);                                 %///////////

exp = exp(w);                                   %exp() functia exponentiala
ln = log(w);                                    %log() functia logaritm natural
lg = log10(w);                                  %log10() functia logaritm in baza 10
intreg_sup = ceil(w);                           %ceil() functie care intoarce partea intreaga superioara a unui numar
intreg_inf = floor(w);                          %floor() functie care intoarce partea intreaga inferioara a unui numar
rot_zero = fix(w);                              %fix() functie care rotunjeste la cel mai apropiat intreg de zero
rot_int = round(w);                             %round() functie care rotunjeste la cel mai apropiat intreg

vec_produs = v1.*v2;                            %produsul elementelor primului vector cu cele din al doilea vector
vec_raport = v1./v2;                            %raportul elementelor primului vector cu cele din al doilea vector
vec_putere = v1.^v2;                            %produsul elementelor primului vector cu cele din al doilea vector
vec_transpusa = v1';                            %transpusa vectorului/matricii
vec_conjugata = v1.';

[linii,coloane] = size(M2);                     %size() functia intoarce nr de linii si de coloane ale unei matrici
lungime = length(v1);                           %length() functia intoarce lungimea unui vector

pause(1);                                       %pause() functia care face o pauza de n secunde

figure;                                         %figure creeaza o figura pentru afisarea unui grafic
plot(v1,v2);                                    %plot() functie care genereaza un grafic continuu prin punctele celor doi vectori
grid on;                                        %grid afiseaza o grila peste figura graficului
xlabel("v1");                                   %denumirea axei x
ylabel("v2");                                   %denumirea axei y
title("Grafic");                                %titlul figurii
legend ("f(v1)=v2");                            %legenda figurii

hold on;                                        %hold on afiseaza graficul nou peste cel anterior si off noul grafic va fi desenat in locul graficului vechi
stem(v1,v2,'r');                                %stem() functie care genereaza un grafic discret cu punctele celor doi vectori
grid on;
axis([0 4 0 7]);                                %limitele axelor x 0 4 si y 0 7

figure;
subplot(2,1,1);                                 %subplot functie care creeaza o subfigura in interiorul aceleasi figuri
plot(v2,v3);                                       
subplot(2,1,2);
plot(v1,v3);
save('tema.mat');                               %save() functie care salveaza datele din workspace in fisierul tema.mat
clear
load('tema.mat');                               %load() functie care incarca datele din fisierul tema.mat in workspace
help save                                      %help functie care descrie modul de funtionare a altei functii
pwd                                            %pwd functie care afiseaza numele directorului curent
%cd E:\Lab_SP\LAB1                              %cd functie care
%u = input("Introduceti u>>");                  %imput() functie care citeste o valoare de la tastatura

%completare:
whos
vector=1:1:9;
for i=1:1:9
   if vector(i)<5
      vector(i)=10-vector(i); 
   end
end
vector(1,:)
i=1;
while i<10
   vector(i)=vector(i)^2; 
   i=i+1;
end
vector(1,1:5)