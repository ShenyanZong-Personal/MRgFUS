function [] = breathmotion1( us_ocm )
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
    us_dTheta_dT = angle( us_ocm_rmo_plural(:,2:end).*us_ocm_rmo_plural_conj(:,1:end-1) );
    
end






end

