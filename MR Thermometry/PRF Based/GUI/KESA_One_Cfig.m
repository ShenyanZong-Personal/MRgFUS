function [  ] = KESA_One_Cfig( UserData )
%Cfig_KESA_fObj Begining of kspace energy spectrum analysis
%   ...


handles.KESA_One_fObj               = figure();
handles.KESA_One_fObj.UserData      = UserData;
handles.KESA_One_fObj.Name          = 'KESA-based Thermometry';
handles.KESA_One_fObj.NumberTitle   = 'off';
handles.KESA_One_fObj.Position      = [80 80 1200 400];
handles.KESA_One_fObj.Tag           = 'KESA_One';

hObject = handles.KESA_One_fObj;
guidata(hObject,handles);

KESA_Maps_Selected_Sets_Cgro(hObject);
KESA_OnPoints_Cwdg(hObject);
%KESA_Partial_Reco_Sets_Cgro(hObject);
%KESA_Map_Shift_Sets_Cgro(hObject);
KESA_Run_Shift_Cwdg(hObject);

end

