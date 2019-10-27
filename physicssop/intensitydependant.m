function [data]=  intensitydependant(intensity,Reflection,wavelengthnm,length)
%wav in nm
%intensity in W/cm^s
bandgaparray=zeros(1,31);
noofcarriers=zeros(size(bandgaparray));
time=zeros(size(bandgaparray));
realbandgap=[ 1.1 ,1.35 ];
n0array=[10^10 10^10];
division=1;

for i=1:size(realbandgap,2)-1
    division=[division (realbandgap(1,i)+realbandgap(1,i+1))/2];
end
division=[division 4];

densityofsurfacestatesarray=[1.4*10^14  1.4*10^14];
efactorarray=[0.19 0.4];
hfactorarray=[0.58 7.9];
capturecrosssectionarray=[2.4*10^-15  2.4*10^-15];

wavdata=struct('bandgap',[],'wavelength',[],'intensity',[],'number_of_charge_carriers',[]);
index=1;
part=1;

while(part<size(division,2))

    for i=division(part):0.1:division(part+1)
        disp(i)
        densityofsurfacestates=densityofsurfacestatesarray(1,part);
        efactor=efactorarray(1,part);
        hfactor=hfactorarray(1,part);
        capturecrosssection=capturecrosssectionarray(1,part);
        n0=n0array(1,part);
        
      %  time(1,index)=surfacerecombination(densityofsurfacestates,efactor,hfactor,capturecrosssection,length);

        threshhold=bandgapwavelength(i);
        endwav=min(threshhold,1000);

    bandgaparray(1,index)=i;
    chargecarriers=0;
    x=1;

            for wav=300:x:endwav
                %noofphotons=i*10^6*5.0314465*10^24*wav*10^(-9);

                reflectance=assignreflectance(wav,Reflection,wavelengthnm);
                finalintensity=(1-reflectance)*intensity;

                wavelengthcarriers=netcharge(finalintensity,wav,i,length );
                chargecarriers=chargecarriers+wavelengthcarriers*x;
                wavdata=[wavdata struct('bandgap',i,'wavelength',wav,'intensity',finalintensity,'number_of_charge_carriers',wavelengthcarriers)];

            end
             noofcarriers(1,index)=chargecarriers;
             time(1,index)=time(1,index)+radiativerecombination(n0, n0,chargecarriers );
             index=index+1;
    end
    part=part+1;
end
line(bandgaparray,noofcarriers);

data=wavdata;
end

