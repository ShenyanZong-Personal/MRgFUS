function [  ] = KESA_Two_Cfig( UserData )
%Cfig_KESA_fObj Begining of kspace energy spectrum analysis
%   ...


handles.KESA_Two_fObj               = figure();
handles.KESA_Two_fObj.UserData      = UserData;
handles.KESA_Two_fObj.Name          = 'KESA-based Thermometry';
handles.KESA_Two_fObj.NumberTitle   = 'off';
handles.KESA_Two_fObj.Position      = [80 80 1200 550];
handles.KESA_Two_fObj.Tag           = 'KESA_Two';

hObject = handles.KESA_Two_fObj;
guidata(hObject,handles);

%KESA_Maps_Selected_Sets_Cgro(hObject);
KESA_Partial_Reco_Sets_Cgro(hObject);
%KESA_Map_Shift_Sets_Cgro(hObject);

end

