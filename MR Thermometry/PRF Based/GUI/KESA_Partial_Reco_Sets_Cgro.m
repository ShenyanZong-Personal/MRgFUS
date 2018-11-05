function [ ] = KESA_Partial_Reco_Sets_Cgro( hObject,~ )
%Cgro_Partial_Reco Container of partial Fourier reconstruction process
%   ...

handles = guidata(hObject);

handles.KESA_Partial_Reco_Sets_uObj             = uipanel();
handles.KESA_Partial_Reco_Sets_uObj.Parent      = handles.KESA_Two_fObj;
handles.KESA_Partial_Reco_Sets_uObj.Units       = 'pixels';
handles.KESA_Partial_Reco_Sets_uObj.Position    = [5 80 1000 420];

guidata(hObject,handles);

KESA_Partial_Reco_Proc_Cwdg(hObject);
KESA_WinLevel_kUp_Cwdg(hObject);

end

