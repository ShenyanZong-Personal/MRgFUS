function [TMaps_Coil,TMaps_Combined] = PRF( hObject )
%PRF Calculate temperature maps based on proton resonance frequency
%   Main Algorithm

handles     = guidata(hObject);

Maps_Cplx   = handles.PRF_fObj.UserData.Maps_Cplx;
Headers     = handles.PRF_fObj.UserData.Headers;

Row     = Headers.Row;
Col     = Headers.Column;
NSlice  = Headers.NumberOfSlice;
NCoil   = Headers.NumberOfCoil;
NTimePhase   = Headers.TemporalPhase;

gama    = Headers.Gama*(10^6);
alpha   = 0.01e-6;
B0      = Headers.B0;
TE      = Headers.TE*(10^-3);


fprintf('>> Start PRF Algorithm ...\n');

if NCoil == 1
    fprintf('>> Unknown ...\n');
else

    Ref             = Maps_Cplx(:,:,:,:,1);
    TMaps_Coil      = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    TMaps_Combined  = zeros(Row,Col,NSlice,1,NTimePhase);
    WCoils          = Weights(Maps_Cplx);
    
    for iTimePhase = 1:NTimePhase
        
        Phase_Shift_Coil                            = Maps_Cplx(:,:,:,:,iTimePhase)./Ref;
        Phase_Shift_Coil(isnan(Phase_Shift_Coil))   = 0;
        Phase_Shift_Coil                            = angle(Phase_Shift_Coil);
        
        %unwrap
        
        Phase_Shift_Combined = zeros(Row,Col,NSlice);
        for iCoil = 1:NCoil  
            Phase_Shift_Combined = Phase_Shift_Combined + Phase_Shift_Coil(:,:,:,iCoil).*WCoils(:,:,:,iCoil,iTimePhase);   
        end
    
    
        TMap_Combined                       = Phase_Shift_Combined./(gama*alpha*B0*TE*2*pi);
        TMaps_Combined(:,:,:,1,iTimePhase)    = TMap_Combined;
    
        TMap_Coil                       = Phase_Shift_Coil./(gama*alpha*B0*TE*2*pi);
        TMaps_Coil(:,:,:,:,iTimePhase)  = TMap_Coil;
    
    end
    
    handles.PRF_fObj.UserData.WCoils    = WCoils;

end

guidata(hObject,handles);
    
end



