function [  ] = KESA_WinLevel_kUp_Cwdg( hObject )
%KESA_WinLevel_kUp 
%   ...

handles = guidata(hObject);

handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj                     = uicontrol();
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.Parent              = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.Style               = 'text';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.Units               = 'pixels';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.FontSize            = 12;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.String              = 'k-Up:';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.Position            = [420 20 60 20];
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_tObj.BackgroundColor     = 'w';

handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj             = uicontrol();
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Parent      = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Style       = 'slider';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Units       = 'pixels';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Position    = [480 15 120 30];
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Min         = 100;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Max         = 1e06;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Value       = 1e03;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Callback    = @WinLevel_kUp_Control_Callback;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.SliderStep  = [10/(1e6-100) 100/(1e6-100)];

handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj                 = uicontrol();
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.Parent          = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.Style           = 'edit';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.Units           = 'pixels';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.FontSize        = 10;
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.Position        = [600 15 100 30];
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.BackgroundColor = 'w';
handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.String          = '1000';

guidata(hObject,handles);

end

function [  ] = WinLevel_kUp_Control_Callback(hObject,~)

handles = guidata(hObject);

kUp_Current = handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_sObj.Value;

handles.KESA_WinLevel_kUp_Obj.WinLevel_kUp_TxT_eObj.String = num2str(kUp_Current);

handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.CLim         = [0 kUp_Current];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.CLim    = [0 kUp_Current];

guidata(hObject,handles);

end