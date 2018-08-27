function [  ] = Cgro_Maps_Charts_TC( hObject,~ )
%Cgro_Maps_Charts Contain Magnitude, Temperature and Phase images over time
%   ...

handles = guidata(hObject);

handles.Maps_Charts_TC_uObj             = uipanel();
handles.Maps_Charts_TC_uObj.Parent      = handles.KESA_TC_fObj;
handles.Maps_Charts_TC_uObj.Units       = 'pixels';
handles.Maps_Charts_TC_uObj.Position    = [10 10 250 750];

guidata(hObject,handles);

Cwdg_Maps_Three(hObject);

end

