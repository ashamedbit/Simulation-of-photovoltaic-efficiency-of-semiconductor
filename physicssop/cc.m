function  cc( Reflection,wavelengthnm,bandgap)
%wav in nm
%intensity in W/cm^s
intensity=zeros(1,1000);
noofcarriers=zeros(size(intensity));
threshhold=bandgapwavelength(bandgap);
start=min(threshhold,300);

%wavdata=struct('wavelength',[],'intensity',[],'number_of_charge_carriers',[]);

for i=1:1000
    disp(i)
intensity(1,i)=i;
chargecarriers=0;
x=1;

        for wav=start:x:1000
            %noofphotons=i*10^6*5.0314465*10^24*wav*10^(-9);

            reflectance=assignreflectance(wav,Reflection,wavelengthnm);
            finalintensity=(1-reflectance)*i;

            wavelengthcarriers=netcharge(finalintensity,wav,bandgap );
            chargecarriers=chargecarriers+wavelengthcarriers*x;

        end
          noofcarriers(1,i)=chargecarriers;
end
line(intensity,noofcarriers);

end

