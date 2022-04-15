function M = matrice_unitate(m,n)
%matrice_unitate Functie care creeaza matricea unitate
%   Creeaza o matrice care are cifra 1 pe coloana principala
M = zeros(m,n);
for i = 1:n
    for j = 1:m
       if i == j
          M(i,j) = 1; 
       end
    end  
end
end

