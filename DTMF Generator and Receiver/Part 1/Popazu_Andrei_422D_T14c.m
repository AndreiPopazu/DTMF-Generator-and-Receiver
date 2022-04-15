clear                                           %sterge variabilele din workspace
close                                           %inchide figura curenta
clc                                             %sterge textul din fereastra de comanda
t = [-2,-1, 0, 1.0, 2, 3, 4];                   %vector cu momentele de timp
x = [ 0, 0,-1, 1.5, 1, 0, 0];                   %vector cu pozitiile

%Reprezentarea grafica a semnalului prin puncte
subplot(2,1,1)
plot(t,x)
axis([-2 4 -1 1.5])
grid on

hold on

%Reprezentarea grafica a semnalului prin drepte
%(y-yA)/(yB-yA)=(t-tA)/(tB-tA)
t1=[-2,-1];
y1=0*t1;

t2=[-1,0];
y2=-t2-1;

t3=[0,1];
y3=(2.5*t3-1);

t4=[1,2];
y4=2-0.5*t4;

t5=[2,3];
y5=3-t5;

t6=[3,4];
y6=0*t6;

T=[t1,t2,t3,t4,t5,t6];
Y=[y1,y2,y3,y4,y5,y6];
subplot(2,1,2)
plot(T,Y)
axis([-2 4 -1 1.5])
grid on