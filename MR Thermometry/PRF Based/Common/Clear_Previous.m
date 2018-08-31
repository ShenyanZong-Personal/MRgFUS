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

guidata(hObject,handles);

end

