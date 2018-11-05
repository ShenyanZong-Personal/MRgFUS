function [  ] = TC_KESA_Cfig( UserData )
%Cfig_TC_KESA Create figure for subsequent time-continous KESA
%   ...

handles.TC_KESA_fObj                = figure();
handles.TC_KESA_fObj.UserData       = UserData;
handles.TC_KESA_fObj.Name           = 'TC_KESA-based Thermometry';
handles.TC_KESA_fObj.NumberTitle    = 'off';
handles.TC_KESA_fObj.Position       = [50 50 1200 600];

hObject      = handles.TC_KESA_fObj;
guidata(hObject,handles);

TC_KESA_Partial_Reco_Cwdg(hObject);
TC_KESA_Run_Shift_Cwdg(hObject);
TC_KESA_Coil_Control_Cwdg(hObject);
TC_KESA_TimePhase_Control_Cwdg(hObject);
TC_KESA_OnPoint_Cwdg(hObject);

end

