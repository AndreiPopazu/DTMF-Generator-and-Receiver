function [rezultat,k] = aprox_pi(eroare)
%APROX_PI Functie care aproximeaza pi cu eroarea minima 'eroare' eroare se
%introduce sub forma de procent
syms t s                        %declar simbolurile t si s
min = pi - (eroare/100)*pi;     %valoarea minima a rezultatului   
max = pi + (eroare/100)*pi;     %valoarea maxima a rezultatului
ok = 1;                         %variabila semafor initializata cu 1 'Adevarat'
k = -1;                         %initializez valoarea k cu -1 pentru ca urmeaza sa fie incrementata in bucla while
while ok == 1                   %bucla care se opreste cand variabila mea semafor ia valoarea 0 'Fals'
   k = k + 1;
   s = sqrt(12) * symsum( (((-3)^(-t))/(2*t+1)), t, 0, k); %calcul symbolic al expresiei, symsum() functie care intoarce suma seriei
   rezultat = double(s);        %double() functie care converteste valoare symbolic a lui s in valoare numerica pentru a fi comparata mai departe
   if(min <= rezultat && rezultat <= max) 
       ok = 0;                  %atunci cand valoarea rezultat se afla intre valorile min si max se considera o aproximare corecta si valoarea lui ok devine 1
   end
end
end

