function  graphivconstanttemp(Reflection,wavelengthnm)
bandgap=1.1;
dopingdensityn=10^16;
dopingdensityp=10^18;
ni=10^10;
densityofsurfacestates=1.4*10^14;
efactor=0.19;
hfactor=0.58;
capturecrosssection=2.4*10^-15 ;
diffcons=12;

intensityarray=[250 500 750 1000 ];

temperature=300;
areaofjunction=10^-4;
currenttotal=zeros(4,91);
voltage=zeros(1,91);
VOCNarray=zeros(1,91);
k=1;

         p=holeconcentration(dopingdensityn,ni);
        e= econcentration(dopingdensityp,ni );

for Vopen=0:0.01:0.9
    
    for intensityindex=1:4
        intensity=intensityarray(intensityindex);
        voltage(k)=Vopen;
  
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
       VOCNarray(intensityindex,k)=VOCN;
         
        I=saturationcurrent( diffcons,dopingdensityn,areaofjunction,ni ,timep,Vopen,temperature,bandgap);
        totalI= photocurrents-I;
        if(totalI<0)
        totalI=0;
        end
        currenttotal(intensityindex,k) = totalI;
       
    end
    k=k+1;
end    

figure

plot(voltage,currenttotal(1,:),voltage,currenttotal(2,:),voltage,currenttotal(3,:),voltage,currenttotal(4,:));
title('Graph of I-V varying intensity')
legend('I=250','I=500','I=750','I=1000');
xlabel('external voltage') % x-axis label
ylabel('Current total') % y-axis label

end     

    
