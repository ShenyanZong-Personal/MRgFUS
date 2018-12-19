function [  ] = KESA_Delta_TE_Maps_Show_Cfig( UserData )
%Cwdg_KESA_Shift_Map_aObj Axes for display the kspace shift map
%   ...

handles.KESA_Delta_TE_Maps_Show_fObj                = figure();
handles.KESA_Delta_TE_Maps_Show_fObj.UserData       = UserData;
handles.KESA_Delta_TE_Maps_Show_fObj.Name           = 'Delta TE Maps';
handles.KESA_Delta_TE_Maps_Show_fObj.NumberTitle    = 'off';
handles.KESA_Delta_TE_Maps_Show_fObj.Position       = [150 150 1200 500];

hObject = handles.KESA_Delta_TE_Maps_Show_fObj;

handles.Delta_TE_Map_iFFT_aObj                  = axes();
handles.Delta_TE_Map_iFFT_aObj.Parent           = handles.KESA_Delta_TE_Maps_Show_fObj;
handles.Delta_TE_Map_iFFT_aObj.Units            = 'pixels';
handles.Delta_TE_Map_iFFT_aObj.Position         = [10 100 300 300];
handles.Delta_TE_Map_iFFT_aObj.XAxisLocation    = 'top';
handles.Delta_TE_Map_iFFT_aObj.YDir             = 'reverse';
handles.Delta_TE_Map_iFFT_aObj.XLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_aObj.YLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_aObj.XLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Column];
handles.Delta_TE_Map_iFFT_aObj.YLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Row];
handles.Delta_TE_Map_iFFT_aObj.XColor           = 'none';
handles.Delta_TE_Map_iFFT_aObj.YColor           = 'none';
handles.Delta_TE_Map_iFFT_aObj.CLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_aObj.CLim             = [-1 1];

handles.Delta_TE_Map_iFFT_aObj.Title.String     = 'Delta TE Map, iFFT';
handles.Delta_TE_Map_iFFT_aObj.Title.FontName   = 'Times New Roman';
colormap(handles.Delta_TE_Map_iFFT_aObj,'Jet');

handles.Delta_TE_Map_POCS_aObj                  = axes();
handles.Delta_TE_Map_POCS_aObj.Parent           = handles.KESA_Delta_TE_Maps_Show_fObj;
handles.Delta_TE_Map_POCS_aObj.Units            = 'pixels';
handles.Delta_TE_Map_POCS_aObj.Position         = [320 100 300 300];
handles.Delta_TE_Map_POCS_aObj.XAxisLocation    = 'top';
handles.Delta_TE_Map_POCS_aObj.YDir             = 'reverse';
handles.Delta_TE_Map_POCS_aObj.XLimMode         = 'manual';
handles.Delta_TE_Map_POCS_aObj.YLimMode         = 'manual';
handles.Delta_TE_Map_POCS_aObj.XLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Column];
handles.Delta_TE_Map_POCS_aObj.YLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Row];
handles.Delta_TE_Map_POCS_aObj.XColor           = 'none';
handles.Delta_TE_Map_POCS_aObj.YColor           = 'none';
handles.Delta_TE_Map_POCS_aObj.CLimMode         = 'manual';
handles.Delta_TE_Map_POCS_aObj.CLim             = [-1 1];

handles.Delta_TE_Map_POCS_aObj.Title.String     = 'Delta TE Map, POCS';
handles.Delta_TE_Map_POCS_aObj.Title.FontName   = 'Times New Roman';
colormap(handles.Delta_TE_Map_POCS_aObj,'Jet');

handles.Delta_TE_Map_iFFT_Smoothing_aObj                  = axes();
handles.Delta_TE_Map_iFFT_Smoothing_aObj.Parent           = handles.KESA_Delta_TE_Maps_Show_fObj;
handles.Delta_TE_Map_iFFT_Smoothing_aObj.Units            = 'pixels';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.Position         = [630 100 300 300];
handles.Delta_TE_Map_iFFT_Smoothing_aObj.XAxisLocation    = 'top';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.YDir             = 'reverse';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.XLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.YLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.XLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Column];
handles.Delta_TE_Map_iFFT_Smoothing_aObj.YLim             = [0.5 handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.Row];
handles.Delta_TE_Map_iFFT_Smoothing_aObj.XColor           = 'none';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.YColor           = 'none';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.CLimMode         = 'manual';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.CLim             = [-1 1];

handles.Delta_TE_Map_iFFT_Smoothing_aObj.Title.String     = 'Delta TE Map, iFFT-S';
handles.Delta_TE_Map_iFFT_Smoothing_aObj.Title.FontName   = 'Times New Roman';
colormap(handles.Delta_TE_Map_iFFT_Smoothing_aObj,'Jet');

guidata(hObject,handles);

Shift_Maps = handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Shift_Maps;

PixelBW     = handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.PixelBW;
N_Freq      = handles.KESA_Delta_TE_Maps_Show_fObj.UserData.Headers.FrequencySampling;
Double_BW   = PixelBW*N_Freq;

if isscalar(Shift_Maps.Map_Shift_iFFT)
    
else 
    
    Delta_TE_Map_iFFT = Shift_Maps.Map_Shift_iFFT.*( 1/Double_BW );
    
    handles.Delta_TE_Map_iFFT_iObj                  = image();
    handles.Delta_TE_Map_iFFT_iObj.Parent           = handles.Delta_TE_Map_iFFT_aObj;
    handles.Delta_TE_Map_iFFT_iObj.CDataMapping     = 'scaled';
    handles.Delta_TE_Map_iFFT_iObj.CData            = Delta_TE_Map_iFFT;
    
end

if isscalar(Shift_Maps.Map_Shift_POCS)
    
else 
    
    Delta_TE_Map_POCS = Shift_Maps.Map_Shift_POCS.*( 1/Double_BW );
    
    handles.Delta_TE_Map_POCS_iObj                  = image();
    handles.Delta_TE_Map_POCS_iObj.Parent           = handles.Delta_TE_Map_POCS_aObj;
    handles.Delta_TE_Map_POCS_iObj.CDataMapping     = 'scaled';
    handles.Delta_TE_Map_POCS_iObj.CData            = Delta_TE_Map_POCS;
    
end

if isscalar(Shift_Maps.Map_Shift_iFFT_Smoothing)
    
else 
    
    Delta_TE_Map_iFFT_Smoothing = Shift_Maps.Map_Shift_iFFT_Smoothing.*( 1/Double_BW );
    
    handles.Delta_TE_Map_iFFT_Smoothing_iObj                  = image();
    handles.Delta_TE_Map_iFFT_Smoothing_iObj.Parent           = handles.Delta_TE_Map_iFFT_Smoothing_aObj;
    handles.Delta_TE_Map_iFFT_Smoothing_iObj.CDataMapping     = 'scaled';
    handles.Delta_TE_Map_iFFT_Smoothing_iObj.CData            = Delta_TE_Map_iFFT_Smoothing;
    
end

end

%function 


















%end