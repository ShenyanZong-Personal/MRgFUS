function [ TMaps_Combined ] = PRF_Combine( TMaps_Coil,WCoils )
%
%   

[Row,Col,NSlice,NCoil,NTimePhase] = size(WCoils);

TMaps_Combined = zeros(Row,Col,NSlice,NTimePhase);
for iSlice = 1:NSlice
    
    TMap_Combined = zeros(Row,Col,NTimePhase);
    for iCoil = 1:NCoil
        
        TMap_Combined = TMap_Combined + squeeze( TMaps_Coil(:,:,iSlice,iCoil,:) ).* squeeze( WCoils(:,:,iSlice,iCoil,:) );
        TMap_Combined = squeeze(TMap_Combined);
    
    end
    
    TMaps_Combined(:,:,iSlice,:) = TMap_Combined;
end


end

