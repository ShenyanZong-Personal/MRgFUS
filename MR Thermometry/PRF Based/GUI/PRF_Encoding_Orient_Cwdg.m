function [ handles ] = PRF_Encoding_Orient_Cwdg( hObject,~ )
%EncodingDirection Display frequency and phase encoding direction.
%   ...

handles = guidata(hObject);

PhaseEncodingDirection = handles.PRF_fObj.UserData.Headers.PhaseEncodingDirection;

if strcmp(PhaseEncodingDirection,'COL')
    
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj          = annotation(handles.PRF_Sets_uObj,'doublearrow');
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj.Units    = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj.Position = [40 150 0 250];
    
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj              = text(handles.PRF_TMaps_Holder_aObj);
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.String       = 'Phase Encoding';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.Units        = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.Position     = [-25 140];
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.Rotation     = 90;
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.FontSize     = 12;
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.FontName     = 'MS Sans Serif';
    
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj           = annotation(handles.PRF_Sets_uObj,'doublearrow');
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj.Units     = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj.Position  = [120 70 250 0];
    
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj           = text(handles.PRF_TMaps_Holder_aObj);
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.String    = 'Frequency Encoding';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.Units     = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.Position  = [120 -20];
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.FontSize  = 12;
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.FontName  = 'MS Sans Serif';
    
elseif strcmp(PhaseEncodingDirection,'ROW')
    
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj          = annotation(handles.PRF_Sets_uObj,'doublearrow');
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj.Units    = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_aObj.Position = [40 150 0 250];
    
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj            = text(handles.PRF_TMaps_Holder_aObj);
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.String     = 'Frequency Encoding';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.Units      = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.Position   = [-25 125];
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.Rotation   = 90;
    handles.PRF_Encoding_Orient_Obj.Freq_Encoding_TxT_tObj.FontSize   = 12;
    handles.PRF_Encoidng_Orient_Obj.Freq_Encoding_TxT_tObj.FontName   = 'MS Sans Serif';
    
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj             = annotation(handles.PRF_Sets_uObj,'doublearrow');
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj.Units       = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_aObj.Position    = [120 70 250 0];
    
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj             = text(handles.PRF_TMaps_Holder_aObj);
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.String      = 'Phase Encoding';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.Units       = 'pixels';
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.Position    = [135 -20];
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.FontSize    = 12;
    handles.PRF_Encoding_Orient_Obj.Phase_Encoding_TxT_tObj.FontName    = 'MS Sans Serif';
end

guidata(hObject,handles);

end

