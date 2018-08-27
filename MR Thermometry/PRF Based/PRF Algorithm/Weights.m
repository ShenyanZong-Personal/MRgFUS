function WCoils = Weights(Maps_Cplx)
% Weights Calculate signal weight coefficients for each coils
%   ...

[row,col,nsilce,ncoil,ntfra] = size(Maps_Cplx);

WCoils = zeros(row,col,nsilce,ncoil,ntfra);

for itfra = 1:ntfra
    
    fx = zeros(row,col,nsilce);
    for icoil = 1:ncoil
        fx_coil =   abs(Maps_Cplx(:,:,:,icoil,itfra)).^2;
        fx      =   fx + fx_coil;
    end
    
    for icoil = 1:ncoil
        fx_coil     = abs(Maps_Cplx(:,:,:,icoil,itfra)).^2;
        WCoil       = fx_coil./fx;
        WCoil(isnan(WCoil))         = 0;
        WCoils(:,:,:,icoil,itfra)   = WCoil;
    end
    
end


end

