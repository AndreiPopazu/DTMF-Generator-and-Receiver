function V = suma_linii(M)
%SUMA_LINII Functie ca intoarce un vector cu suma liniilor matricii M
[m,n] = size(M);               %functia size intoarce in variabila 'm' nr de linii si in 'n' nr de coloane al matricii M
V = 1:m;                       %alocarea unui vector cu m elemente
for i = 1:m   
    V(i)=0;                    %initializez elementul i al vectorului cu 0 pentru suma
    for j = 1:n
        V(i) = V(i) + M(i,j);  %suma elementelor de pe linia i
    end
end
end

