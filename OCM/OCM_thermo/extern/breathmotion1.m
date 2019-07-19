function us_trace = breathmotion1( us_ocm )
%breathmotion1 to track motion trajectory caused by breath
%   input: us_ocm, a multidimensional matrix.
%   dimension = number of discrete points(row) × number of traces(column).
  
[Np,Ntr]    = size(us_ocm);
if Np ==1 || Ntr ==1
    
    error('not a matrix, some steps can not be perfromed here');
    
else
    
    %   remove oscillation
    us_mean     = mean(us_ocm,2);
    us_ocm_rmo  = us_ocm - repmat(us_mean,[1 Ntr]);
    
    %   pluralize signal by Hilbert
    us_ocm_rmo_plural = hilbert( us_ocm_rmo );
    
    us_ocm_rmo_plural_conj = conj( us_ocm_rmo_plural );
    us_dTheta_dT = zeros(Np,Ntr-1);
    for iNtr = 1:Ntr-1
        us_dTheta_dT(:,iNtr) = angle( us_ocm_rmo_plural(:,iNtr+1).*us_ocm_rmo_plural_conj(:,iNtr) );
    end
    
    %
    us_dTheta_dT = sum( us_dTheta_dT,1 );
    us_trace     = cumsum( us_dTheta_dT );
end






end

