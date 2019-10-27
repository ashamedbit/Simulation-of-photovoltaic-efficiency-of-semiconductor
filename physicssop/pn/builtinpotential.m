function [ V ] = builtinpotential(T,ni,Nd,Np )

q=1.6*10^-19;
k=1.6*10^-19*8.617332478*10^-5;
V=(k*T/q)*(log((Nd*Np)/(ni*ni)));


end