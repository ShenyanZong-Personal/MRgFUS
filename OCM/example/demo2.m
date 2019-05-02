clear; close all;

% --- To calculate signal phase by fft, filter and ifft.
% --- Step One: fft for the entire signal
% --- Step Two: filter out the negative frequency parts
% --- Step Three: ifft for restoring the signal intensity and phase

% --- OCM acquisition parameters
fsampling = 10*1e6;     % --- Hz
Tduration = 0.2*1e-3;   % --- s

[~,ts_us,us_data]   = read_ocm_trace('OCM_data/20180601_FLASH_1.bin',[]);
us_data             = us_data';

Ts          = 1/fsampling:1/fsampling:Tduration;
us_data_s1  = us_data(:,1);

figure; plot( Ts,us_data_s1 );
figure; imagesc( 1:size(us_data,2),Ts,us_data ); colormap('Gray');

% --- Filter and ultrasound parameters
attn    = 0.5;          % --- dB/MHz; Attenuation
uspeed  = 1540;         % --- m/s; Ultrasound speed
ufreq   = 1e6;          % --- Hz; Sensor frequency
uTp     = 1/ufreq;      % --- s; Period of one ultrasound oscillation
wlen    = uTp*uspeed;   % --- m; Wavelength

us_data_sp1 = fftshift( fft(us_data_s1) );
fs          = linspace(-fsampling/2,fsampling/2,size(us_data_s1,1));

us_data_sp  = fftshift( fft(us_data),1 );

figure; plot( fs,abs(us_data_sp1) ); axis([min(fs) max(fs) 0 100]);
figure; imagesc( 1:size(us_data,2),fs,abs(us_data_sp),[0 50] ); colormap('Gray');

us_data_sp1_pos             = us_data_sp1;
us_data_sp1_pos(1:end/2)    = 0;    % --- Remove the part of minus frequency
us_data_sp_pos              = us_data_sp;
us_data_sp_pos(1:end/2,:)   = 0;

figure; plot( fs,abs(us_data_sp1_pos) );
figure; imagesc( 1:size(us_data,2),fs,abs(us_data_sp_pos),[0 50] ); colormap('Gray');

us_data_s1_rebuild  = ifft( us_data_sp1_pos );
us_data_rebuild     = ifft( us_data_sp_pos );

figure; plot( Ts,abs(us_data_s1_rebuild) );
figure; plot( Ts,angle(us_data_s1_rebuild) );
figure; imagesc( 1:size(us_data,2),Ts,abs(us_data_rebuild) ); colormap('Gray');
figure; imagesc( 1:size(us_data,2),Ts,angle(us_data_rebuild) ); colormap('Gray');
