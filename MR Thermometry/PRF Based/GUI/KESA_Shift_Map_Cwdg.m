function [  ] = KESA_Shift_Map_Cwdg( hObject,~ )
%Cwdg_KESA_Shift_Map_aObj Axes for display the kspace shift map
%   ...

handles = guidata(hObject);

Row = handles.KESA_fObj.UserData.Headers.Row;
Col = handles.KESA_fObj.UserData.Headers.Column;

handles.KESA_Shift_Map_aObj                 = axes();
handles.KESA_Shift_Map_aObj.Parent          = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_Shift_Map_aObj.Units           = 'pixels';
handles.KESA_Shift_Map_aObj.Position        = [5 5 350 350];
handles.KESA_Shift_Map_aObj.XAxisLocation   = 'top';
handles.KESA_Shift_Map_aObj.YDir            = 'reverse';
handles.KESA_Shift_Map_aObj.XColor          = 'none';
handles.KESA_Shift_Map_aObj.YColor          = 'none';
handles.KESA_Shift_Map_aObj.XLimMode        = 'manual';
handles.KESA_Shift_Map_aObj.XLim            = [0.5 Col+0.5];
handles.KESA_Shift_Map_aObj.YLimMode        = 'manual';
handles.KESA_Shift_Map_aObj.YLim            = [0.5 Row+0.5];


guidata(hObject,handles);


end

