function [ lifetime ] = radiativerecombination(n0, p0,deltan )
% radiativerecombination  Summary of this function goes here
%   Detailed explanation goes here
%   lifetime gives rate of recombination
B=0.5;
%deltan=n-n0;
%deltap=p-p0;
lifetime=1/(B*(n0+p0+deltan));

%U=B*(n*p-ni*ni);


end

