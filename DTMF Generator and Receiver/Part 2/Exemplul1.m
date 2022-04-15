clear                                           %sterge variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda

x = linspace(0, 2.5, 2000);
%f = a0/2; ###############################
k = 0;

 %Semnalul dreptunghiular ideal
 X = [0, 0, 0.5, 0.5, 1, 1, 1.5, 1.5, 2, 2, 2.5, 2.5];
 Y = [0, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, 0];
 
 figure(1);
 f=0
 for n = 1:1:10 
    k = k + 1;
    f = f + (2*(10*sin(pi*n) - 10*n*pi*cos(pi*n)))/(n^2*pi^2); 
    error = mean((abs(f) - 1) .^ 2);
    
    subplot(3, 3, k), 
    plot(X, Y, 'color', 'r', 'linewidth', 2)
    hold on;
    subplot(3, 3, k), 
    plot(x, f, 'k', 'linewidth', 2)
    title(['n = ', num2str(n), ' Eroare = ', num2str(error)]), 
    grid
 end