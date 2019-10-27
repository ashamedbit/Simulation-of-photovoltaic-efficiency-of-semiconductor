function  graphvocintensityconstanttemp(Reflection,wavelengthnm)
bandgap=1.1;
dopingdensityn=10^16;
dopingdensityp=10^18;
ni=10^10;
densityofsurfacestates=1.4*10^14;
efactor=0.19;
hfactor=0.58;
capturecrosssection=2.4*10^-15 ;
diffcons=12;



temperature=300;
areaofjunction=10^-4;
currenttotal=zeros(4,91);
voltage=zeros(1,91);
VOCNarray=zeros(1,701);
intensityarray=zeros(1,701);

         p=holeconcentration(dopingdensityn,ni);
        e= econcentration(dopingdensityp,ni );


    intensityindex=1;
    for intensity=300:1000
       
       intensityarray(intensityindex)=intensity;
  
        v= builtinpotential(temperature,ni,dopingdensityn,dopingdensityp );
       [chargecarriers,time]=  calculategivensemicond(bandgap,intensity,Reflection,wavelengthnm,2,densityofsurfacestates,efactor,hfactor,capturecrosssection,ni);
       photocurrents= chargecarriers*1.6*10^-19;
       
       bandbandtimen=bandband(dopingdensityn);
        bandbandtimep=bandband(dopingdensityp);
        timen=((1/time)+(1/bandbandtimen))^-1;
        timep=((1/time)+(1/bandbandtimep))^-1;
    %    recombinationraten=chargecarriers*(timen)^-1;
    %    recombinationratep=chargecarriers*(timep)^-1;
         VOCN=opencircuit(temperature,dopingdensityn,chargecarriers,ni);
         VOCP=opencircuit(temperature,dopingdensityp,chargecarriers,ni);
       VOCNarray(intensityindex)=VOCN;
         
      
       
        intensityindex=intensityindex+1;
       
    end
    
  

figure

plot(intensityarray,VOCNarray);
title('Graph of Voc-intensity varying intensity')
xlabel('intensity') % x-axis label
ylabel('Voc') % y-axis label

end     

    
