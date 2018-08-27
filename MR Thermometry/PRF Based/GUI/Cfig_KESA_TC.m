function [  ] = Cfig_KESA_TC( UserData )
%Cfig_KESA_TC Create figure for subsequent time-continous KESA
%   ...

handles.KESA_TC_fObj                = figure();
handles.KESA_TC_fObj.UserData       = UserData;
handles.KESA_TC_fObj.Name           = 'KESA TC Thermometry';
handles.KESA_TC_fObj.NumberTitle    = 'off';
handles.KESA_TC_fObj.Position       = [150 150 1400 800];

hObject      = handles.KESA_TC_fObj;
guidata(hObject,handles);

Cgro_Maps_Charts_TC(hObject);
Cgro_Reco_PF_Charts(hObject);
Cgro_KESA_TC_Setting(hObject);

end

