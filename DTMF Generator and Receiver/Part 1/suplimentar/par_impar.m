function [V1,V2] = par_impar(M)
%PAR_IMPAR Functie care primeste o matrice M si salveaza elementele impare
%ale matricii in vectorul V1 si elementele pare ale matricii in vectorul V2
[m,n] = size(M);                 %functia size intoarce in variabila 'm' nr de linii si in 'n' nr de coloane al matricii M
k=1;                             %initializare contori cu 1
l=1;
V1 = [];
V2 = [];
for i = 1:m   
    for j = 1:n
        if mod(M(i,j),2) ~= 0
            V1(k) = M(i,j);      %vectorul cu valori impare
            k = k + 1;
        else
            V2(l) = M(i,j);      %vectorul cu valori pare
            l = l + 1;
        end
    end
end
end

