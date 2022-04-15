clear
close
clc
syms a n z w0

xn1=1;
transfz1=symsum(xn1*z^(-n),n,0,inf);
pretty(transfz1)

xn2=-1;
transfz2=symsum(xn2*z^(-n),n,-inf,-1);
pretty(transfz2)

xn3=n;
transfz3=symsum(xn3*z^(-n),n,0,inf);
pretty(transfz3)

xn4=a^n;
transfz4=symsum(xn4*z^(-n),n,0,inf);
pretty(transfz4)

xn5=-a^n;
transfz5=symsum(xn5*z^(-n),n,-inf,-1);
pretty(transfz5)

xn6=1;
transfz6=symsum(xn6*z^(-n),n,0,inf);
pretty(transfz6)

xn7=cos(w0*n);
transfz7=symsum(xn7*z^(-n),n,0,inf);
pretty(transfz7)

xn8=sin(w0*n);
transfz8=symsum(xn8*z^(-n),n,0,inf);
pretty(transfz8)

xn9=a^n*cos(w0*n);
transfz9=symsum(xn9*z^(-n),n,0,inf);
pretty(transfz9)

xn10=a^n*sin(w0*n);
transfz10=symsum(xn10*z^(-n),n,0,inf);
pretty(transfz10)