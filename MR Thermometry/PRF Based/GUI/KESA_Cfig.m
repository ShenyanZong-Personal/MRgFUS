function [  ] = KESA_Cfig( UserData )
%Cfig_KESA_fObj Begining of kspace energy spectrum analysis
%   ...


handles.KESA_fObj               = figure();
handles.KESA_fObj.UserData      = UserData;
handles.KESA_fObj.Name          = 'KESA-based Thermometry';
handles.KESA_fObj.NumberTitle   = 'off';
handles.KESA_fObj.Position      = [100 100 1400 800];

hObject = handles.KESA_fObj;
guidata(hObject,handles);

KESA_Maps_Selected_Sets_Cgro(hObject);
KESA_Partial_Reco_Sets_Cgro(hObject);
KESA_Map_Shift_Sets_Cgro(hObject);

end

