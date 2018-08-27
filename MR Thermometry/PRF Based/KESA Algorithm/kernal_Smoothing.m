function [ lp_ker ] = kernal_Smoothing( wid,iNkxy,PhaseDir,Nkxy )
%kernal_Smoothing Generate a low-pass filter to reduce the ripples
%   wid: Its value is better to be even

switch PhaseDir
    
    case 'COL'
        if iNkxy < (wid/2)
            xbrig       = 1:(2*iNkxy-1);
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            ybrig       = ybrig';
            
            lp_ker              = ones(Nkxy,1);
            lp_ker(1:2*iNkxy-1)     = ybrig;
            
        elseif (wid/2) <= iNkxy && iNkxy<= (Nkxy-wid/2+1)
            xbrig       = 1:(2*(wid/2)-1);
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            ybrig       = ybrig';
            
            lp_ker                                  = ones(Nkxy,1);
            lp_ker(1:iNkxy)                         = 0;
            lp_ker(iNkxy-(wid/2-1):iNkxy+(wid/2-1)) = ybrig;
            
        else
            xbrig       = 1:2*(Nkxy-iNkxy)+1;
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            ybrig       = ybrig';
            
            lp_ker                          = ones(Nkxy,1);
            lp_ker(1:iNkxy)                 = 0;
            lp_ker(iNkxy-(Nkxy-iNkxy):Nkxy) = ybrig;
        end
        
    case 'ROW'
        if iNkxy < (wid/2)
            xbrig       = 1:(2*iNkxy-1);
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            
            lp_ker              = ones(1,Nkxy);
            lp_ker(1:2*iNkxy-1)     = ybrig;
            
        elseif (wid/2) <= iNkxy && iNkxy <= (Nkxy-wid/2+1)
            xbrig       = 1:(2*(wid/2)-1);
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            
            lp_ker                                  = ones(1,Nkxy);
            lp_ker(1:iNkxy)                         = 0;
            lp_ker(iNkxy-(wid/2-1):iNkxy+(wid/2-1)) = ybrig;
            
        else
            xbrig       = 1:2*(Nkxy-iNkxy)+1;
            Nxbrig      = numel(xbrig);
            xbrig_pi    = linspace(0,pi/2,Nxbrig);
            xbrig_pi    = -xbrig_pi;
            xbrig_pi    = fliplr(xbrig_pi);
            ybrig       = cos(xbrig_pi).^2;
            
            lp_ker                          = ones(1,Nkxy);
            lp_ker(1:iNkxy)                 = 0;
            lp_ker(iNkxy-(Nkxy-iNkxy):Nkxy) = ybrig;
        end
end



end

