function [  ] = PRF_Para_Cwdg( hObject,~ )
%ParametersOn Exhibit MR scanned parameters
%   ...

handles = guidata(hObject);

handles.PRF_Para_Obj.Paras_tObj                     = uicontrol();
handles.PRF_Para_Obj.Paras_tObj.Style               = 'text';
handles.PRF_Para_Obj.Paras_tObj.Parent              = handles.PRF_Sets_uObj;
handles.PRF_Para_Obj.Paras_tObj.Units               = 'pixels';
handles.PRF_Para_Obj.Paras_tObj.Position            = [515 400 100 30];
handles.PRF_Para_Obj.Paras_tObj.String              = 'Parameters:';
handles.PRF_Para_Obj.Paras_tObj.FontSize            = 14;
handles.PRF_Para_Obj.Paras_tObj.HorizontalAlignment = 'left';
handles.PRF_Para_Obj.Paras_tObj.FontName            = 'Segoe UI';


handles.PRF_Para_Obj.Paras_TxT_tObj                     = uicontrol();
handles.PRF_Para_Obj.Paras_TxT_tObj.Style               = 'text';
handles.PRF_Para_Obj.Paras_TxT_tObj.Parent              = handles.PRF_Sets_uObj;
handles.PRF_Para_Obj.Paras_TxT_tObj.BackgroundColor     = 'w';
handles.PRF_Para_Obj.Paras_TxT_tObj.FontSize            = 10;
handles.PRF_Para_Obj.Paras_TxT_tObj.Units               = 'pixels';
handles.PRF_Para_Obj.Paras_TxT_tObj.Position            = [515 200 150 200];
handles.PRF_Para_Obj.Paras_TxT_tObj.HorizontalAlignment = 'left';
handles.PRF_Para_Obj.Paras_TxT_tObj.FontName            = 'Segoe UI';

guidata(hObject,handles);

end

