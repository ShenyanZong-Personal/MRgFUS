function [  ] = TC_KESA_Convert_To_Delta_TE_Cwdg( hObject,~ )
%
%   

handles = guidata(hObject);

handles.TC_KESA_Convert_To_Delta_TE_pObj            = uicontrol();
handles.TC_KESA_Convert_To_Delta_TE_pObj.Parent     = handles.TC_KESA_fObj;
handles.TC_KESA_Convert_To_Delta_TE_pObj.Style      = 'pushbutton';
handles.TC_KESA_Convert_To_Delta_TE_pObj



guidata(hObject,handles);

end

