function x=dreptunghiular(t)
global P D
tmp=min(abs(mod(t,P)),abs(mod(-t,P)));
x=(tmp<=D/2);
end