function [ Matrix5D ] = FourD2FiveD( Matrix4D )
%
%   

[Nx,Ny,Nz,Np] = size( Matrix4D );

Nc          = 1;   % Combined or One coil
Matrix5D    = zeros(Nx,Ny,Nz,Nc,Np);
   
Matrix5D(:,:,:,Nc,:)   = Matrix4D;
    

end

