function [  ] = TC_KESA_Cfig( UserData )
%Cfig_TC_KESA Create figure for subsequent time-continous KESA
%   ...

handles.TC_KESA_fObj                = figure();
handles.TC_KESA_fObj.UserData       = UserData;
handles.TC_KESA_fObj.Name           = 'TC_KESA-based Thermometry';
handles.TC_KESA_fObj.NumberTitle    = 'off';
handles.TC_KESA_fObj.Position       = [150 150 1400 800];

hObject      = handles.TC_KESA_fObj;
guidata(hObject,handles);

TC_KESA_Partial_Reco_Cwdg(hObject);
%Cgro_Reco_PF_Charts(hObject);
%Cgro_TC_KESA_Setting(hObject);

end

