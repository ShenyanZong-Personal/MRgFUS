function [  ] = TC_KESA_Partial_Reco_Cwdg( hObject,~ )
%Cgro_Reco_PF_Charts Cantain three axes() to display partial Fourier
%   ...

handles = guidata(hObject);

handles.TC_KESA_Partial_Reco_tObj                   = uicontrol();
handles.TC_KESA_Partial_Reco_tObj.Parent            = handles.TC_KESA_fObj;
handles.TC_KESA_Partial_Reco_tObj.Style             = 'text';
handles.TC_KESA_Partial_Reco_tObj.String            = 'Algors: ';
handles.TC_KESA_Partial_Reco_tObj.BackgroundColor   = 'w';
handles.TC_KESA_Partial_Reco_tObj.FontSize          = 12;
handles.TC_KESA_Partial_Reco_tObj.Units             = 'pixels';
handles.TC_KESA_Partial_Reco_tObj.Position          = [10 525 80 20];

handles.TC_KESA_iFFT_rObj                   = uicontrol();
handles.TC_KESA_iFFT_rObj.Parent            = handles.TC_KESA_fObj;
handles.TC_KESA_iFFT_rObj.Style             = 'radiobutton';
handles.TC_KESA_iFFT_rObj.Units             = 'pixels';
handles.TC_KESA_iFFT_rObj.FontSize          = 12;
handles.TC_KESA_iFFT_rObj.Position          = [90 520 100 30];
handles.TC_KESA_iFFT_rObj.BackgroundColor   = 'w';
handles.TC_KESA_iFFT_rObj.String            = 'iFFT';

handles.TC_KESA_POCS_rObj                   = uicontrol();
handles.TC_KESA_POCS_rObj.Parent            = handles.TC_KESA_fObj;
handles.TC_KESA_POCS_rObj.Style             = 'radiobutton';
handles.TC_KESA_POCS_rObj.Units             = 'pixels';
handles.TC_KESA_POCS_rObj.FontSize          = 12;
handles.TC_KESA_POCS_rObj.Position          = [190 520 100 30];
handles.TC_KESA_POCS_rObj.BackgroundColor   = 'w';
handles.TC_KESA_POCS_rObj.String            = 'POCS';


handles.TC_KESA_iFFT_Smoothing_rObj                   = uicontrol();
handles.TC_KESA_iFFT_Smoothing_rObj.Parent            = handles.TC_KESA_fObj;
handles.TC_KESA_iFFT_Smoothing_rObj.Style             = 'radiobutton';
handles.TC_KESA_iFFT_Smoothing_rObj.Units             = 'pixels';
handles.TC_KESA_iFFT_Smoothing_rObj.FontSize          = 12;
handles.TC_KESA_iFFT_Smoothing_rObj.Position          = [280 520 100 30];
handles.TC_KESA_iFFT_Smoothing_rObj.BackgroundColor   = 'w';
handles.TC_KESA_iFFT_Smoothing_rObj.String            = 'iFFT-S';

handles.TC_KESA_Start_pObj          = uicontrol();
handles.TC_KESA_Start_pObj.Parent   = handles.TC_KESA_fObj;
handles.TC_KESA_Start_pObj.Style    = 'pushbutton';
handles.TC_KESA_Start_pObj.Units    = 'pixels';
handles.TC_KESA_Start_pObj.FontSize = 12;
handles.TC_KESA_Start_pObj.Position = [400 520 100 30];
handles.TC_KESA_Start_pObj.String   = 'Start';
handles.TC_KESA_Start_pObj.Callback = @TC_KESA_Start;
handles.TC_KESA_Start_pObj.FontName = 'Times New Roman';

handles.TC_KESA_Reco_Status_tObj                        = uicontrol();
handles.TC_KESA_Reco_Status_tObj.Parent                 = handles.TC_KESA_fObj;
handles.TC_KESA_Reco_Status_tObj.Style                  = 'text';
handles.TC_KESA_Reco_Status_tObj.FontSize               = 12;
handles.TC_KESA_Reco_Status_tObj.FontName               = 'Times New Roman';
handles.TC_KESA_Reco_Status_tObj.HorizontalAlignment    = 'left';
handles.TC_KESA_Reco_Status_tObj.String                 = 'Ready To Run KESA First ... !';
handles.TC_KESA_Reco_Status_tObj.Position               = [10 480 300 25];

handles.TC_KESA_Info_tObj                       = uicontrol();
handles.TC_KESA_Info_tObj.Parent                = handles.TC_KESA_fObj;
handles.TC_KESA_Info_tObj.Style                 = 'text';
handles.TC_KESA_Info_tObj.FontSize              = 12;
handles.TC_KESA_Info_tObj.FontName              = 'Times New Roman';
handles.TC_KESA_Info_tObj.HorizontalAlignment   = 'left';
handles.TC_KESA_Info_tObj.Position              = [10 10 300 30];
handles.TC_KESA_Info_tObj.String                = 'Current Infos Are Not Ready ... !';

guidata(hObject,handles);



end

function TC_KESA_Start(hObject,~)

handles = guidata(hObject);


Maps_Cplx   = handles.TC_KESA_fObj.UserData.Maps_Cplx;
%Headers     = handles.TC_KESA_fObj.UserData.Headers;

Maps_KESA.Maps_KESA_iFFT            = 0;
Maps_KESA.Maps_KESA_POCS            = 0;
Maps_KESA.Maps_KESA_iFFT_Smoothing  = 0;

%PhaseEncodingDirection              = Headers.PhaseEncodingDirection;
RC_For_KESA                         = handles.TC_KESA_fObj.UserData.RC_For_KESA;
[Row,Col,NSlice,NCoil,NTimePhase]   = size(Maps_Cplx);



%--- Inverse Fourier Transform Reconstruction ---
if handles.TC_KESA_iFFT_rObj.Value
    
    handles.TC_KESA_Reco_Status_tObj.String = 'Performing! iFFT! Please wait ...!';
    pause(0.1);
    handles.TC_KESA_Run_Shift_pObj.Enable   = 'off';
    
    switch RC_For_KESA %PhaseEncodingDirection
        
        case 'ROW'
            Nkxy            = Col;
            Maps_KESA_iFFT  = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for iNkxy = 1:Nkxy
                
                            kspace_Partial              = kspace;
                            kspace_Partial(:,1:iNkxy)   = 0+0i;
                
                            [~,Magni_Map_Reco] = ...
                                    Partial_Fourier_iFFT(kspace_Partial);
                
                
                            Maps_KESA_iFFT(:,:,iSlice,iCoil,iTimePhase,iNkxy)   = Magni_Map_Reco;
                
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_iFFT    = Maps_KESA_iFFT;
            
        case 'COL'
            Nkxy            = Row;
            Maps_KESA_iFFT  = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for iNkxy = 1:Nkxy
                
                        kspace_Partial              = kspace;
                        kspace_Partial(1:iNkxy,:)   = 0+0i;
                
                        [~,Magni_Map_Reco] = ...
                                Partial_Fourier_iFFT(kspace_Partial);
                    
                        Maps_KESA_iFFT(:,:,iSlice,iCoil,iTimePhase,iNkxy)   = Magni_Map_Reco;
                
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_iFFT    = Maps_KESA_iFFT;
    end
    
    %fprintf('>> All Done! iFFT ...! \n');
    
end
%--------------------------------------------------------------------------

%---   POCS Reconstruction   ---
if handles.TC_KESA_POCS_rObj.Value
    
    handles.TC_KESA_Reco_Status_tObj.String = 'Performing! POCS! Please wait ... !';
    pause(0.1);
    handles.TC_KESA_Run_Shift_pObj.Enable   = 'off';
    
    switch RC_For_KESA %PhaseEncodingDirection
        
        case 'ROW'
            Nkxy            = Col;
            Maps_KESA_POCS  = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for  iNkxy = 1:Nkxy
                
                            %kspace_Partial              = kspace;
                            %kspace_Partial(:,1:iNkxy)   = 0+0i;
                            %{
                            [~,Magni_Map_Reco] = ...
                                POCS(kspace,iNkxy,PhaseEncodingDirection,Col,4);
                            %}
                            [~,Magni_Map_Reco] = ...
                                POCS(kspace,iNkxy,RC_For_KESA,Col,4);
                    
                
                            Maps_KESA_POCS(:,:,iSlice,iCoil,iTimePhase,iNkxy)   = Magni_Map_Reco;
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_POCS    = Maps_KESA_POCS;
            
        case 'COL'
            Nkxy            = Row;
            Maps_KESA_POCS  = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for iNkxy = 1:Nkxy
                
                            %kspace_Partial              = kspace;
                            %kspace_Partial(1:iNkxy,:)   = 0+0i;
                            %{
                            [~,Magni_Map_Reco] = ...
                                POCS(kspace,iNkxy,PhaseEncodingDirection,Row,4);
                            %}
                            [~,Magni_Map_Reco] = ...
                                POCS(kspace,iNkxy,RC_For_KESA,Row,4);
                
                            Maps_KESA_POCS(:,:,iSlice,iCoil,iTimePhase,iNkxy)   = Magni_Map_Reco;
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_POCS    = Maps_KESA_POCS;
    end
    
    %fprintf('>> All Done! POCS ...! \n');
    
end
%--------------------------------------------------------------------------

%---   Inverse Fourier Transform Reconstruction with Soomthing   ---
if handles.TC_KESA_iFFT_Smoothing_rObj.Value
    
   handles.TC_KESA_Reco_Status_tObj.String  = 'Performing! iFFT_Smoothing! Please wait ...!';
   pause(0.1);
   handles.TC_KESA_Run_Shift_pObj.Enable    = 'off';
    
    switch RC_For_KESA %PhaseEncodingDirection
        
        case 'ROW'
            Nkxy                        = Col;
            Maps_KESA_iFFT_Smoothing    = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for iNkxy = 1:Nkxy
                
                            %kspace_Partial              = kspace;
                            %kspace_Partial(:,1:iNkxy)   = 0+0i;
                
                            wid = 16;
                            %{
                            [~,Magni_Map_Reco] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,Col,wid,Row);
                            %}
                            [~,Magni_Map_Reco] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,RC_For_KESA,Col,wid,Row);

                            
                            Maps_KESA_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase,iNkxy) = Magni_Map_Reco;
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_iFFT_Smoothing = Maps_KESA_iFFT_Smoothing; 
            
        case 'COL'
            Nkxy                        = Row;
            Maps_KESA_iFFT_Smoothing    = zeros(Row,Col,NSlice,NCoil,NTimePhase,Nkxy);
            
            for iSlice = 1:NSlice
                for iCoil = 1:NCoil
                    for iTimePhase = 1:NTimePhase
                        
                        Map_Cplx_Current    = Maps_Cplx(:,:,iSlice,iCoil,iTimePhase);
                        Map_Cplx_Current    = squeeze(Map_Cplx_Current);
                        %Magni_Map_Current   = abs(Map_Cplx_Current);
                        %kspace              = fftshift( fft2(Magni_Map_Current) );
                        kspace              = fftshift( fft2(Map_Cplx_Current) );
                        
                        for iNkxy = 1:Nkxy
                
                            %kspace_Partial              = kspace;
                            %kspace_Partial(1:iNkxy,:)   = 0+0i;
                
                            wid = 16;
                            %{
                            [~,Magni_Map_Reco] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,Row,wid,Col);
                            %}
                            [~,Magni_Map_Reco] = ...
                                Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,RC_For_KESA,Row,wid,Col);
                            
                            Maps_KESA_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase,iNkxy) = Magni_Map_Reco;
                        end
                    end
                end
            end
            
            Maps_KESA.Maps_KESA_iFFT_Smoothing = Maps_KESA_iFFT_Smoothing; 
    end
    
    %fprintf('>> All Done! iFFT_Smoothing ...! \n');
    
end
%--------------------------------------------------------------------------

if ~handles.TC_KESA_iFFT_rObj.Value && ...
        ~handles.TC_KESA_POCS_rObj.Value && ...
        ~handles.TC_KESA_iFFT_Smoothing_rObj.Value

else
    
    handles.TC_KESA_Reco_Status_tObj.String = 'All Completed ... !';
    handles.TC_KESA_Run_Shift_pObj.Enable   = 'on';
    
end



handles.TC_KESA_fObj.UserData.Maps_KESA = Maps_KESA;

guidata(hObject,handles);

end


