function M = schimbare_element(M,vechi,nou)
%SCHIMBARE_ELEMENT Functia primeste matricea M impreuna cu elementul vechi
%si cel nou si inlocuieste elementul vechi peste tot in matrice cu
%elementul nou si intoarce noua matrice
[m,n] = size(M);    %functia size intoarce in variabila 'm' nr de linii si in 'n' nr de coloane al matricii M
for i = 1:m   
    for j = 1:n
        if M(i,j) == vechi
            M(i,j) = nou;
    end
end
end

