function [  ] = TC_KESA_Run_Shift_Cwdg( hObject,~ )
%Cwdg_KESA_TC_Start Start KESA for all images over time
%   ...

handles = guidata(hObject);

handles.TC_KESA_Run_Shift_pObj          = uicontrol();
handles.TC_KESA_Run_Shift_pObj.Parent   = handles.TC_KESA_fObj;
handles.TC_KESA_Run_Shift_pObj.Style    = 'pushbutton';
handles.TC_KESA_Run_Shift_pObj.String   = 'R-Shift';
handles.TC_KESA_Run_Shift_pObj.Units    = 'pixels';
handles.TC_KESA_Run_Shift_pObj.Position = [520 520 100 30];
handles.TC_KESA_Run_Shift_pObj.FontSize = 12;
handles.TC_KESA_Run_Shift_pObj.Callback = @TC_KESA_Run_Shift_Callback;
handles.TC_KESA_Run_Shift_pObj.FontName = 'Times New Roman';
handles.TC_KESA_Run_Shift_pObj.Enable   = 'off';

handles.TC_KESA_Shift_Maps_uObj             = uipanel();
handles.TC_KESA_Shift_Maps_uObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Maps_uObj.Units       = 'pixels';
handles.TC_KESA_Shift_Maps_uObj.Position    = [10 70 1070 410];

handles.TC_KESA_SM_iFFT_aObj                  = axes();
handles.TC_KESA_SM_iFFT_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_iFFT_aObj.Units            = 'pixels';
handles.TC_KESA_SM_iFFT_aObj.Position         = [5 10 350 350];
handles.TC_KESA_SM_iFFT_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_iFFT_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_iFFT_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_iFFT_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_iFFT_aObj.XColor           = 'none';
handles.TC_KESA_SM_iFFT_aObj.YColor           = 'none';
handles.TC_KESA_SM_iFFT_aObj.Title.String     = 'Shift Map In iFFT';
handles.TC_KESA_SM_iFFT_aObj.Title.FontName   = 'Times New Roman';
handles.TC_KESA_SM_iFFT_aObj.Colormap         = gray;

handles.TC_KESA_SM_POCS_aObj                  = axes();
handles.TC_KESA_SM_POCS_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_POCS_aObj.Units            = 'pixels';
handles.TC_KESA_SM_POCS_aObj.Position         = [360 10 350 350];
handles.TC_KESA_SM_POCS_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_POCS_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_POCS_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_POCS_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_POCS_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_POCS_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_POCS_aObj.XColor           = 'none';
handles.TC_KESA_SM_POCS_aObj.YColor           = 'none';
handles.TC_KESA_SM_POCS_aObj.Title.String     = 'Shift Map In POCS';
handles.TC_KESA_SM_POCS_aObj.Title.FontName   = 'Times New Roman';
handles.TC_KESA_SM_POCS_aObj.Colormap         = gray;

handles.TC_KESA_SM_iFFT_Smoothing_aObj                  = axes();
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Units            = 'pixels';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Position         = [715 10 350 350];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XColor           = 'none';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YColor           = 'none';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Title.String     = 'Shift Map In iFFT-S';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Title.FontName   = 'Times New Roman';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Colormap         = gray;

handles.TC_KESA_SM_Status_tObj                      = uicontrol();
handles.TC_KESA_SM_Status_tObj.Parent               = handles.TC_KESA_fObj;
handles.TC_KESA_SM_Status_tObj.Style                = 'text';
handles.TC_KESA_SM_Status_tObj.FontSize             = 12;
handles.TC_KESA_SM_Status_tObj.FontName             = 'Times New Roman';
handles.TC_KESA_SM_Status_tObj.Position             = [10 40 300 30];
handles.TC_KESA_SM_Status_tObj.HorizontalAlignment  = 'left';
handles.TC_KESA_SM_Status_tObj.String               = 'Ready To Show ... !';

guidata(hObject,handles);

end

function [ ] = TC_KESA_Run_Shift_Callback(hObject,~)

handles = guidata(hObject);

Maps_KESA = handles.TC_KESA_fObj.UserData.Maps_KESA;

Maps_Shift.Maps_Shift_iFFT              = 0;
Maps_Shift.Maps_Shift_POCS              = 0;
Maps_Shift.Maps_Shift_iFFT_Smoothing    = 0;

if Maps_KESA.Maps_KESA_iFFT == 0
    
else
    
    %fprintf('>> Performing! Shift Maps! iFFT ...! \n');
    handles.TC_KESA_SM_Status_tObj.String = 'Getting Shift Maps! iFFT ... !';
    pause(0.1);
    
    Maps_KESA_iFFT = Maps_KESA.Maps_KESA_iFFT;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_iFFT);
    
    Maps_Shift_iFFT = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_iFFT = Maps_KESA_iFFT(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_iFFT = squeeze(Map_KESA_iFFT);
                
                Map_Shift_iFFT = Drop_Determine(Map_KESA_iFFT);
                
                Maps_Shift_iFFT(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_iFFT;
                
                handles.TC_KESA_Shift_Map_iFFT_iObj                 = image();
                handles.TC_KESA_Shift_Map_iFFT_iObj.Parent          = handles.TC_KESA_SM_iFFT_aObj;
                handles.TC_KESA_Shift_Map_iFFT_iObj.CData           = Map_Shift_iFFT;
                handles.TC_KESA_Shift_Map_iFTT_iObj.CDataMapping    = 'scaled';
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT = Maps_Shift_iFFT;
    
    %fprintf('>> All Done! Shift Maps! iFFT ...! \n');
    
end

if Maps_KESA.Maps_KESA_POCS == 0
    
else
    
    handles.TC_KESA_SM_Status_tObj.String = 'Performing! Shift Maps! POCS ...!';
    pause(0.1);
    
    Maps_KESA_POCS = Maps_KESA.Maps_KESA_POCS;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_POCS);
    
    Maps_Shift_POCS = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_POCS = Maps_KESA_POCS(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_POCS = squeeze(Map_KESA_POCS);
                
                Map_Shift_POCS = Drop_Determine(Map_KESA_POCS);
                
                Maps_Shift_POCS(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_POCS; 
                
                handles.TC_KESA_Shift_Map_POCS_iObj                 = image();
                handles.TC_KESA_Shift_Map_POCS_iObj.Parent          = handles.TC_KESA_SM_POCS_aObj;
                handles.TC_KESA_Shift_Map_POCS_iObj.CData           = Map_Shift_POCS;
                handles.TC_KESA_Shift_Map_POCS_iObj.CDataMapping    = 'scaled';
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_POCS = Maps_Shift_POCS;
    
    %fprintf('>> All Done! Shift Maps! POCS ...! \n');
end

if Maps_KESA.Maps_KESA_iFFT_Smoothing == 0
    
else
    
    handles.TC_KESA_SM_Status_tObj.String = 'Performing! Shift Maps! iFFT-S ... !';
    pause(0.1);
    
    Maps_KESA_iFFT_Smoothing = Maps_KESA.Maps_KESA_iFFT_Smoothing;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_iFFT_Smoothing);
    
    Maps_Shift_iFFT_Smoothing = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_iFFT_Smoothing = Maps_KESA_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_iFFT_Smoothing = squeeze(Map_KESA_iFFT_Smoothing);
                
                Map_Shift_iFFT_Smoothing = Drop_Determine(Map_KESA_iFFT_Smoothing);
                
                Maps_Shift_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_iFFT_Smoothing;
                
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj               = image();
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.Parent        = handles.TC_KESA_SM_iFFT_Smoothing_aObj;
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData         = Map_Shift_iFFT_Smoothing;
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CDataMapping  = 'scaled';
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT_Smoothing = Maps_Shift_iFFT_Smoothing;
    
    fprintf('>> All Done! Shift Maps! iFFT-S ... \n');
end

handles.TC_KESA_fObj.UserData.Maps_Shift = Maps_Shift;

guidata(hObject,handles);

end