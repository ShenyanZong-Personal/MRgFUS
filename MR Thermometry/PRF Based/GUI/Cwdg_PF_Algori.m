function [  ] = Cwdg_PF_Algori( hObject,~ )
%Cwdg_PF_Algori Options for select partial Fourier reconstruction
%   ...

handles = guidata(hObject);

handles.Gp_Algori_uObj              = uibuttongroup();
handles.Gp_Algori_uObj.Parent       = handles.KESA_TC_Setting_uObj;
handles.Gp_Algori_uObj.Units        = 'pixels';
handles.Gp_Algori_uObj.Position     = [0 250 200 150];
handles.Gp_Algori_uObj.BorderType   = 'none';

handles.iFFT_rObj           = uicontrol();
handles.iFFT_rObj.Parent    = handles.Gp_Algori_uObj;
handles.iFFT_rObj.Style     = 'radiobutton';
handles.iFFT_rObj.String    = 'iFFT';
handles.iFFT_rObj.FontSize  = 12;
handles.iFFT_rObj.Units     = 'pixels';
handles.iFFT_rObj.Position  = [5 100 145 50];

handles.iFFT_Smoothing_rObj             = uicontrol();
handles.iFFT_Smoothing_rObj.Parent      = handles.Gp_Algori_uObj;
handles.iFFT_Smoothing_rObj.Units       = 'pixels';
handles.iFFT_Smoothing_rObj.Position    = [5 50 145 50];
handles.iFFT_Smoothing_rObj.Style       = 'radiobutton';
handles.iFFT_Smoothing_rObj.String      = 'iFFT-Smoothing';
handles.iFFT_Smoothing_rObj.FontSize    = 12;

handles.POCS_rObj           = uicontrol();
handles.POCS_rObj.Parent    = handles.Gp_Algori_uObj;
handles.POCS_rObj.Units     = 'pixels';
handles.POCS_rObj.Position  = [5 0 145 50];
handles.POCS_rObj.Style     = 'radiobutton';
handles.POCS_rObj.String    = 'POCS';
handles.POCS_rObj.FontSize  = 12;

guidata(hObject,handles);

end

