function [ ] = SelectedRef_Callback( hObject,eV )
%
%   

handles = guidata(hObject);

eV.NewValue.String = 'Ref';
eV.OldValue.String = '';

guidata(hObject,handles);

end

