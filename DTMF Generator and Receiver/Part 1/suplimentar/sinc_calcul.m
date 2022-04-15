function rezultat = sinc_calcul(n,t)
%sinc_calcul Functia calculeaza expresia din fisierul sinc_calcul.m in
%functie de parametrii n si t
rezultat = 0; 
for k = 1:n
    rezultat = rezultat + sin((2*k-1)*t)/(2*k-1);
end
end

