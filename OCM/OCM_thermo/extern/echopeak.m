function [us_t_peak] = echopeak(us_ocm,us_s_stamps)
%echopeak to find the reflected echo peak and return its corresponding time.
%   input:
%   us_ocm ---OCM matrix: trace matrix or one trace.
%   US trace should be in column. For one trace, it is a column vector.
%   us_s_stamps --- A time vector for all sampled US signal. 

if size(us_ocm,1) ~= numel(us_s_stamps)
    error('The length of time stamps should be equal.');
else
    us_t_peak = zeros( 1,size(us_ocm,2) );
    for iTrace = 1:size(us_ocm,2)
        
        iUS_trace = us_ocm(:,iTrace);
        
        iUS_trace(1:500)    = 0;     % - The first 500 sampled points is useless.
        [~,iPeak_locs]      = max(iUS_trace);
        iT_stamps           = us_s_stamps(iPeak_locs);
        us_t_peak(iTrace)   = iT_stamps;
        
    end
end


end

