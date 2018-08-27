function [  ] = PRF_Coil_Control_Cwdg( hObject,~ )
%Cwdg_Coil_Control Selection of Coil for scanned MR images
%   ...

handles = guidata(hObject);

handles.PRF_Coil_Control_Obj.Left_pObj            = uicontrol();
handles.PRF_Coil_Control_Obj.Left_pObj.Parent     = handles.PRF_Sets_uObj;
handles.PRF_Coil_Control_Obj.Left_pObj.Style      = 'pushbutton';
handles.PRF_Coil_Control_Obj.Left_pObj.Units      = 'pixels';
handles.PRF_Coil_Control_Obj.Left_pObj.FontSize   = 12;
handles.PRF_Coil_Control_Obj.Left_pObj.Position   = [515 90 30 20];
handles.PRF_Coil_Control_Obj.Left_pObj.String     = '<';

handles.PRF_Coil_Control_Obj.Coil_TxT_tObj           = uicontrol();
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.Parent    = handles.PRF_Sets_uObj;
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.Style     = 'text';
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.Units     = 'pixels';
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.FontSize  = 12;
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.Position  = [545 90 60 20];
handles.PRF_Coil_Control_Obj.Coil_TxT_tObj.String    = 'Coil';

handles.PRF_Coil_Control_Obj.Right_pObj           = uicontrol();
handles.PRF_Coil_Control_Obj.Right_pObj.Parent    = handles.PRF_Sets_uObj;
handles.PRF_Coil_Control_Obj.Right_pObj.Style     = 'pushbutton';
handles.PRF_Coil_Control_Obj.Right_pObj.Units     = 'pixels';
handles.PRF_Coil_Control_Obj.Right_pObj.FontSize  = 12;
handles.PRF_Coil_Control_Obj.Right_pObj.Position  = [605 90 30 20];
handles.PRF_Coil_Control_Obj.Right_pObj.String    = '>';

handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj                   = uicontrol();
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.Parent            = handles.PRF_Sets_uObj;
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.Style             = 'text';
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.BackgroundColor   = 'w';
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.Units             = 'pixels';
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.FontSize          = 10;
handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.Position          = [515 65 120 20];

guidata(hObject,handles);

end

