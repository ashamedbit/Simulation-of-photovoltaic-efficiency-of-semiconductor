function [ chargecarriers ] = netcharge(intensity, wav,bandgap,length,surfacerecombinationtime)
%ALLWAVELENGTH Summary of this function goes here
%   Detailed explanation goes here
%bandgap in ev
%wav in nm
%B in terms of cm^-1
%proportionality constant k(dont know units)
%h – Planck’s constant (4.135667516(91)×10?15 eV s)
%c – speed of light (299.79 *10^8 m s-1)
%k= 10^5cm^-1
%http://www.uwyo.edu/cpac/_files/docs/kasia_lectures/3-opticalproperties.pdf
%ng=quantum coeffecient
ng=1;
B=25000;
k=1;
e=2.71828;
alpha=k*B*((((6.625*10^-34*3*10^8)/wav)*10^9*6.25*10^18-bandgap)^2);

energyofphoton=((6.625*10^-34*3*10^8)/wav)*10^9;
chargecarriers=ng*(intensity/(energyofphoton))*(1-e^(-length*alpha))*(surfacerecombinationtime/alpha);


end

