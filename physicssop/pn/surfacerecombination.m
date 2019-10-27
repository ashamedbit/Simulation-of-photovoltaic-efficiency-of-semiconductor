function [time]= surfacerecombination(densityofsurfacestates,efactor,hfactor,capturecrosssection,length)

em=efactor*9.11*10^-31;
evth=(1.38*10^-23*300/em)^(0.5);

hm=hfactor*9.11*10^-31;
hvth=(1.38*10^-23*300/hm)^(0.5);

es=densityofsurfacestates*capturecrosssection*evth;
hs=densityofsurfacestates*capturecrosssection*hvth;

S=(es+hs)/2;
Dn=(1.38*10^-23*300/(1.6*10^-19))*700;


time=(((2*S)/length)+(1/Dn)*(length/pi)^2)^-1;

end

