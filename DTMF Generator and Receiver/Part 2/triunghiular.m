function x=triunghiular(t)
global P D
tmpp=abs(mod(t,P)); tmpn=abs(mod(-t,P)); tmp=min(tmpp,tmpn);
x=(tmp<=D).*(1-tmp/D);
end