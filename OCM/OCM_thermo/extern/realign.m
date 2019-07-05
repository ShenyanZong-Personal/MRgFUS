function [ kspace_5D ] = realign( kspace_9D )
%realign() This function is to re-align 9D raw matrix into 5D matrix
%   Input:kspace_9D
%   The obtained kspace matrix from Siemens raw data always is 9-Dimension.
%   For convenience, it is necessary to adjust and re-align some dimensions.
%   This function only supports the kspace matrix got through mapVBVD.m
%
%   Output: kspace_5D
%   The kspace-5D stores data in the form of [nFrE,nPhE,nS,nC,nPh]
%   nFrE: the number of frequency encoding
%   nPhE: the number of Phase Encoding
%   nS: the number of slice
%   nC: the number of coil
%   nPh: the number of time frame

kspace_9D_ex    = permute(kspace_9D,[1 3 5 2 9 4 6 7 8]);
kspace_5D       = squeeze( kspace_9D_ex );


end

