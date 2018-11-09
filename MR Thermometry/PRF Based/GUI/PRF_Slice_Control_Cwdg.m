function [  ] = PRF_Slice_Control_Cwdg( hObject,~ )
%Cwdg_Slice_Control Selection of slice for scanned MR images
%   ...

handles = guidata(hObject);

handles.PRF_Slice_Control_Obj.Left_pObj            = uicontrol();
handles.PRF_Slice_Control_Obj.Left_pObj.Parent     = handles.PRF_Sets_uObj;
handles.PRF_Slice_Control_Obj.Left_pObj.Style      = 'pushbutton';
handles.PRF_Slice_Control_Obj.Left_pObj.Units      = 'pixels';
handles.PRF_Slice_Control_Obj.Left_pObj.FontSize   = 12;
handles.PRF_Slice_Control_Obj.Left_pObj.Position   = [515 170 30 20];
handles.PRF_Slice_Control_Obj.Left_pObj.String     = '<';
handles.PRF_Slice_Control_Obj.Left_pObj.FontName   = 'MS Sans Serif';

handles.PRF_Slice_Control_Obj.Slice_TxT_tObj           = uicontrol();
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.Parent    = handles.PRF_Sets_uObj;
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.Style     = 'text';
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.Units     = 'pixels';
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.FontSize  = 12;
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.Position  = [545 170 60 20];
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.String    = 'Slice';
handles.PRF_Slice_Control_Obj.Slice_TxT_tObj.FontName  = 'MS Sans Serif';

handles.PRF_Slice_Control_Obj.Right_pObj           = uicontrol();
handles.PRF_Slice_Control_Obj.Right_pObj.Parent    = handles.PRF_Sets_uObj;
handles.PRF_Slice_Control_Obj.Right_pObj.Style     = 'pushbutton';
handles.PRF_Slice_Control_Obj.Right_pObj.Units     = 'pixels';
handles.PRF_Slice_Control_Obj.Right_pObj.FontSize  = 12;
handles.PRF_Slice_Control_Obj.Right_pObj.Position  = [605 170 30 20];
handles.PRF_Slice_Control_Obj.Right_pObj.String    = '>';
handles.PRF_Slice_Control_Obj.Right_pObj.FontName  = 'MS Sans Serif';

handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj                   = uicontrol();
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.Parent            = handles.PRF_Sets_uObj;
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.Style             = 'text';
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.BackgroundColor   = 'w';
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.Units             = 'pixels';
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.FontSize          = 10;
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.Position          = [515 145 120 20];
handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.FontName          = 'MS Sans Serif';

guidata(hObject,handles);

end

