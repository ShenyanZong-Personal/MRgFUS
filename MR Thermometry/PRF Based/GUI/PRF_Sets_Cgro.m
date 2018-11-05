function [ ] = PRF_Sets_Cgro( hObject,~ )
%Cgro_MR_Image Create widget group to exhibit and operate MR images.
%   Function: uipanel()

handles = guidata(hObject);

handles.PRF_Sets_uObj            =   uipanel();

handles.PRF_Sets_uObj.Parent     =   handles.PRF_fObj;
handles.PRF_Sets_uObj.Units      =   'pixel';
handles.PRF_Sets_uObj.Position   =   [5 50 700 500];

guidata(hObject,handles);

PRF_TMaps_Holder_Cwdg(hObject);
PRF_Open_Cwdg(hObject);
PRF_Color_Bar_Cwdg(hObject);
PRF_Max_CLim_Control_Cwdg(hObject);
PRF_Para_Cwdg(hObject);
PRF_Time_Phase_Index_Cwdg(hObject);
PRF_Slice_Control_Cwdg(hObject);
PRF_Combined_Option_Cwdg(hObject);
PRF_Coil_Control_Cwdg(hObject);
PRF_InStep_Cwdg(hObject);

end

