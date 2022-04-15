clear                                           %sterge variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda

figure(1)
m = 0;
for m = 1:1:4
   x = linspace(-pi, pi, 2000);
   fAll = [];
   t = [];
   s = [];
   n = 0;
   t1 = (n - 1) * pi:2 * pi /2000:n * pi - 2 * pi / 2000;
   s1 = zeros(1, 1000);
   t2 = n * pi:2 * pi / 2000:(n + 1) * pi - 2 * pi / 2000;
   s2 = t2 .^ 2;
   t = [t, t1, t2];
   s = [s, s1, s2];
   
   f = pi * pi / 6;
   NrArmonici = 4 * m;
   for q = 1:1:NrArmonici
      f = f + (2 * (-1) ^ q / q ^ 2) * cos(q * x) + (((-1) ^ q * (2 - q ^ 2 * pi ^ 2) - 2) / (q ^ 3 * pi)) * sin(q * x); 
   end
   fAll = [fAll, f];
   
   for n = 2:2:6
      t1 = (n - 1) * pi:2 * pi / 2000:n * pi - 2 * pi / 2000; 
      t2 = n * pi:2 * pi / 2000:(n + 1) * pi - 2 * pi / 2000;
      t = [t, t1, t2];
      s = [s, s1, s2];
      fAll = [fAll, f];
   end
   
   err = mean((abs(fAll) - abs(s)) .^ 2);
   subplot(4, 1, m), 
   plot(t, s, 'r', 'linewidth', 2);
   hold on;
   subplot(4, 1, m), 
   plot(t, fAll, 'k', 'linewidth', 2);
   title(['NrArmonici = ', num2str(NrArmonici), ' Eroare = ', num2str(err)]);
   grid;
end