function [  ] = KESA_Map_Shift_Sets_Cgro( hObject,~ )
%Cgro_KESA_Result Display the results of KESA curve and map
%   ...

handles = guidata(hObject);

handles.KESA_Map_Shift_Sets_uObj            = uipanel();
handles.KESA_Map_Shift_Sets_uObj.Parent     = handles.KESA_fObj;
handles.KESA_Map_Shift_Sets_uObj.Units      = 'pixels';
handles.KESA_Map_Shift_Sets_uObj.Position   = [280 10 1000 360];


guidata(hObject,handles);

KESA_Shift_Map_Cwdg(hObject);
KESA_Run_Shift_Cwdg(hObject);

end

