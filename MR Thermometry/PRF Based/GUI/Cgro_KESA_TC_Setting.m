function [  ] = Cgro_KESA_TC_Setting( hObject,~ )
%Cgro_Para_Setting Set and Control parameters for KESA
%   ...

handles = guidata(hObject);

handles.KESA_TC_Setting_uObj            = uipanel();
handles.KESA_TC_Setting_uObj.Parent     = handles.KESA_TC_fObj;
handles.KESA_TC_Setting_uObj.Units      = 'pixels';
handles.KESA_TC_Setting_uObj.Position   = [280 10 200 400];


guidata(hObject,handles);

Cwdg_PF_Algori(hObject);
Cwdg_KESA_TC_Start(hObject);
Cwdg_Proc_Message(hObject);

end

