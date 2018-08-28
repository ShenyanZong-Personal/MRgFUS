function [  ] = Identify_Shift( hObject,~ )
%Identify_Shift Identify all dropping points for each pixels
%   Ref: 128


handles = guidata(hObject);

Maps_KESA       = handles.Figure_Obj.UserData.Maps_KESA;
[row,col,~]  = size(Maps_KESA);

Map_Shift = zeros(row,col);
for irow = 1:row
    for icol = 1:col
        line_KESA = Maps_KESA(irow,icol,:);
        line_KESA = squeeze(line_KESA);
        
        line_KESA_grad  = gradient(line_KESA);
        dropping        = find( line_KESA_grad == min(line_KESA_grad) );
        
        Map_Shift(irow,icol) = dropping;
        
    end
end
Map_Shift = Map_Shift -128;

figure;
imshow(Map_Shift,[ ]);
colormap('Jet');

guidata(hObject,handles);

end

