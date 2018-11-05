function [  ] = TC_KESA_OnPoint_Cwdg( hObject,~ )
%Cwdg_PF_Algori Options for select partial Fourier reconstruction
%   ...

handles = guidata(hObject);

handles.SvsT_OnPoint_pObj           = uicontrol();
handles.SvsT_OnPoint_pObj.Parent    = handles.TC_KESA_fObj;
handles.SvsT_OnPoint_pObj.Style     = 'pushbutton';
handles.SvsT_OnPoint_pObj.Units     = 'pixels';
handles.SvsT_OnPoint_pObj.FontSize  = 12;
handles.SvsT_OnPoint_pObj.FontName  = 'Times New Roman';
handles.SvsT_OnPoint_pObj.String    = 'ST on P';
handles.SvsT_OnPoint_pObj.Position  = [1000 570 80 30];
handles.SvsT_OnPoint_pObj.Enable    = 'off';
handles.SvsT_OnPoint_pObj.Callback  = @Plot_OnPoint_VS_Time_Callback;

guidata(hObject,handles);

end

function Plot_OnPoint_VS_Time_Callback(hObject,~)

handles = guidata(hObject);

Maps_Shift       = handles.TC_KESA_fObj.UserData.Maps_Shift;

Points_DCM_Obj  = datacursormode(handles.TC_KESA_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

TPlot_Shift.TPlot_Shift_iFFT            = 0;
TPlot_Shift.TPlot_Shift_POCS            = 0;
TPlot_Shift.TPlot_Shift_iFFT_Smoothing  = 0;

if isempty(Points_Info)
    
    %fprintf('>> Please Add Data Cursor ... \n');
    %handles.KESA_OnPoints_Status_tObj.String = 'Need To Put A Datatip On Maps ... !';
    
else
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
    end
    
    iSlice_Current  = handles.TC_KESA_fObj.UserData.Slice_Current;
    iCoil_Current   = handles.TC_KESA_fObj.UserData.Coil_Current;
    
    if ~isscalar(Maps_Shift.Maps_Shift_iFFT)
        [~,~,~,~,NTimePhase]    = size(Maps_Shift.Maps_Shift_iFFT);
        TPlot_Shift_iFFT        = zeros(NumP,NTimePhase);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            
            for iTimePhase = 1:NTimePhase
                Map_Shift_iFFT_Current = Maps_Shift.Maps_Shift_iFFT(:,:,iSlice_Current,iCoil_Current,iTimePhase);
                Map_Shift_iFFT_Current = squeeze(Map_Shift_iFFT_Current);
                
                Shift_iFFT_Current                  = Map_Shift_iFFT_Current(Row_Selected,Col_Selected);
                TPlot_Shift_iFFT(iNumP,iTimePhase)  = Shift_iFFT_Current;
            end
            
        end
        
        TPlot_Shift.TPlot_Shift_iFFT = TPlot_Shift_iFFT;
    end
    
    if ~isscalar(Maps_Shift.Maps_Shift_POCS)
        [~,~,~,~,NTimePhase]    = size(Maps_Shift.Maps_Shift_POCS);
        TPlot_Shift_POCS        = zeros(NumP,NTimePhase);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            
            for iTimePhase = 1:NTimePhase
                Map_Shift_POCS_Current = Maps_Shift.Maps_Shift_POCS(:,:,iSlice_Current,iCoil_Current,iTimePhase);
                Map_Shift_POCS_Current = squeeze(Map_Shift_POCS_Current);
                
                Shift_POCS_Current                  = Map_Shift_POCS_Current(Row_Selected,Col_Selected);
                TPlot_Shift_POCS(iNumP,iTimePhase)  = Shift_POCS_Current;
            end
            
        end
        
        TPlot_Shift.TPlot_Shift_POCS = TPlot_Shift_POCS;
    end
    
    if ~isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
        [~,~,~,~,NTimePhase]        = size(Maps_Shift.Maps_Shift_iFFT_Smoothing);
        TPlot_Shift_iFFT_Smoothing  = zeros(NumP,NTimePhase);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            
            for iTimePhase = 1:NTimePhase
                Map_Shift_iFFT_Smoothing_Current = Maps_Shift.Maps_Shift_iFFT_Smoothing(:,:,iSlice_Current,iCoil_Current,iTimePhase);
                Map_Shift_iFFT_Smoothing_Current = squeeze(Map_Shift_iFFT_Smoothing_Current);
                
                Shift_iFFT_Smoothing_Current                  = Map_Shift_iFFT_Smoothing_Current(Row_Selected,Col_Selected);
                TPlot_Shift_iFFT_Smoothing(iNumP,iTimePhase)  = Shift_iFFT_Smoothing_Current;
            end
            
        end
        
        TPlot_Shift.TPlot_Shift_iFFT_Smoothing = TPlot_Shift_iFFT_Smoothing;
    end
    
    %handles.KESA_OnPoints_Status_tObj.String = 'Plotted ... !';
    
end


handles.SvsT_OnPoint_pObj.UserData.TPlot_Shift = TPlot_Shift;
handles.SvsT_OnPoint_pObj.UserData.Headers     = handles.TC_KESA_fObj.UserData.Headers;
handles.TC_KESA_fObj.UserData.TPlot_Shift      = TPlot_Shift;

guidata(hObject,handles);

TC_KESA_OnPoint_Plot_Cfig(handles.SvsT_OnPoint_pObj.UserData);

end