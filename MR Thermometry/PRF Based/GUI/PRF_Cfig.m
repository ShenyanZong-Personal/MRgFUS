function [ ] = PRF_Cfig( )
%Cfig_MR_PRF GUI for PRF-based thermometry
%   Function: figure()

handles.PRF_fObj              = figure();

handles.PRF_fObj.ToolBar      = 'none';
handles.PRF_fObj.MenuBar      = 'none';

handles.PRF_fObj.Name         = 'PRF-based Thermometry';
handles.PRF_fObj.NumberTitle  = 'off';

handles.PRF_fObj.Position     = [80 80 1200 600];
handles.PRF_fObj.Colormap     = colormap('Jet');

hObject = handles.PRF_fObj;

guidata(hObject,handles);

PRF_Sets_Cgro(hObject);
PRF_DataA_Cgro(hObject);
%Cgro_DataAnalysis(hObject);

end
