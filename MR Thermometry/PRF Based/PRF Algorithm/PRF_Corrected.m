function [TMaps_Coil_Corrected] = PRF_Corrected( hObject,Delta_TE )
%PRF Calculate temperature maps based on proton resonance frequency
%   Main Algorithm

handles     = guidata(hObject);

Maps_Cplx   = handles.PRF_fObj.UserData.Maps_Cplx;
Headers     = handles.PRF_fObj.UserData.Headers;

Row             = Headers.Row;
Col             = Headers.Column;
NSlice          = Headers.NumberOfSlice;
NCoil           = Headers.NumberOfCoil;
NTimePhase      = Headers.TemporalPhase;

gama    = Headers.Gama*(10^6);
alpha   = 0.01e-6;
B0      = Headers.B0;
TE      = Headers.TE*(10^-3);   %--- Unit: s ---%
TE_Real = TE + Delta_TE;   %--- Unit: s ---%

%Real_TE = TE + 
%fprintf('>> Start PRF Algorithm ...\n');

if NCoil == 1
    fprintf('>> Unknown ...\n');
else

    Ref                     = Maps_Cplx(:,:,:,:,1);
    TMaps_Coil_Corrected    = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    %TMaps_Combined  = zeros(Row,Col,NSlice,1,NTimePhase);
    WCoils                  = Weights(Maps_Cplx);
    
    for iTimePhase = 1:NTimePhase
        
        Phase_Shift_Coil                            = Maps_Cplx(:,:,:,:,iTimePhase)./Ref;
        Phase_Shift_Coil(isnan(Phase_Shift_Coil))   = 0;
        Phase_Shift_Coil                            = angle(Phase_Shift_Coil);
        
        Map_TE_Real_Current     = TE_Real(:,:,:,:,iTimePhase);
        
        %unwrap
        
        %Phase_Shift_Combined = zeros(Row,Col,NSlice);
        %for iCoil = 1:NCoil  
            %Phase_Shift_Combined = Phase_Shift_Combined + Phase_Shift_Coil(:,:,:,iCoil).*WCoils(:,:,:,iCoil,iTimePhase);   
        %end
    
    
        %TMap_Combined                           = Phase_Shift_Combined./(gama*alpha*B0*TE_Real*2*pi);
        %TMaps_Combined(:,:,:,1,iTimePhase)      = TMap_Combined;
    
        TMap_Coil_Corrected                       = Phase_Shift_Coil./(gama*alpha*B0*Map_TE_Real_Current*2*pi);
        TMaps_Coil_Corrected(:,:,:,:,iTimePhase)  = TMap_Coil_Corrected;
    
    end
    
    handles.PRF_fObj.UserData.WCoils    = WCoils;

end

guidata(hObject,handles);
    
end



