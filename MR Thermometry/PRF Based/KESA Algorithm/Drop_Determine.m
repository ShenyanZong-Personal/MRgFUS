function [ Map_Shift ] = Drop_Determine( Maps_KESA )
%Drop_Determine Identify dropping points for KESA lines of each pixel 
%   Map_KESA: [Row Column Nkxy]

[Row,Col,~]  = size(Maps_KESA);

Map_Shift = zeros(Row,Col);
for iRow = 1:Row
    for iCol = 1:Col
        
        KESA_line = Maps_KESA(iRow,iCol,:);
        KESA_line = squeeze(KESA_line);
        
        KESA_line_Grad          = gradient(KESA_line);
        DropPoint               = find( KESA_line_Grad == min(KESA_line_Grad) );
        Map_Shift(iRow,iCol)    = DropPoint;
    end
end

end

