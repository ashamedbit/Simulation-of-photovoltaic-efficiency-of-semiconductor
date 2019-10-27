function [ wavdata ] = simulatesilicon(intensity,Reflection,wavelengthnm)

dopingdensity=[10^15 10^16 10^14];
ni=10^10;
densityofsurfacestates=1.4*10^14;
efactor=0.19;
hfactor=0.58;
capturecrosssection=2.4*10^-15 ;
diffcons=12;
Vopen=0.5;
temperature=300;
areaofjunction=10^-4;

wavdata=struct('dopingdensityatn',[],'dopingdensityatp',[],'builtinpot',[],'recombinationrateinn',[],'recombinationrateinp',[],'chargecarriers',[],'opencircuit',[],'Photogeneratedcurrent',[]);


for i=1:length(dopingdensity)
    for j=1:length(dopingdensity)
        
        p=holeconcentration(dopingdensity(i),ni);
        e= econcentration(dopingdensity(j),ni );
        v= builtinpotential(temperature,ni,dopingdensity(i),dopingdensity(j) );
       [chargecarriers,time]=  calculategivensemicond(1.1,intensity,Reflection,wavelengthnm,2,densityofsurfacestates,efactor,hfactor,capturecrosssection,ni);
       photocurrents= chargecarriers*1.6*10^-19;
       
       bandbandtimen=bandband(dopingdensity(i));
        bandbandtimep=bandband(dopingdensity(j));
        timen=((1/time)+(1/bandbandtimen));
        timep=((1/time)+(1/bandbandtimep));
        recombinationraten=chargecarriers*timen;
        recombinationratep=chargecarriers*timep;
        VOCN=opencircuit(temperature,dopingdensity(i),chargecarriers,ni);
        VOCP=opencircuit(temperature,dopingdensity(j),chargecarriers,ni);
        wavdata=[wavdata struct('dopingdensityatn',dopingdensity(i),'dopingdensityatp',dopingdensity(j),'builtinpot',v,'recombinationrateinn',recombinationraten,'recombinationrateinp',recombinationratep,'chargecarriers',chargecarriers,'opencircuit',VOCN,'Photogeneratedcurrent',photocurrents)];
        I=saturationcurrent( diffcons,dopingdensity(i),areaofjunction,ni ,timep,Vopen,temperature)
        totalI=I+photocurrents;
        
    end
end

    
