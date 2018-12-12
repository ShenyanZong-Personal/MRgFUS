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
handles.Shift_Map_ColorBar_cObj.Ticks       = [-20 20];

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

