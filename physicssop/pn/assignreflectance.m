function [ reflectance ] = assignreflectance( wav,Reflection,wavelengthnm )
%ASSIGNREFLECTANCE Summary of this function goes here
%   Detailed explanation goes here


[a,b,c]=binsearchdatatable(wavelengthnm,wav);
if a==0
      
    reflectance=((Reflection(c)-Reflection(b))/(wavelengthnm(c)-wavelengthnm(b)))*(wav-wavelengthnm(b))+Reflection(b);
else
   reflectance=Reflection(b);
end

%reflectance

end

