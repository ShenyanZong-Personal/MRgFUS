function [  ] = PRF_DataA_Cgro( hObject,~ )
%Cgro_DataAnalysis Other Analysis for temperature data
%   ...

handles = guidata(hObject);


handles.PRF_DataA_uObj              = uipanel();
handles.PRF_DataA_uObj.Parent       = handles.PRF_fObj;
handles.PRF_DataA_uObj.Units        = 'pixels';
handles.PRF_DataA_uObj.Position     = [720 50 200 500];


guidata(hObject,handles);

KESA_Initialize_Cwdg(hObject);
%TC_KESA_Initialize_Cwdg(hObject);

end

