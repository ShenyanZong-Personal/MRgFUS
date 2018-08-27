function [  ] = PRF_Combined_Option_Cwdg( hObject,~ )
%Combined_Option_Cwdg 
%   ...

handles = guidata(hObject);

handles.PRF_Combined_Option_rObj                    = uicontrol();
handles.PRF_Combined_Option_rObj.Parent             = handles.PRF_Sets_uObj;
handles.PRF_Combined_Option_rObj.Style              = 'radiobutton';
handles.PRF_Combined_Option_rObj.Units              = 'pixels';
handles.PRF_Combined_Option_rObj.Position           = [515 110 120 20];
handles.PRF_Combined_Option_rObj.String             = 'Combined';
handles.PRF_Combined_Option_rObj.FontSize           = 12;
handles.PRF_Combined_Option_rObj.BackgroundColor    = 'w';

guidata(hObject,handles);

end

