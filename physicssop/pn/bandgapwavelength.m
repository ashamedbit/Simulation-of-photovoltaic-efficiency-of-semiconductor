function [ threshholdwavelength ] = bandgapwavelength( bandgap )
%BANDGAPWAVELENGTH Summary of this function goes here
%bandgap in eV
%threshholdwavelength gives threshhold for wavelength which enters in nm
%(1.9875*10^-25)/(1.60218*10^-19)
threshholdwavelength=(0.00000124049/bandgap)*10^9;
end

