function [ I ] = saturationcurrent( diffcons,ND,A,ni ,tp,Vopen,T,bandgap)
%SATURATIONCURRENT Summary of this function goes here
%   Detailed explanation goes here

q=1.6*10^-19;
kb=8.617330350*10^-5;

pn0=(ni*ni)/ND;
Lp=(diffcons*tp)^(0.5);
Js=(q*diffcons*pn0)/Lp;

Is=Js*A;

exponent=(Vopen)/(kb*T);
texponent=(bandgap/(kb))*((1/300)-(1/T));


I=Is*((2.71828)^(exponent)-1)*(T/300)^3*(2.71828)^(texponent);




end

