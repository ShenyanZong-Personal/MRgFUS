function [Tseries] = Tonpoint(TMaps,P)
%
%   

[~,~,~,~,Np]    = size(TMaps);
Tseries         = zeros(1,Np);

srow = P(2); scol = P(1);

for iNp = 1:Np
    
    TMap            = TMaps(:,:,1,1,iNp);
    Tvalue          = TMap(srow,scol);
    Tseries(1,iNp)  = Tvalue;

end

end

