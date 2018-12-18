function [  ] = KESA_Shift_Maps_Show_Cfig( UserData )
%KESA_OnPoints_Plot_Cwdg ...
%   ...

handles.KESA_Shift_Maps_Show_fObj             = figure();
handles.KESA_Shift_Maps_Show_fObj.UserData    = UserData;
handles.KESA_Shift_Maps_Show_fObj.Name        = 'Shift Maps';
handles.KESA_Shift_Maps_Show_fObj.NumberTitle = 'off';
handles.KESA_Shift_Maps_Show_fObj.Position    = [150 150 1200 500];

hObject = handles.KESA_Shift_Maps_Show_fObj;

handles.Shift_Map_iFFT_aObj                 = axes();
handles.Shift_Map_iFFT_aObj.Parent          = handles.KESA_Shift_Maps_Show_fObj;
handles.Shift_Map_iFFT_aObj.Units           = 'pixels';
handles.Shift_Map_iFFT_aObj.Position        = [10 100 300 300];
handles.Shift_Map_iFFT_aObj.XAxisLocation   = 'top';
handles.Shift_Map_iFFT_aObj.YDir            = 'reverse';
handles.Shift_Map_iFFT_aObj.XLimMode        = 'manual';
handles.Shift_Map_iFFT_aObj.YLimMode        = 'manual';
handles.Shift_Map_iFFT_aObj.XLim            = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Column];
handles.Shift_Map_iFFT_aObj.YLim            = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Row];
handles.Shift_Map_iFFT_aObj.XColor          = 'none';
handles.Shift_Map_iFFT_aObj.YColor          = 'none';
handles.Shift_Map_iFFT_aObj.CLimMode        = 'manual';
handles.Shift_Map_iFFT_aObj.CLim            = [-20 20];

handles.Shift_Map_iFFT_aObj.Title.String    = 'Shift Map, iFFT';
handles.Shift_Map_iFFT_aObj.Title.FontName  = 'Times New Roman';
colormap(handles.Shift_Map_iFFT_aObj,'Jet');

handles.Shift_Map_POCS_aObj                 = axes();
handles.Shift_Map_POCS_aObj.Parent          = handles.KESA_Shift_Maps_Show_fObj;
handles.Shift_Map_POCS_aObj.Units           = 'pixels';
handles.Shift_Map_POCS_aObj.Position        = [320 100 300 300];
handles.Shift_Map_POCS_aObj.XAxisLocation   = 'top';
handles.Shift_Map_POCS_aObj.YDir            = 'reverse';
handles.Shift_Map_POCS_aObj.XLimMode        = 'manual';
handles.Shift_Map_POCS_aObj.YLimMode        = 'manual';
handles.Shift_Map_POCS_aObj.XLim            = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Column];
handles.Shift_Map_POCS_aObj.YLim            = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Row];
handles.Shift_Map_POCS_aObj.XColor          = 'none';
handles.Shift_Map_POCS_aObj.YColor          = 'none';
handles.Shift_Map_POCS_aObj.CLimMode        = 'manual';
handles.Shift_Map_POCS_aObj.CLim            = [-20 20];

handles.Shift_Map_POCS_aObj.Title.String    = 'Shift Map, POCS';
handles.Shift_Map_POCS_aObj.Title.FontName  = 'Times New Roman';
colormap(handles.Shift_Map_POCS_aObj,'Jet');

handles.Shift_Map_iFFT_Smoothing_aObj                   = axes();
handles.Shift_Map_iFFT_Smoothing_aObj.Parent            = handles.KESA_Shift_Maps_Show_fObj;
handles.Shift_Map_iFFT_Smoothing_aObj.Units             = 'pixels';
handles.Shift_Map_iFFT_Smoothing_aObj.Position          = [630 100 300 300];
handles.Shift_Map_iFFT_Smoothing_aObj.XAxisLocation     = 'top';
handles.Shift_Map_iFFT_Smoothing_aObj.YDir              = 'reverse';
handles.Shift_Map_iFFT_Smoothing_aObj.XLimMode          = 'manual';
handles.Shift_Map_iFFT_Smoothing_aObj.YLimMode          = 'manual';
handles.Shift_Map_iFFT_Smoothing_aObj.XLim              = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Column];
handles.Shift_Map_iFFT_Smoothing_aObj.YLim              = [0.5 handles.KESA_Shift_Maps_Show_fObj.UserData.Headers.Row];
handles.Shift_Map_iFFT_Smoothing_aObj.XColor            = 'none';
handles.Shift_Map_iFFT_Smoothing_aObj.YColor            = 'none';
handles.Shift_Map_iFFT_Smoothing_aObj.CLimMode          = 'manual';
handles.Shift_Map_iFFT_Smoothing_aObj.CLim              = [-20 20];

handles.Shift_Map_iFFT_Smoothing_aObj.Title.String      = 'Shift Map, iFFT-S';
handles.Shift_Map_iFFT_Smoothing_aObj.Title.FontName    = 'Times New Roman';
colormap(handles.Shift_Map_iFFT_Smoothing_aObj,'Jet');

handles.Shift_Map_ColorBar_cObj             = colorbar();
handles.Shift_Map_ColorBar_cObj.Parent      = handles.KESA_Shift_Maps_Show_fObj;
handles.Shift_Map_ColorBar_cObj.Location    = 'manual';
handles.Shift_Map_ColorBar_cObj.Units       = 'pixels';
handles.Shift_Map_ColorBar_cObj.Position    = [940 100 20 300];
handles.Shift_Map_ColorBar_cObj.TicksMode   = 'manual';
handles.Shift_Map_ColorBar_cObj.Ticks       = [-20 20];

handles.CLim_Up_Control_sObj            = uicontrol();
handles.CLim_Up_Control_sObj.Parent     = handles.KESA_Shift_Maps_Show_fObj;
handles.CLim_Up_Control_sObj.Style      = 'slider';
handles.CLim_Up_Control_sObj.Units      = 'pixels';
handles.CLim_Up_Control_sObj.Position   = [985 387 20 26];
handles.CLim_Up_Control_sObj.Value      = 20;
handles.CLim_Up_Control_sObj.Min        = -40;
handles.CLim_Up_Control_sObj.Max        = 40;
handles.CLim_Up_Control_sObj.SliderStep = [1/80 1/80];
handles.CLim_Up_Control_sObj.Callback   = @CLim_Up_Control_Callback;

handles.CLim_Down_Control_sObj              = uicontrol();
handles.CLim_Down_Control_sObj.Parent       = handles.KESA_Shift_Maps_Show_fObj;
handles.CLim_Down_Control_sObj.Style        = 'slider';
handles.CLim_Down_Control_sObj.Units        = 'pixels';
handles.CLim_Down_Control_sObj.Position     = [985 87 20 26];
handles.CLim_Down_Control_sObj.Value        = -20;
handles.CLim_Down_Control_sObj.Min          = -40;
handles.CLim_Down_Control_sObj.Max          = 40;
handles.CLim_Down_Control_sObj.SliderStep   = [1/80 1/80];
handles.CLim_Down_Control_sObj.Callback     = @CLim_Down_Control_Callback;

handles.ShiftPixel_To_ShiftTE_pObj          = uicontrol();
handles.ShiftPixel_To_ShiftTE_pObj.Parent   = handles.KESA_Shift_Maps_Show_fObj;
handles.ShiftPixel_To_ShiftTE_pObj.Style    = 'pushbutton';
handles.ShiftPixel_To_ShiftTE_pObj.Units    = 'pixels';
handles.ShiftPixel_To_ShiftTE_pObj.Position = [1030 370 80 30];
handles.ShiftPixel_To_ShiftTE_pObj.String   = 'Dk to DTE';
handles.ShiftPixel_To_ShiftTE_pObj.FontSize = 12;
handles.ShiftPixel_To_ShiftTE_pObj.FontName = 'Times New Roman';
handles.ShiftPixel_To_ShiftTE_pObj.Callback = @Convert_To_Delta_TE;


Shift_Maps = UserData.Maps_Shift;

if isscalar(Shift_Maps.Map_Shift_iFFT)
    
else
    
    handles.Shift_Map_iFFT_iObj                 = image();
    handles.Shift_Map_iFFT_iObj.Parent          = handles.Shift_Map_iFFT_aObj;
    handles.Shift_Map_iFFT_iObj.CDataMapping    = 'scaled';
    handles.Shift_Map_iFFT_iObj.CData           = Shift_Maps.Map_Shift_iFFT;
    
end

if isscalar(Shift_Maps.Map_Shift_POCS)
    
else
    
    handles.Shift_Map_POCS_iObj                 = image();
    handles.Shift_Map_POCS_iObj.Parent          = handles.Shift_Map_POCS_aObj;
    handles.Shift_Map_POCS_iObj.CDataMapping    = 'scaled';
    handles.Shift_Map_POCS_iObj.CData           = Shift_Maps.Map_Shift_POCS;
end

if isscalar(Shift_Maps.Map_Shift_iFFT_Smoothing)
    
else
    
    handles.Shift_Map_iFFT_Smoothing_iObj               = image();
    handles.Shift_Map_iFFT_Smoothing_iObj.Parent        = handles.Shift_Map_iFFT_Smoothing_aObj;
    handles.Shift_Map_iFFT_Smoothing_iObj.CDataMapping  = 'scaled';
    handles.Shift_Map_iFFT_Smoothing_iObj.CData         = Shift_Maps.Map_Shift_iFFT_Smoothing;
    
end

guidata(hObject,handles);
%{
handles = guidata(hObject);

%Row = handles.KESA_fObj.UserData.Headers.Row;
Col = handles.KESA_fObj.UserData.Headers.Column;

handles.KESA_OnPoints_Plot_aObj                 = axes();
handles.KESA_OnPoints_Plot_aObj.Parent          = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_OnPoints_Plot_aObj.Units           = 'pixels';
handles.KESA_OnPoints_Plot_aObj.Position        = [480 25 450 320];
%handles.KESA_OnPoints_Plot_aObj.XAxisLocation   = 'top';
%handles.KESA_OnPoints_Plot_aObj.YDir            = 'reverse';
%handles.KESA_OnPoints_Plot_aObj.XColor          = 'none';
%handles.KESA_OnPoints_Plot_aObj.YColor          = 'none';
handles.KESA_OnPoints_Plot_aObj.XLimMode        = 'manual';
handles.KESA_OnPoints_Plot_aObj.XLim            = [0 Col];
handles.KESA_OnPoints_Plot_aObj.YLimMode        = 'manual';
handles.KESA_OnPoints_Plot_aObj.YLim            = [0 1];

guidata(hObject,handles);
%}
end


function CLim_Up_Control_Callback( hObject,~ )

handles = guidata(hObject);

CLim_Up_Current     = handles.CLim_Up_Control_sObj.Value;
CLim_Down_Current   = handles.CLim_Down_Control_sObj.Value;

if CLim_Up_Current > CLim_Down_Current
    
    CLim_Current = [CLim_Down_Current CLim_Up_Current];
    
    handles.Shift_Map_ColorBar_cObj.Ticks       = CLim_Current;
    handles.Shift_Map_iFFT_aObj.CLim            = CLim_Current;
    handles.Shift_Map_POCS_aObj.CLim            = CLim_Current;
    handles.Shift_Map_iFFT_Smoothing_aObj.CLim  = CLim_Current;
    
else
    
    CLim_Current = [CLim_Down_Current (CLim_Down_Current+1)];
    
    handles.CLim_Up_Control_sObj.Value          = CLim_Down_Current +1;
    handles.Shift_Map_ColorBar_cObj.Ticks       = CLim_Current;
    handles.Shift_Map_iFFT_aObj.CLim            = CLim_Current;
    handles.Shift_Map_POCS_aObj.CLim            = CLim_Current;
    handles.Shift_Map_iFFT_Smoothing_aObj.CLim  = CLim_Current;

end

guidata(hObject,handles);

end

function CLim_Down_Control_Callback( hObject,~ )

handles = guidata(hObject);

CLim_Up_Current     = handles.CLim_Up_Control_sObj.Value;
CLim_Down_Current   = handles.CLim_Down_Control_sObj.Value;

if CLim_Down_Current < CLim_Up_Current
    
    CLim_Current = [CLim_Down_Current CLim_Up_Current];
    
    handles.Shift_Map_ColorBar_cObj.Ticks       = CLim_Current;
    handles.Shift_Map_iFFT_aObj.CLim            = CLim_Current;
    handles.Shift_Map_POCS_aObj.CLim            = CLim_Current;
    handles.Shift_Map_iFFT_Smoothing_aObj.CLim  = CLim_Current;
    
else
    
    CLim_Current = [(CLim_Down_Current-1) CLim_Up_Current];
    
    handles.CLim_Down_Control_sObj.Value        = CLim_Up_Current -1;
    handles.Shift_Map_ColorBar_cObj.Ticks       = CLim_Current;
    handles.Shift_Map_iFFT_aObj.CLim            = CLim_Current;
    handles.Shift_Map_POCS_aObj.CLim            = CLim_Current;
    handles.Shift_Map_iFFT_Smoothing_aObj.CLim  = CLim_Current;
    
end

guidata(hObject,handles);

end

function Convert_To_Delta_TE( hObject,~ )

handles = guidata(hObject);

%KESA_Delta_TE_Maps_Show_Cfig( handles. );

UserData.Headers    = handles.KESA_Shift_Maps_Show_fObj.UserData.Headers;
UserData.Shift_Maps = handles.KESA_Shift_Maps_Show_fObj.UserData.Maps_Shift;

KESA_Delta_TE_Maps_Show_Cfig(UserData);

guidata(hObject,handles);

end
