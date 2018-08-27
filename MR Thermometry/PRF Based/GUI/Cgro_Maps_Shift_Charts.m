function [  ] = Cgro_Maps_Shift_Charts( hObject,~ )
%Cwdg_Maps_Shift Contain axes() to reveal all KESA shift images
%   ...

handles = guidata(hObject);

handles.Maps_Shift_Charts_uObj          = uipanel();
handles.Maps_Shift_Charts_uObj.Parent   = handles.KESA_TC_fObj;
handles.Maps_Shift_Charts_uObj.Units    = 'pixels';
handles.Maps_Shift_Charts_uObj.Position = [500 10 500 400];

guidata(hObject,handles);

Cwdg_Maps_Shift(hObject);

end

