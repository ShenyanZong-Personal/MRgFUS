clear; close all;

% --- To calculate signal phase by fft, filter and ifft.
% --- Step One: fft for the entire signal
% --- Step Two: filter out the negative frequency parts
% --- Step Three: ifft for restoring the signal intensity and phase

% --- OCM acquisition parameters
fsampling = 10*1e6;     % --- Hz
Tduration = 0.2*1e-3;   % --- s

[~,ts_us,us_data] = read_ocm_trace('OCM_data/20180601_FLASH_1.bin',[]);

Ts          = 1/fsampling:1/fsampling:Tduration;
us_data_s1  = us_data(1,:);

figure; plot(Ts,us_data_s1);

% --- Filter and ultrasound parameters
attn    = 0.5;          % --- dB/MHz; Attenuation
uspeed  = 1540;         % --- m/s; Ultrasound speed
ufreq   = 1e6;          % --- Hz; Sensor frequency
uTp     = 1/ufreq;      % --- s; Period of one ultrasound oscillation
wlen    = uTp*uspeed;   % --- m; Wavelength