function [  ] = KESA_Maps_Selected_Sets_Cgro( hObject,~ )
%Cgro_KESA_Maps_Selected_Sets_uObj List magnitude, kspace and temperature images
%   ...

handles = guidata(hObject);

handles.KESA_Maps_Selected_Sets_uObj            = uipanel();
handles.KESA_Maps_Selected_Sets_uObj.Parent     = handles.KESA_One_fObj;
handles.KESA_Maps_Selected_Sets_uObj.Units      = 'pixels';
handles.KESA_Maps_Selected_Sets_uObj.Position   = [10 50 775 310];

guidata(hObject,handles);

KESA_Maps_Three_Cwdg(hObject);


end

