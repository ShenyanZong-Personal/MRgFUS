function [ ] = KESA_Partial_Reco_Sets_Cgro( hObject,~ )
%Cgro_Partial_Reco Container of partial Fourier reconstruction process
%   ...

handles = guidata(hObject);

handles.KESA_Partial_Reco_Sets_uObj             = uipanel();
handles.KESA_Partial_Reco_Sets_uObj.Parent      = handles.KESA_fObj;
handles.KESA_Partial_Reco_Sets_uObj.Units       = 'pixels';
handles.KESA_Partial_Reco_Sets_uObj.Position    = [280 380 1000 380];


guidata(hObject,handles);

KESA_Partial_Reco_Proc_Cwdg(hObject);

end

