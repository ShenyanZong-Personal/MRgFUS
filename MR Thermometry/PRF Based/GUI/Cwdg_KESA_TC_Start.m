function [  ] = Cwdg_KESA_TC_Start( hObject,~ )
%Cwdg_KESA_TC_Start Start KESA for all images over time
%   ...

handles = guidata(hObject);

handles.KESA_TC_Start_pObj          = uicontrol();
handles.KESA_TC_Start_pObj.Parent   = handles.KESA_TC_Setting_uObj;
handles.KESA_TC_Start_pObj.Style    = 'pushbutton';
handles.KESA_TC_Start_pObj.String   = 'Start All';
handles.KESA_TC_Start_pObj.Units    = 'pixels';
handles.KESA_TC_Start_pObj.Position = [50 200 100 50];
handles.KESA_TC_Start_pObj.FontSize = 12;
handles.KESA_TC_Start_pObj.Callback = @Start_KESA_TC;

guidata(hObject,handles);

end

function [  ] = Start_KESA_TC( hObject,~ )

handles = guidata(hObject);

Row         = handles.KESA_TC_fObj.UserData.Headers.Row;
Col         = handles.KESA_TC_fObj.UserData.Headers.Column;
NSlice      = handles.KESA_TC_fObj.UserData.Headers.NumberOfSlice;
NCoil       = handles.KESA_TC_fObj.UserData.Headers.NumberOfCoil;
TimePhase   = handles.KESA_TC_fObj.UserData.Headers.TemporalPhase;
Maps_Cplx   = handles.KESA_TC_fObj.UserData.Maps_Cplx;
TMaps       = handles.KESA_TC_fObj.UserData.TMaps;

Maps_Shift   = zeros(Row,Col,NSlice,TimePhase);
fprintf('>> Under KESA for Entire Images, Waiting for About 30 Minutes ...\n');
for iNSlice = 1:NSlice
    for iTimePhase = 1:TimePhase
        
        Map_Cplx_Coil_Current = Maps_Cplx(:,:,iNSlice,:,iTimePhase);
        Map_Cplx_Coil_Current = squeeze(Map_Cplx_Coil_Current);
        
        %---Current Slice and TimePhase Information---
        handles.Steps_Info_eObj.String = {[ 'iNSlice: ' [num2str(iNSlice) '/' num2str(NSlice)] ],...
            [ 'iTimePhase: ' [num2str(iTimePhase) '/' num2str(TimePhase)] ]};
        
        %------------
        
        %---Current Magnitude Image---
        WCoils  = zeros(Row,Col,NCoil);
        fx      = zeros(Row,Col);
        for iNCoil = 1:NCoil
            fx = fx + abs( Map_Cplx_Coil_Current(:,:,iNCoil) ).^2;
        end
        for iNCoil = 1:NCoil
            fx_Coil             = abs( Map_Cplx_Coil_Current(:,:,iNCoil) ).^2;
            WCoil               = fx_Coil./fx;
            WCoils(:,:,iNCoil)  = WCoil;
        end
        Magni_Map_Current = zeros(Row,Col);
        for iNCoil = 1:NCoil
            Magni_Map_Current = Magni_Map_Current + abs( Map_Cplx_Coil_Current(:,:,iNCoil) ).* WCoils(:,:,iNCoil);
            Magni_Map_Current( isnan(Magni_Map_Current) ) = 0;
        end
        
        handles.Magni_Map_iObj.CData = Magni_Map_Current;
        pause(0.1);
        %------------
        
        %---Current Temperature Image---
        TMap_Current = TMaps(:,:,iNSlice,iTimePhase);
        
        handles.Tempt_Map_iObj.CData = TMap_Current;
        pause(0.1);
        %------------
        
        %---Current Phase Image---
        Phase_Map_Coil_Current = angle(Map_Cplx_Coil_Current);
        
        Phase_Map_Current = zeros(Row,Col);
        for iNCoil = 1:NCoil
            Phase_Map_Current = Phase_Map_Current + Phase_Map_Coil_Current(:,:,iNCoil).* WCoils(:,:,iNCoil);
            Phase_Map_Current( isnan(Phase_Map_Current) ) = 0;
        end
        
        handles.Phase_Map_iObj.CData = Phase_Map_Current;
        pause(0.1);
        %------------
        
        %---Partial Fourier Reconstruction Module---
        kspace_Current          = fftshift( fft2(Magni_Map_Current) );
        PhaseEncodingDirection  = handles.KESA_TC_fObj.UserData.Headers.PhaseEncodingDirection;
        Algor                   = handles.Gp_Algori_uObj.SelectedObject.String;
        
        switch PhaseEncodingDirection
            case 'ROW'
                Nkxy = Col;
                Maps_KESA_Current = zeros(Row,Col,Nkxy);
                
                for iNkxy = 1:Nkxy
                    kspace_Partial_Current              = kspace_Current;
                    kspace_Partial_Current(:,1:iNkxy)   = 0+0i;
                    
                    switch Algor
                        case 'iFFT'
                            [kspace_Partial_Reco_Current,Magni_Map_Reco_Current] = ...
                                Partial_Fourier_iFFT(kspace_Partial_Current);
                        case 'POCS'
                        
                        case 'iFFT-Smoothing'
                            Wid = 16;
                            [kspace_Partial_Reco_Current,Magni_Map_Reco_Current] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace_Current,iNkxy,PhaseEncodingDirection,Col,Wid,Row);
                    end
                    handles.kspace_Partial_iObj.CData       = abs(kspace_Partial_Current);
                    pause(0.1);
                    handles.kspace_Partial_Reco_iObj.CData  = abs(kspace_Partial_Reco_Current);
                    pause(0.1);
                    handles.Magni_Map_Reco_iObj.CData       = Magni_Map_Reco_Current;
                    pause(0.1);
                    
                    Maps_KESA_Current(:,:,iNkxy)    = Magni_Map_Reco_Current;
                    
                end
                
                Map_Shift_Current                   = Drop_Determine(Maps_KESA_Current);
                Maps_Shift(:,:,iNSlice,iTimePhase)  = Map_Shift_Current;
                    
            case 'COL'
                Nkxy = Row;
                Maps_KESA_Current = zeros(Row,Col,Nkxy);
                
                for iNkxy = 1:Nkxy
                    kspace_Partial_Current              = kspace_Current;
                    kspace_Partial_Current(1:iNkxy,:)   = 0+0i;
                    
                    switch Algor
                        case 'iFFT'
                            [kspace_Partial_Reco_Current,Magni_Map_Reco_Current] = ...
                                Partial_Fourier_iFFT(kspace_Partial_Current);
                        case 'POCS'
                            
                        case 'iFFT-Smoothing'
                            Wid = 16;
                            [kspace_Partial_Reco_Current,Magni_Map_Reco_Current] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace_Current,iNkxy,PhaseEncodingDirection,Row,Wid,Col);
                    end
                    
                    handles.kspace_Partial_iObj.CData       = abs(kspace_Partial_Current);
                    pause(0.1);
                    handles.kspace_Partial_Reco_iObj.CData  = abs(kspace_Partial_Reco_Current);
                    pause(0.1);
                    handles.Magni_Map_Reco_iObj.CData       = Magni_Map_Reco_Current;
                    pause(0.1);
                    
                    Maps_KESA_Current(:,:,iNkxy)    = Magni_Map_Reco_Current;
                end
                
                Map_Shift_Current                   = Drop_Determine(Maps_KESA_Current);
                Maps_Shift(:,:,iNSlice,iTimePhase)  = Map_Shift_Current;
        end
        %------------
        
    end
end

fprintf('>> All KESA Completed ...\n');

handles.KESA_TC_fObj.UserData.Maps_Shift    = Maps_Shift;

guidata(hObject,handles);

Cgro_Maps_Shift_Charts(hObject);

end