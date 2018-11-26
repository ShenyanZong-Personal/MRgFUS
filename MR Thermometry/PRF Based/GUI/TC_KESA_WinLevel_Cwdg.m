function [  ] = TC_KESA_WinLevel_Cwdg( hObject,~ )
%Cwdg_Maps_Reco_Proc 
%   ...

handles = guidata(hObject);

handles.TC_KESA_Shift_Win_Up_tObj           = uicontrol();
handles.TC_KESA_Shift_Win_Up_tObj.Parent    = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Up_tObj.Style     = 'edit';
handles.TC_KESA_Shift_Win_Up_tObj.Units     = 'pixels';
handles.TC_KESA_Shift_Win_Up_tObj.Position  = [720 510 30 25];
handles.TC_KESA_Shift_Win_Up_tObj.FontSize  = 12;
handles.TC_KESA_Shift_Win_Up_tObj.FontName  = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Up_tObj.String    = '';

handles.TC_KESA_Shift_Win_Down_tObj             = uicontrol();
handles.TC_KESA_Shift_Win_Down_tObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Down_tObj.Style       = 'edit';
handles.TC_KESA_Shift_Win_Down_tObj.Units       = 'pixels';
handles.TC_KESA_Shift_Win_Down_tObj.Position    = [720 485 30 25];
handles.TC_KESA_Shift_Win_Down_tObj.FontSize    = 12;
handles.TC_KESA_Shift_Win_Down_tObj.FontName    = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Down_tObj.String      = '';

handles.TC_KESA_Shift_Win_Up_L_pObj             = uicontrol();
handles.TC_KESA_Shift_Win_Up_L_pObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Up_L_pObj.Style       = 'pushbutton';
handles.TC_KESA_Shift_Win_Up_L_pObj.Units       = 'pixels';
handles.TC_KESA_Shift_Win_Up_L_pObj.Position    = [700 510 20 25];
handles.TC_KESA_Shift_Win_Up_L_pObj.FontSize    = 12;
handles.TC_KESA_Shift_Win_Up_L_pObj.FontName    = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Up_L_pObj.String      = '<';
handles.TC_KESA_Shift_Win_Up_L_pObj.Callback    = @Shift_Win_Up_L_Callback;

handles.TC_KESA_Shift_Win_Up_R_pObj             = uicontrol();
handles.TC_KESA_Shift_Win_Up_R_pObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Up_R_pObj.Style       = 'pushbutton';
handles.TC_KESA_Shift_Win_Up_R_pObj.Units       = 'pixels';
handles.TC_KESA_Shift_Win_Up_R_pObj.Position    = [750 510 20 25];
handles.TC_KESA_Shift_Win_Up_R_pObj.FontSize    = 12;
handles.TC_KESA_Shift_Win_Up_R_pObj.FontName    = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Up_R_pObj.String      = '>';
handles.TC_KESA_Shift_Win_Up_R_pObj.Callback    = @Shift_Win_Up_R_Callback;

handles.TC_KESA_Shift_Win_Down_L_pObj           = uicontrol();
handles.TC_KESA_Shift_Win_Down_L_pObj.Parent    = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Down_L_pObj.Style     = 'pushbutton';
handles.TC_KESA_Shift_Win_Down_L_pObj.Units     = 'pixels';
handles.TC_KESA_Shift_Win_Down_L_pObj.Position  = [700 485 20 25];
handles.TC_KESA_Shift_Win_Down_L_pObj.FontSize  = 12;
handles.TC_KESA_Shift_Win_Down_L_pObj.FontName  = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Down_L_pObj.String    = '<';
handles.TC_KESA_Shift_Win_Down_L_pObj.Callback  = @Shift_Win_Down_L_Callback;

handles.TC_KESA_Shift_Win_Down_R_pObj           = uicontrol();
handles.TC_KESA_Shift_Win_Down_R_pObj.Parent    = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Win_Down_R_pObj.Style     = 'pushbutton';
handles.TC_KESA_Shift_Win_Down_R_pObj.Units     = 'pixels';
handles.TC_KESA_Shift_Win_Down_R_pObj.Position  = [750 485 20 25];
handles.TC_KESA_Shift_Win_Down_R_pObj.FontSize  = 12;
handles.TC_KESA_Shift_Win_Down_R_pObj.FontName  = 'MS Sans Serif';
handles.TC_KESA_Shift_Win_Down_R_pObj.String    = '>';
handles.TC_KESA_Shift_Win_Down_R_pObj.Callback  = @Shift_Win_Down_R_Callback;


guidata(hObject,handles);

end

function Shift_Win_Up_L_Callback(hObject,~) 

handles = guidata(hObject);

if isempty(handles.TC_KESA_Shift_Win_Up_tObj.String)
    
else
    
    CLim        = handles.TC_KESA_fObj.UserData.CLim;
    CLim_Upper  = CLim(2);
    CLim_Lower  = CLim(1);
    
    if CLim_Upper > (CLim_Lower +1)
        
        CLim_Upper  = CLim_Upper -1;
        CLim        = [CLim_Lower CLim_Upper];
        
        handles.TC_KESA_SM_iFFT_aObj.CLim           = CLim;
        handles.TC_KESA_SM_POCS_aObj.CLim           = CLim;
        handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLim = CLim;
        
        handles.TC_KESA_Shift_Win_Up_tObj.String    = num2str(CLim_Upper);
        handles.TC_KESA_fObj.UserData.CLim          = CLim;
        
    end

end

guidata(hObject,handles);

end

function Shift_Win_Up_R_Callback(hObject,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_Shift_Win_Up_tObj.String)
    
else
    
    CLim        = handles.TC_KESA_fObj.UserData.CLim;
    CLim_Upper  = CLim(2);
    CLim_Lower  = CLim(1);
    
    PE_Number   = handles.TC_KESA_fObj.UserData.Headers.PhaseSampling;
    if CLim_Upper < ceil(PE_Number/2)
        
        CLim_Upper  = CLim_Upper +1;
        CLim        = [CLim_Lower CLim_Upper];
        
        handles.TC_KESA_SM_iFFT_aObj.CLim           = CLim;
        handles.TC_KESA_SM_POCS_aObj.CLim           = CLim;
        handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLim = CLim;
        
        handles.TC_KESA_Shift_Win_Up_tObj.String    = num2str(CLim_Upper);
        handles.TC_KESA_fObj.UserData.CLim          = CLim;
        
    end
    
end


guidata(hObject,handles);

end

function Shift_Win_Down_L_Callback(hObject,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_Shift_Win_Down_tObj.String)
    
else
    
    CLim        = handles.TC_KESA_fObj.UserData.CLim;
    CLim_Upper  = CLim(2);
    CLim_Lower  = CLim(1);
    
    PE_Number   = handles.TC_KESA_fObj.UserData.Headers.PhaseSampling;
    if CLim_Lower > -ceil(PE_Number/2)
        
        CLim_Lower  = CLim_Lower -1;
        CLim        = [CLim_Lower CLim_Upper];
        
        handles.TC_KESA_SM_iFFT_aObj.CLim           = CLim;
        handles.TC_KESA_SM_POCS_aObj.CLim           = CLim;
        handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLim = CLim;
        
        handles.TC_KESA_Shift_Win_Down_tObj.String  = num2str(CLim_Lower);
        handles.TC_KESA_fObj.UserData.CLim          = CLim;
    end

end

guidata(hObject,handles);

end

function Shift_Win_Down_R_Callback(hObject,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_Shift_Win_Down_tObj.String)
    
else
    
    CLim        = handles.TC_KESA_fObj.UserData.CLim;
    CLim_Upper  = CLim(2);
    CLim_Lower  = CLim(1);
    
    if CLim_Lower < (CLim_Upper-1)
        
        CLim_Lower  = CLim_Lower +1;
        CLim        = [CLim_Lower CLim_Upper];
        
        handles.TC_KESA_SM_iFFT_aObj.CLim           = CLim;
        handles.TC_KESA_SM_POCS_aObj.CLim           = CLim;
        handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLim = CLim;
        
        handles.TC_KESA_Shift_Win_Down_tObj.String  = num2str(CLim_Lower);
        handles.TC_KESA_fObj.UserData.CLim          = CLim;
    end
end


guidata(hObject,handles);

end









