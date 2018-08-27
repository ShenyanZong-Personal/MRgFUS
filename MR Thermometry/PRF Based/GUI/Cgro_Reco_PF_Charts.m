function [  ] = Cgro_Reco_PF_Charts( hObject,~ )
%Cgro_Reco_PF_Charts Cantain three axes() to display partial Fourier
%   ...

handles = guidata(hObject);

handles.Reco_PF_Charts_uObj             = uipanel();
handles.Reco_PF_Charts_uObj.Parent      = handles.KESA_TC_fObj;
handles.Reco_PF_Charts_uObj.Units       = 'pixels';
handles.Reco_PF_Charts_uObj.Position    = [280 440 1000 320];

guidata(hObject,handles);

Cwdg_Maps_Reco_Proc(hObject);


end

