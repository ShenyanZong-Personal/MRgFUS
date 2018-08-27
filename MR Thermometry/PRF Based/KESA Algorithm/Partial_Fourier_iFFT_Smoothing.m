function [ kspace_Reco_Partial,Image_Reco_Partial ] = ...
    Partial_Fourier_iFFT_Smoothing( kspace,iNkxy,PhaseDir,NkxyPhase,wid,NkxyFreq )
%Partial_Fourier_iFFT_Smoothing Do iFFT to reconstruct with Smoothing filter
%   Smoothing Function: cos(x).^2

kerSM   = kernal_Smoothing(wid,iNkxy,PhaseDir,NkxyPhase);
switch PhaseDir
    case 'ROW'
        MkerSM = repmat(kerSM,NkxyFreq,1);
    case 'COL'
        MkerSM = repmat(kerSM,1,NkxyFreq);
end
kspace_Truncated    = kspace.*MkerSM;
map_Partial         = abs(ifft2(kspace_Truncated));

kspace_Reco_Partial = kspace_Truncated;
Image_Reco_Partial  = map_Partial;

end

