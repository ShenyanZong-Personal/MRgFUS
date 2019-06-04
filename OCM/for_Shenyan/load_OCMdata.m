
% filename:	Name of OCM file to be read
% file_version:	'1' for the older format, '2' for the newer format
% N:		Number of entries to be read, N < 0 to read them all
function [ocmdata ts1_us ts2_us nEl] = load_OCMdata(filename, N)

% Open raw data file
fid = fopen([filename],'r');
if fid < 0
   error('Error opening raw data file');
end

% Figure out the size of this file
fseek(fid,0,'eof');     % Go to the end of the file
filesize = ftell(fid);  % See how far the end is from the beginning
fseek(fid, 0, 'bof');   % Return to the beginning of the file

% Figure out which file format version this is. In the older file format, a
% same 'mini header' preceded every single OCM trace, in a rather repetitive
% manner. In the newer format there is a header for the whole file and then
% only time stamps before each OCM trace, a more efficient approach.
[nbytes ptag ts1 ts2 dtype ndim nEl dflag] = read_miniheader(fid);
if (sum(ptag=='nius' & dflag=='data') == 4)
   v = 1;	% This is a valid entry for a file in the older format
else
   v = 2;	% Just assume this file must be in the newer format
end
fseek(fid, 0, 'bof');   % Return to the beginning of the file

% Get some info from the intitial header, at the beginning of the file,
% most importantly the number of elements per OCM trace, nEl
if (v == 1)
   [nbytes ptag ts1 ts2 dtype ndim nEl dflag] = read_miniheader(fid);
   width = 2;   	% Number of bytes per value; 2 bytes (16bit) is expected
   wf_hl = 0;		% Length of the 'whole file' header, none here
   rec_hl = 34;   	% Length of the header for each record, in bytes
   fseek(fid, 0, 'bof');   % Return to the beginning of the file
else 			% v = 2
   % Read the whole-file header, and do not return to the beginning of the file
   % afterward
   nEl = fread(fid,1,'int32');     % Number of elements per trace
   width = fread(fid,1,'int32');   % Number of bytes per value; 2 bytes (16bit) is expected
   ts_ref_MRRICH = fread(fid,1,'double'); % The system reference time
   ts_ref_NI = fread(fid,1,'double');     % NI ref time (absoluteInitialX, from last reset of the card)
   wf_hl = 2*4+2*8;% Length of the 'whole file' header (2 int32s and 2 doubles), in bytes
   rec_hl = 2*8;   % Length of the header for each record (2 doubles), in bytes
end

% Figure out how many OCM records or traces the file contains
rl = rec_hl + nEl*width;        % Length of each record, in bytes
Nrec = filesize/rl;

% Figure out how many OCM traces to read
if (N < 0)
   Nread = Nrec;
else
   Nread = N;
end
Nread = floor(Nread);           % Just in case there is an incomplete record

% Allocate memory
ocmdata = zeros(nEl, Nread);
ts1_us = zeros(1,Nread);
ts2_us = zeros(1,Nread);

% Loop over all records to be read
fprintf('Reading %d entries from %s', Nread, filename);
for cnt = 1:Nread
   if (v == 1)
      % Read the 34-byte mini header, 2+4+8+8+4+2+2+4 = 34
      [nbytes ptag ts1 ts2 dtype ndim nEl dflag] = read_miniheader(fid);
   else 		% v = 2
      % Read the timestamps for this OCM trace
      ts1 = fread(fid,1,'double'); % the system time
      ts2 = fread(fid,1,'double'); % the NI time    
   end
   % Read the data
   [buf count] = fread(fid, nEl, 'int16'); 
   % Store these values
   ts1_us(cnt) = ts1;
   ts2_us(cnt) = ts2;
   ocmdata(:,cnt) = buf;
end
fprintf(1,'\n');
fclose(fid);

