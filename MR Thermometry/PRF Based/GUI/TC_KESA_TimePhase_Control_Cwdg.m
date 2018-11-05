function [  ] = TC_KESA_TimePhase_Control_Cwdg( hObject,~ )
%Cwdg_Proc_Message Indicate KESA process step by step
%   ...

handles = guidata(hObject);

handles.TC_KESA_iTimePhase_Info_tObj            = uicontrol();
handles.TC_KESA_iTimePhase_Info_tObj.Parent     = handles.TC_KESA_fObj;
handles.TC_KESA_iTimePhase_Info_tObj.Style      = 'edit';
handles.TC_KESA_iTimePhase_Info_tObj.FontName   = 'Times New Roman';
handles.TC_KESA_iTimePhase_Info_tObj.FontSize   = 12;
handles.TC_KESA_iTimePhase_Info_tObj.Units      = 'pixels';
handles.TC_KESA_iTimePhase_Info_tObj.Position   = [720 540 30 25];


guidata(hObject,handles);

end

