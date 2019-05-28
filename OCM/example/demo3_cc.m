clear; close all;

% OCM parameters:
%bw = 20e6;      % Bandwidth -- CC
bw = 10e6;      % Bandwidth
dT = 10e-3;	    % TR, 10 ms presumably, in s
% folder of OCM data
[filename,dir_heat,~] = uigetfile('*.bin','Select *.bin file.',pwd);
%dir_heat = '~/Documents/MATLAB/MRus/ExpData/20171201/S1acq2';
%cd(dir_heat);
%filename = '20171201_v1run2.bin';      % heating: OCM data
%[vz_ zr_use zr_ OCM_ sigOCM OCMpara] = readOCM_pro(filename,bw,dT);


%% pre-processing
% common parameters
attn = 0.5;	% Attenuation, in dB/cm/Mhz
u = 1540;	% Speed of sound, in m/s
F0 = 1e6;	% Transducer frequency, in Hz
period = 1/F0;	    % Period of one oscillation, in s
lambda = period*u;	% Wavelength, in m
dt_raw = 1/bw;	    % Dwell time, in s

% load data
fprintf('Loading the OCM data\n');
%ocm_real = load_OCMdata(filename);     % CC
[~,~,ocm_real] = read_ocm_trace( strcat(dir_heat,filename),[] );

% There is really nothing to do with the first ~250 points, just crop them
% Nt_raw = size(ocm_real,1);	% Should be 5000-250, presumably -- CC
Nt_raw = size(ocm_real,2);
% NT = size(ocm_real,2);    % CC
NT = size(ocm_real,1);
T = (0:NT-1)*dT;

% Perform Transmit Gain Compensation (TGC)
fprintf('Performing Transmit Gain Compensation (TGC)\n');
t = zeros(Nt_raw,1);
t(:) = dt_raw*(1:Nt_raw);         % time axis, in s
tgc_dB = attn*(F0/1e6)*(u*100)*t; % TGC, in dB. u*100 is in cm/s
tgc = 10.^(tgc_dB./10);	    % TGC, as a multiplicative factor
ocm_real = ocm_real .* repmat(tgc,[1 NT]);

% Turn the ocm signal into a complex entity, and filter out
% some noise along the way
fprintf('Making the OCM signals complex, and filtering some noise away\n');
tmp = fft(ocm_real,[],1);
tmp(round(Nt_raw*8*F0/bw)+1:end,:) = [];
ocm_complex = ifft(tmp,[],1);