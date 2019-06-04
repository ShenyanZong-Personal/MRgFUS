% this function is to extract NI recording, acquired by Frankie's
% acquisition code
% this function is previously called hsrec_recon_us_frankie_acq_new

function [ts1_us ts2_us usdata] = read_ocm_trace(filename,n)
tic;
fileinfo = dir(filename);
fsize = fileinfo.bytes;
fprintf('Reading file: %s\n', filename);
fid = fopen(filename);
bit_depth = 2^16;

% header
len = fread(fid,1,'int32'); % typically 20000. This is *not* the -n parameter
width = fread(fid,1,'int32');% should be 2
ts_ref_MRRICH = fread(fid,1,'double'); % The system reference time
ts_ref_NI = fread(fid,1,'double'); % the NI reference time (absoluteInitialX, relative to the last reset of the card)
headersize = 4 + 4 + 8 + 8; % int32 + int32 + double + double
data_tracesize = 8 + 8 + len*2; % double + double + len*int16
% read all traces
cnt=1;
% init output variable
buffer_length = min((fsize-headersize)/data_tracesize, n);
ts1_us = zeros(buffer_length,1);
ts2_us = zeros(buffer_length,1);
usdata = zeros(len, buffer_length);
while(~feof(fid))
    % here are the timestamps for this trace
    t1 = fread(fid,1,'double'); % the system time
    t2 = fread(fid,1,'double'); % the NI timestamp (absoluteInitialX, relative to the last reset of the card)

    if(~numel(t1))
        break; % can also be one of the possible file endings
    end

    ts1_us(cnt) = t1;
    ts2_us(cnt) = t2;
    d = fread(fid,len,'int16');
    if(cnt>1 && numel(d) < numel(usdata(:,cnt-1)))
        break; % end of file, skip spurious last trace
    elseif (cnt >n)
        fprintf('Reading only %d traces as requested\n', n);
        break;
    else
        usdata(:,cnt) = d(1:len);
        %usdata(:,cnt) = d(1:20000);
    end
    cnt=cnt+1;
end;

fclose(fid);

usdata = usdata'/bit_depth;


% chop off empty data
ts1_us(cnt:end) = [];
ts2_us(cnt:end) = [];
usdata(cnt:end,:) = [];
toc;
end
