function [ handles ] = Clear_Previous( hObject )
%Clear_Previous
%   

handles = guidata(hObject);

if isfield(handles,'PRF_Encoding_Orient_Obj')
    delete(handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj);
    delete(handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj);
    delete(handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj);
    delete(handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj);
    handles = rmfield(handles,'PRF_Encoding_Orient_Obj');
else
    
end

if isempty(handles.PRF_Para_Obj.Paras_TxT_tObj.String)
    
else
    handles.PRF_Para_Obj.Paras_TxT_tObj.String = '';
end

if isempty(handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj)
    
else
    handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.String = '';
end

if isempty(handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.String)
    
else
    handles.PRF_Slice_Control_Obj.iCoil_TxT_tObj.String = '';
end

if isempty(handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.String)
    
else
    handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.String = '';
end

guidata(hObject,handles);

end

