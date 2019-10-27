function [ VOC ] = opencircuit(T,Na,delta,ni)

q=1.6*10^-19;
k=1.6*10^-19*8.617332478*10^-5;
VOC=(k*T/q)*(log((Na+delta)*delta/(ni*ni)));

end

