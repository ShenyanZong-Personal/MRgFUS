function [nbytes ptag ts1 ts2 dtype ndim nEls dflag] = read_miniheader(fid)
%
%

% Read the 34-byte mini header, 2+4+8+8+4+2+2+4 = 34
nbytes  = fread(fid,1,'ushort');
ptag    = sprintf('%c',fread(fid,4,'char'));
ts1     = fread(fid,1,'double');
ts2     = fread(fid,1,'double');
dtype   = sprintf('%c',fread(fid,4,'char'));
ndim    = fread(fid,1,'short');
nEls    = fread(fid,1,'short');
dflag   = sprintf('%c',fread(fid,4,'char'));

end

