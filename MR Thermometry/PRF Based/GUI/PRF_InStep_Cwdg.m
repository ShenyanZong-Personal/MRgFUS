function [  ] = PRF_InStep_Cwdg( hObject,~ )
%Cgro_Para_Setting Set and Control parameters for KESA
%   ...

handles = guidata(hObject);

handles.PRF_InStep_tObj                         = uicontrol();
handles.PRF_InStep_tObj.Parent                  = handles.PRF_fObj;
handles.PRF_InStep_tObj.Style                   = 'text';
handles.PRF_InStep_tObj.Position                = [5 25 700 25]; 
handles.PRF_InStep_tObj.FontSize                = 12;
handles.PRF_InStep_tObj.HorizontalAlignment     = 'left';
handles.PRF_InStep_tObj.String                  = 'Initialized ... !';
handles.PRF_InStep_tObj.FontName                = 'Times New Roman';


guidata(hObject,handles);

end

