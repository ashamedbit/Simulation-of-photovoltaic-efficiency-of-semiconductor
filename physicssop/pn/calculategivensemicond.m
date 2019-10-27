function [chargecarriers,surfacetime]=  calculategivensemicond(bandgap,intensity,Reflection,wavelengthnm,length,densityofsurfacestates,efactor,hfactor,capturecrosssection,n0)
%wav in nm
%intensity in W/cm^s



        
        surfacetime=surfacerecombination(densityofsurfacestates,efactor,hfactor,capturecrosssection,length);

        threshhold=bandgapwavelength(bandgap);
        endwav=min(threshhold,1000);

  
    chargecarriers=0;
    x=1;

            for wav=300:x:endwav
                %noofphotons=i*10^6*5.0314465*10^24*wav*10^(-9);

                reflectance=assignreflectance(wav,Reflection,wavelengthnm);
                finalintensity=(1-reflectance)*intensity;

                wavelengthcarriers=netcharge(finalintensity,wav,bandgap,length,surfacetime );
                chargecarriers=chargecarriers+wavelengthcarriers*x;

            end
         
          %   time=surfacetime+radiativerecombination(n0, n0,chargecarriers );
            
 
end

