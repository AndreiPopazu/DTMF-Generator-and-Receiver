clear                                           %sterge variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda
x = linspace(-1, 2.5 ,2000);
f = 0;
m = 0;
figure(1);
 for n = 1:2:7
    m = m + 1;
    T = 2 * (1 / 1);
    fs = 1000;
    t = -T / 2:1 / fs:T / 2-1 /fs;
    s = sawtooth(2 * pi * 1 * t - pi, 1 / 2);
    f = f + (2*(10*sin(pi*n) - 10*n*pi*cos(pi*n)))/(n^2*pi^2);
    error = mean((abs(f) - abs(s)) .^ 2);
    
    subplot(4, 1, m), 
    plot(t, s, 'r', 'linewidth', 2)
    hold on;
    subplot(4, 1, m), 
    plot(x, f, 'k', 'linewidth', 2)
    title(['n = ', num2str(n), ' Eroare = ', num2str(error)]), 
    grid
 end