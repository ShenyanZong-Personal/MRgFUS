function [  ] = TC_KESA_Run_Shift_Cwdg( hObject,~ )
%Cwdg_KESA_TC_Start Start KESA for all images over time
%   ...

handles = guidata(hObject);

handles.TC_KESA_Run_Shift_pObj          = uicontrol();
handles.TC_KESA_Run_Shift_pObj.Parent   = handles.TC_KESA_fObj;
handles.TC_KESA_Run_Shift_pObj.Style    = 'pushbutton';
handles.TC_KESA_Run_Shift_pObj.String   = 'R-Shift';
handles.TC_KESA_Run_Shift_pObj.Units    = 'pixels';
handles.TC_KESA_Run_Shift_pObj.Position = [520 600 100 30];
handles.TC_KESA_Run_Shift_pObj.FontSize = 12;
handles.TC_KESA_Run_Shift_pObj.Callback = @TC_KESA_Run_Shift_Callback;

handles.TC_KESA_Shift_Map_aObj                  = axes();
handles.TC_KESA_Shift_Map_aObj.Parent           = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Map_aObj.Units            = 'pixels';
handles.TC_KESA_Shift_Map_aObj.Position         = [10 100 400 400];
handles.TC_KESA_Shift_Map_aObj.XAxisLocation    = 'top';
handles.TC_KESA_Shift_Map_aObj.YDir             = 'reverse';
handles.TC_KESA_Shift_Map_aObj.XLimMode         = 'manual';
handles.TC_KESA_Shift_Map_aObj.YLimMode         = 'manual';
handles.TC_KESA_Shift_Map_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_Shift_Map_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_Shift_Map_aObj.XColor           = 'none';
handles.TC_KESA_Shift_Map_aObj.YColor           = 'none';

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
    
    fprintf('>> Performing! Shift Maps! iFFT ...! \n');
    
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
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT = Maps_Shift_iFFT;
    
    fprintf('>> All Done! Shift Maps! iFFT ...! \n');
    
end

if Maps_KESA.Maps_KESA_POCS == 0
    
else
    
    fprintf('>> Performing! Shift Maps! POCS ...! \n');
    
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
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_POCS = Maps_Shift_POCS;
    
    fprintf('>> All Done! Shift Maps! POCS ...! \n');
end

if Maps_KESA.Maps_KESA_iFFT_Smoothing == 0
    
else
    
    fprintf('>> Performing! Shift Maps! iFFT-S ... \n');
    
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
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT_Smoothing = Maps_Shift_iFFT_Smoothing;
    
    fprintf('>> All Done! Shift Maps! iFFT-S ... \n');
end

handles.TC_KESA_fObj.UserData.Maps_Shift = Maps_Shift;

guidata(hObject,handles);

end