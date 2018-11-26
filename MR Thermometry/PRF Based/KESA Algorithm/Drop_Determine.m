function [ Map_Shift ] = Drop_Determine( Maps_KESA )
%Drop_Determine Identify dropping points for KESA lines of each pixel 
%   Map_KESA: [Row Column Nkxy]

%[Row,Col,Nkxy]  = size(Maps_KESA);
[Row,Col,Nkxy] = size(Maps_KESA);

%P_Nkxy      = 1:1:Nkxy;
%P_Nkxy_Q    = 1:0.01:Nkxy;

Map_Shift   = zeros(Row,Col);
Ref_KESA    = (1+Nkxy)/2;

for iRow = 1:Row
    for iCol = 1:Col
        
        Profile = Maps_KESA(iRow,iCol,:);
        Profile = squeeze(Profile)';
        
        Y_first = Profile(1);
        YDr     = Y_first*0.5;
        
        iNkxy = 1;
        while Profile(iNkxy) > YDr
            iNkxy = iNkxy +1;
        end
        
        A = [iNkxy-1 1;iNkxy 1];
        B = [Profile(iNkxy-1);Profile(iNkxy)];
        
        kb          = A\B;
        DropPoint   = ( YDr-kb(2) )/kb(1);
        
        Map_Shift(iRow,iCol) = DropPoint;
        
        %Profile_Q = interp1(P_Nkxy,Profile,P_Nkxy_Q,'pchip');
        
        %Profile_Q_Grad      = gradient(Profile_Q);
        %DropPoint_Index     = find( Profile_Q_Grad == min(Profile_Q_Grad) );
        %DropPoint           = P_Nkxy_Q(DropPoint_Index); %#ok<FNDSB>
        
        %Map_Shift(iRow,iCol) = DropPoint;
        
        %KESA_line_Grad          = gradient(Profile);
        %DropPoint               = find( KESA_line_Grad == min(KESA_line_Grad) );
        %Map_Shift(iRow,iCol)    = DropPoint;
    end
end

Map_Shift = Map_Shift - Ref_KESA;

end

