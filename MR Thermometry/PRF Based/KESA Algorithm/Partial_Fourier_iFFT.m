function [ kspace_Reco_Partial,Image_Reco_Partial ] = ...
    Partial_Fourier_iFFT( kspace_Truncated,~ )
%Partial_Fourier_iFFT Image reconstruction using direct Fourier transform
%   ...

kspace_Reco_Partial = kspace_Truncated;
Image_Reco_Partial  = abs( ifft2(kspace_Truncated) );



end

