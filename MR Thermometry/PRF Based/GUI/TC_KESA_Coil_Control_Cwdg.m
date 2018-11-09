function [  ] = TC_KESA_Coil_Control_Cwdg( hObject,~ )
%Cgro_Maps_Charts Contain Magnitude, Temperature and Phase images over time
%   ...

handles = guidata(hObject);

handles.TC_KESA_iCoil_Left_pObj             = uicontrol();
handles.TC_KESA_iCoil_Left_pObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_iCoil_Left_pObj.Style       = 'pushbutton';
handles.TC_KESA_iCoil_Left_pObj.Units       = 'pixels';
handles.TC_KESA_iCoil_Left_pObj.Position    = [700 570 20 25];
handles.TC_KESA_iCoil_Left_pObj.FontSize    = 12;
handles.TC_KESA_iCoil_Left_pObj.String      = '<';
handles.TC_KESA_iCoil_Left_pObj.Callback    = @TC_KESA_iCoil_Left_Callback;
handles.TC_KESA_iCoil_Left_pObj.FontName    = 'MS Sans Serif';

handles.TC_KESA_iCoil_Info_tObj             = uicontrol();
handles.TC_KESA_iCoil_Info_tObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_iCoil_Info_tObj.Style       = 'edit';
handles.TC_KESA_iCoil_Info_tObj.Units       = 'pixels';
handles.TC_KESA_iCoil_Info_tObj.Position    = [720 570 30 25];
handles.TC_KESA_iCoil_Info_tObj.FontSize    = 12;
handles.TC_KESA_iCoil_Info_tObj.FontName    = 'Times New Roman';
handles.TC_KESA_iCoil_Info_tObj.String      = '';

handles.TC_KESA_iCoil_Right_pObj             = uicontrol();
handles.TC_KESA_iCoil_Right_pObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_iCoil_Right_pObj.Style       = 'pushbutton';
handles.TC_KESA_iCoil_Right_pObj.Units       = 'pixels';
handles.TC_KESA_iCoil_Right_pObj.Position    = [750 570 20 25];
handles.TC_KESA_iCoil_Right_pObj.FontSize    = 12;
handles.TC_KESA_iCoil_Right_pObj.String      = '>';
handles.TC_KESA_iCoil_Right_pObj.Callback    = @TC_KESA_iCoil_Right_Callback;
handles.TC_KESA_iCoil_Right_pObj.FontName    = 'MS Sans Serif';


guidata(hObject,handles);



end

function TC_KESA_iCoil_Left_Callback(hObject,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_iCoil_Info_tObj.String)
    
else
    %Maps_Cplx           = handles.TC_KESA_fObj.UserData.Maps_Cplx;
    Maps_Shift          = handles.TC_KESA_fObj.UserData.Maps_Shift;
    %[~,~,NSlice,~,~]    = size(Maps_Cplx);
    iSlice_Current      = handles.TC_KESA_fObj.UserData.Slice_Current;
    iTimePhase_Current  = handles.TC_KESA_fObj.UserData.TimePhase_Current;
    
    
    iCoil_Current = handles.TC_KESA_fObj.UserData.Coil_Current;
    if iCoil_Current > 1
        
        iCoil_Current = iCoil_Current -1;
        
        if Maps_Shift.Maps_Shift_iFFT == 0
            
        else
            Map_Shift_iFFT = Maps_Shift.Maps_Shift_iFFT(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_iObj.CData = Map_Shift_iFFT;
        end
        
        if Maps_Shift.Maps_Shift_POCS == 0
            
        else
            Map_Shift_POCS = Maps_Shift.Maps_Shift_POCS(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_POCS_iObj.CData = Map_Shift_POCS;
        end
        
        if Maps_Shift.Maps_Shift_iFFT_Smoothing == 0
            
        else
            Map_Shift_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData = Map_Shift_iFFT_Smoothing;
        end
        
        if isscalar(Maps_Shift.Maps_Shift_iFFT) && isscalar(Maps_Shift.Maps_Shift_POCS) && isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    
        else
    
            handles.TC_KESA_iCoil_Info_tObj.String      = num2str(iCoil_Current);
            handles.TC_KESA_fObj.UserData.Coil_Current  = iCoil_Current;
            handles.TC_KESA_Info_tObj.String            = ['Infos: iSlice=' num2str(iSlice_Current) ' ' 'iCoil=' num2str(iCoil_Current) ' ' 'iFrame=' num2str(iTimePhase_Current)];
            
        end         
    end    
end



guidata(hObject,handles);

end





function TC_KESA_iCoil_Right_Callback(hObject,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_iCoil_Info_tObj.String)
    
else
    Maps_Cplx           = handles.TC_KESA_fObj.UserData.Maps_Cplx;
    Maps_Shift          = handles.TC_KESA_fObj.UserData.Maps_Shift;
    [~,~,~,NCoil,~]    = size(Maps_Cplx);
    iSlice_Current      = handles.TC_KESA_fObj.UserData.Slice_Current;
    iTimePhase_Current  = handles.TC_KESA_fObj.UserData.TimePhase_Current;
    
    
    iCoil_Current = handles.TC_KESA_fObj.UserData.Coil_Current;
    if iCoil_Current < NCoil
        
        iCoil_Current = iCoil_Current +1;
        
        if Maps_Shift.Maps_Shift_iFFT == 0
            
        else
            Map_Shift_iFFT = Maps_Shift.Maps_Shift_iFFT(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_iObj.CData = Map_Shift_iFFT;
        end
        
        if Maps_Shift.Maps_Shift_POCS == 0
            
        else
            Map_Shift_POCS = Maps_Shift.Maps_Shift_POCS(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_POCS_iObj.CData = Map_Shift_POCS;
        end
        
        if Maps_Shift.Maps_Shift_iFFT_Smoothing == 0
            
        else
            Map_Shift_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData = Map_Shift_iFFT_Smoothing;
        end
        
        if isscalar(Maps_Shift.Maps_Shift_iFFT) && isscalar(Maps_Shift.Maps_Shift_POCS) && isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    
        else
    
            handles.TC_KESA_iCoil_Info_tObj.String      = num2str(iCoil_Current);
            handles.TC_KESA_fObj.UserData.Coil_Current  = iCoil_Current;
            handles.TC_KESA_Info_tObj.String            = ['Infos: iSlice=' num2str(iSlice_Current) ' ' 'iCoil=' num2str(iCoil_Current) ' ' 'iFrame=' num2str(iTimePhase_Current)];
   
        end    
    end
end



guidata(hObject,handles);

end