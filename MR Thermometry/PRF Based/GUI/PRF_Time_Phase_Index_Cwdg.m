function [ ] = PRF_Time_Phase_Index_Cwdg( hObject,~ )
% Cwdg_PhaseScroll Indicate temporal phase of images by wheel 
%   ...

handles = guidata(hObject);

handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj                       = uicontrol();
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.Style                 = 'text';
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.Parent                = handles.PRF_Sets_uObj;
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.String                = 'TimePhase';
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.FontSize              = 12;
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.HorizontalAlignment   = 'center';
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.Position              = [525 40 100 20];
handles.PRF_Time_Phase_Index_Obj.Time_Phase_tObj.FontName              = 'Segoe UI';

handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj                   = uicontrol();
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.Style             = 'text';
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.Parent            = handles.PRF_Sets_uObj;
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.BackgroundColor   = 'w';
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.FontSize          = 10;
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.Position          = [515 15 120 20];
handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.FontName          = 'Segoe UI';

guidata(hObject,handles);

end

