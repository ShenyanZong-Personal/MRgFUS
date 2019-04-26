clear; close all;

% --- To apply time-frequence analysis to pick up frequency information.

% --- OCM acquisition parameters.
freq_sample = 10*1e6;   % --- Hz
T_duration  = 0.2;      % --- ms

[~,ts_us,us_data] = read_ocm_trace('OCM_data/20180601_FLASH_1.bin',[]);
n_us = size(us_data,2);
% --- Two OCM ultrasound sensors here.
% --- The odd lines for the 1st ultrasound sensor.
% --- The even lines for the 2nd ultrasound sensor.

figure; imagesc(us_data(1:6000,:)');
colormap(gray);

us_data_s1 = us_data(1,:);      % --- The 1st received OCM ultrasound signal  
us_data_s2 = us_data(399,:);    % --- The 399th received OCM ultrasound signal
Ts = 1/freq_sample:1/freq_sample:T_duration*1e-3;

figure; plot(Ts,us_data_s1,Ts,us_data_s2);


freq_us_data_s1 = fftshift( fft(us_data_s1) );
freq_us_data_s2 = fftshift( fft(us_data_s2) );

fs = linspace(-freq_sample/2,freq_sample/2,n_us);

figure; plot( fs(n_us/2+1:end),abs( freq_us_data_s1( (n_us/2+1):end) ) );
hold on; plot( fs(n_us/2+1:end),abs( freq_us_data_s2( (n_us/2+1):end ) ) );

% --- Time-frequency analysis
% --- segment: 100 points; overlap: 50 points; zeros-padding: 2048
% --- 0.01ms per segment
us_data_s1_spec = spectrogram(us_data_s1,100,50,2048);
us_data_s2_spec = spectrogram(us_data_s2,100,50,2048);

[n_tfa_freq_s1,n_tfa_time_s1] = size(us_data_s1_spec); 
fs_tfa = linspace(0,freq_sample/2,n_tfa_freq_s1);
Ts_tfa = linspace( ((1/freq_sample)*100)/2,T_duration*(1e-3)-((1/freq_sample)*100)/2,n_tfa_time_s1 );

figure; imagesc([min(Ts_tfa) max(Ts_tfa)],[min(fs_tfa) max(fs_tfa)],abs(us_data_s1_spec));
colormap('Gray');

