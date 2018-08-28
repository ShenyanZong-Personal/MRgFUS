function [ kspace_Reco_Partial,Image_Reco_Partial ] = POCS( kspace,iNkxy,PhEDir,NPhE,Itera )
%POCS Use iterative algorithm to reduce Gibbs' effect
%   Under Test

if iNkxy < (NPhE/2)
    switch PhEDir
        case 'ROW'
            kspace_center                       = kspace;
            kspace_center(:,1:iNkxy)            = 0;
            kspace_center(:,NPhE-iNkxy+1:NPhE)  = 0;
        
            kspace_Partial              = kspace;
            kspace_Partial(:,1:iNkxy)   = 0;
            
            iItera = 1;
            while iItera <= Itera
                Magn_Partial = abs( ifft2(kspace_Partial) );
            
                Map_center_Cplx     = ifft2(kspace_center);
                Phase_center        = angle(Map_center_Cplx);
                Phase_center_Cplx   = complex(cos(Phase_center),sin(Phase_center));
            
                Map_Itera_Cplx = Magn_Partial.*Phase_center_Cplx;
            
                iItera = iItera +1;
            
                kspace_Itera                = fft2(Map_Itera_Cplx);
                kspace_Partial(:,1:iNkxy)   = kspace_Itera(:,1:iNkxy);
            end
        
            kspace_Reco_Partial = kspace_Itera;
            Image_Reco_Partial  = abs(Map_Itera_Cplx);
        
        case 'COL'
            kspace_center                       = kspace;
            kspace_center(1:iNkxy,:)            = 0;
            kspace_center(NPhE-iNkxy+1:NPhE,:)  = 0;
            
            kspace_Partial              = kspace;
            kspace_Partial(1:iNkxy,:)   = 0;
            
            iItera = 1;
            while iItera <= Itera
                Magn_Partial = abs( iff2(kspace_Partial) );
                
                Map_center_Cplx     = ifft2(kspace_center);
                Phase_center        = angle(Map_center_Cplx);
                Phase_center_Cplx   = complex(cos(Phase_center),sin(Phase_center));
                
                Map_Itera_Cplx = Magn_Partial.*Phase_center_Cplx;
                
                iItera = iItera +1;
                
                kspace_Itera                = fft2(Map_Itera_Cplx);
                kspace_Partial(1:iNkxy,:)   = kspace_Itera(1:iNkxy,:);
            end
            
            kspace_Reco_Partial = kspace_Itera;
            Image_Reco_Partial  = abs(Map_Itera_Cplx);
            
        otherwise
            
        
    end
    
else
    switch PhEDir
        case 'ROW'
            kspace_Partial              = kspace;
            kspace_Partial(:,1:iNkxy)   = 0;
            
            iItera = 1;
            while iItera <= Itera
                Magn_Partial = abs( ifft2(kspace_Partial) );
                
                Phase_Adj       = angle( ifft2(kspace_Partial) );
                Phase_Adj_Cplx  = complex(cos(Phase_Adj),sin(Phase_Adj));
                
                Map_Itera_Cplx = Magn_Partial.*Phase_Adj_Cplx;
                
                iItera = iItera +1;
                
                kspace_Itera                = fft2(Map_Itera_Cplx);
                kspace_Partial(:,1:iNkxy)   = kspace_Itera(:,1:iNkxy);
                
            end
            
            kspace_Reco_Partial = kspace_Itera;
            Image_Reco_Partial  = abs(Map_Itera_Cplx);
            
        case 'COL'
            kspace_Partial              = kspace;
            kspace_Partial(1:iNkxy,:)   = 0;
            
            iItera = 1;
            while iItera <= Itera
                Magn_Partial = abs( ifft2(kspace_Partial) );
                
                Phase_Adj       = angle( ifft2(kspace_Partial) );
                Phase_Adj_Cplx  = complex(cos(Phase_Adj),sin(Phase_Adj));
                
                Map_Itera_Cplx = Magn_Partial.*Phase_Adj_Cplx;
                
                iItera = iItera +1;
                
                kspace_Itera                = fft2(Map_Itera_Cplx);
                kspace_Partial(1:iNkxy,:)   = kspace_Itera(1:iNkxy,:);
                
            end
            
            kspace_Reco_Partial = kspace_Itera;
            Image_Reco_Partial  = abs(Map_Itera_Cplx);
        otherwise    
            
    end
    
end


end

