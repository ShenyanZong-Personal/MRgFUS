function [ BandWidth ] = PRF_BW_Selection_Cfig( BW )

handles.BW_Selection_fObj               = figure();
handles.BW_Selection_fObj.ToolBar       = 'none';
handles.BW_Selection_fObj.MenuBar       = 'none';
handles.BW_Selection_fObj.Name          = 'BandWidth Selection';
handles.BW_Selection_fObj.NumberTitle   = 'off';
handles.BW_Selection_fObj.Position      = [100 100 120 200];
handles.BW_Selection_fObj.UserData.BW   = BW;

hObject = handles.BW_Selection_fObj;

guidata(hObject,handles);


%--- Uncompleted ---

end