clear; close all;

% --- Image Registration --- %
% --- Demo: Non Rigid Registration --- %

DataSet = load('DataBase.mat');

MMaps_GoodShim      = DataSet.MMaps_GoodShim;   % Reference #1
MMap_GoodShim_Base  = MMaps_GoodShim(:,:,1,1,1);

MMaps_HBW       = DataSet.MMaps_HBW;   % Reference #2
MMap_HBW_Base   = MMaps_HBW(:,:,1,1,1);

MMaps_Warp      = DataSet.MMaps_Warp;   % To Be Registered
MMap_Warp_Base  = MMaps_Warp(:,:,1,1,1);

infoReg = registerImages(MMap_Warp_Base,MMap_GoodShim_Base);
DpField = infoReg.DisplacementField;

infoReg2 = registerImages(MMap_Warp_Base,MMap_HBW_Base);
DpField2 = infoReg2.DisplacementField;

TMaps_TEcorrected_Warp      = DataSet.TMaps_TEerror_Warp;
[Nx,Ny,Nz,Nc,Np]            = size(TMaps_TEcorrected_Warp);
TMaps_TEcorrected_Unwarp    = zeros(Nx,Ny,Nz,Nc,Np);

for iNz = 1:Nz
    for iNc = 1:Nc
        for iNp = 1:Np
            
            Current = TMaps_TEcorrected_Warp(:,:,iNz,iNc,iNp);
            Unwarp  = imwarp(Current,DpField);
            
            TMaps_TEcorrected_Unwarp(:,:,iNz,iNc,iNp) = Unwarp;
            
        end
    end
end

TMaps_TEcorrected_Unwarp2    = zeros(Nx,Ny,Nz,Nc,Np);

for iNz = 1:Nz
    for iNc = 1:Nc
        for iNp = 1:Np
            
            Current = TMaps_TEcorrected_Warp(:,:,iNz,iNc,iNp);
            Unwarp  = imwarp(Current,DpField2);
            
            TMaps_TEcorrected_Unwarp2(:,:,iNz,iNc,iNp) = Unwarp;
            
        end
    end
end
