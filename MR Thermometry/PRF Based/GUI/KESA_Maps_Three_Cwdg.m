function [ ] = KESA_Maps_Three_Cwdg( hObject,~ )
%Cwdg_Image_Magnitude Exhibit magnitude image for KESA thermometry
%   ...

handles = guidata(hObject);

Row         = handles.KESA_One_fObj.UserData.Headers.Row;
Col         = handles.KESA_One_fObj.UserData.Headers.Column;
Magni_Map   = handles.KESA_One_fObj.UserData.Magni_Map_Current;
TMap        = handles.KESA_One_fObj.UserData.TMap_Current;
Phase_Map   = handles.KESA_One_fObj.UserData.Phase_Map_Current;

%---Orignal Magnitude Image
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj                = axes();
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Parent         = handles.KESA_Maps_Selected_Sets_uObj;
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Units          = 'pixels';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Position       = [5 15 250 250];
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.XAxisLocation  = 'top';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.YDir           = 'reverse';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.XLimMode       = 'manual';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.YLimMode       = 'manual';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.XLim           = [0.5 Row+0.5];
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.YLim           = [0.5 Col+0.5];
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.XColor         = 'none';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.YColor         = 'none';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Title.String   = 'Magnitude Map';
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Title.FontSize = 12;
handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj.Title.FontName = 'Times New Roman';
colormap(handles.KESA_Maps_Three_Obj.Image_Magnitude_aObj,'Gray');

handles.KESA_Maps_Three_Obj.Magnitude_iObj                  = image();
handles.KESA_Maps_Three_Obj.Magnitude_iObj.CData            = Magni_Map;
handles.KESA_Maps_Three_Obj.Magnitude_iObj.CDataMapping     = 'scaled';

%---Original Temperature Image
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj                  = axes();
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Parent           = handles.KESA_Maps_Selected_Sets_uObj;
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Units            = 'pixels';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Position         = [260 15 250 250];
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.XAxisLocation    = 'top';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.YDir             = 'reverse';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.XLimMode         = 'manual';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.YLimMode         = 'manual';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.XLim             = [0.5 Row+0.5];
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.YLim             = [0.5 Col+0.5];
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.XColor           = 'none';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.YColor           = 'none';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Title.String     = 'Temperature Map';
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Title.FontSize   = 12;
handles.KESA_Maps_Three_Obj.Image_Temperature_aObj.Title.FontName   = 'Times New Roman';
colormap(handles.KESA_Maps_Three_Obj.Image_Temperature_aObj,'Jet');

handles.KESA_Maps_Three_Obj.Temperature_iObj                 = image();
handles.KESA_Maps_Three_Obj.Temperature_iObj.CData           = TMap;
handles.KESA_Maps_Three_Obj.Temperature_iObj.CDataMapping    = 'scaled';

%---Original kspace
%{
handles.Image_kspace = axes();
handles.Image_kspace.Parent             = handles.Image_Original;
handles.Image_kspace.Units              = 'pixels';
handles.Image_kspace.Position           = [10 10 200 200];
handles.Image_kspace.XAxisLocation      = 'top';
handles.Image_kspace.YDir               = 'reverse';
handles.Image_kspace.XLimMode           = 'manual';
handles.Image_kspace.YLimMode           = 'manual';
handles.Image_kspace.XLim               = [0.5 row+0.5];
handles.Image_kspace.YLim               = [0.5 col+0.5];
handles.Image_kspace.XColor             = 'none';
handles.Image_kspace.YColor             = 'none';
colormap(handles.Image_kspace,'Gray');

handles.kspace = image();
kspace = abs( fftshift( fft2(Map_Magn) ) );
handles.kspace.CData        = kspace;
handles.kspace.CDataMapping = 'scaled';  
%}

%---Original Phase Map
%Its position is identical to the location of Image_kspace axes()
handles.KESA_Maps_Three_Obj.Image_Phase_aObj                 = axes();
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Parent          = handles.KESA_Maps_Selected_Sets_uObj;
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Units           = 'pixels';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Position        = [520 15 250 250];
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.XAxisLocation   = 'top';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.YDir            = 'reverse';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.XLimMode        = 'manual';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.YLimMode        = 'manual';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.XLim            = [0.5 Row+0.5];
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.YLim            = [0.5 Col+0.5];
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.XColor          = 'none';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.YColor          = 'none';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Title.String    = 'Phase Map';
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Title.FontSize  = 12;
handles.KESA_Maps_Three_Obj.Image_Phase_aObj.Title.FontName  = 'Times New Roman';
colormap(handles.KESA_Maps_Three_Obj.Image_Phase_aObj,'Gray');

handles.KESA_Maps_Three_Obj.Phase_iObj               = image();
handles.KESA_Maps_Three_Obj.Phase_iObj.CData         = Phase_Map;
handles.KESA_Maps_Three_Obj.Phase_iObj.CDataMapping  = 'scaled';

handles.KESA_Selected_Maps_Info_tObj                        = uicontrol();
handles.KESA_Selected_Maps_Info_tObj.Parent                 = handles.KESA_One_fObj;
handles.KESA_Selected_Maps_Info_tObj.Style                  = 'text';
handles.KESA_Selected_Maps_Info_tObj.Position               = [15 360 500 25];
handles.KESA_Selected_Maps_Info_tObj.FontSize               = 12;
handles.KESA_Selected_Maps_Info_tObj.FontName               = 'Times New Roman';
handles.KESA_Selected_Maps_Info_tObj.HorizontalAlignment    = 'left';
handles.KESA_Selected_Maps_Info_tObj.String                 = ['Slice: ' num2str(handles.KESA_One_fObj.UserData.Slice_Current) ';' ' ' ...
    'Coil: ' num2str(handles.KESA_One_fObj.UserData.Coil_Current) ';' ' ' ... 
    'Frame: ' num2str(handles.KESA_One_fObj.UserData.TimePhase_Current)];

handles.KESA_Status_Info_tObj                       = uicontrol();
handles.KESA_Status_Info_tObj.Parent                = handles.KESA_One_fObj;
handles.KESA_Status_Info_tObj.Style                 = 'text';
handles.KESA_Status_Info_tObj.Position              = [15 25 500 25];
handles.KESA_Status_Info_tObj.FontSize              = 12;
handles.KESA_Status_Info_tObj.FontName              = 'Times New Roman';
handles.KESA_Status_Info_tObj.HorizontalAlignment   = 'left';
handles.KESA_Status_Info_tObj.String                = 'Received Maps ... !';

guidata(hObject,handles);

end

