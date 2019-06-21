clear; close all;

%% --- Read OCM data.
addpath('./for_Shenyan');

[OCM_file,OCM_path,OCM_format] = uigetfile({'*.bin'},'OCM Data Selection');

if OCM_file == 0
    fprintf('No file selection ...\n');
else
    if OCM_format == 1
        fprintf('To read older OCM data in *.bin file ...\n');
        
        [ocm_us,ts1_us,ts2_us,nEl] = load_OCMdata([OCM_path OCM_file],-1);
        
        %% --- Remove uneffective traces
        TR = 8e-3;  % - Repetition time, s
        % - the last one trace
        ocm_us  = ocm_us(:,1:end-1);
        ts2_us  = ts2_us(1:end-1); 
        
        % - the undesired traces
        diff_ts2_us_sensor1 = diff( ts2_us(1:2:end) );
        Nth_undesired       = find( diff_ts2_us_sensor1 < TR*0.6 );
        Nth_undesired       = Nth_undesired(1:2:end);
        Nth_undesired       = 2.*(Nth_undesired +1) -1;
        Nth_undesired       = [Nth_undesired;Nth_undesired+1];
        Nth_undesired       = reshape(Nth_undesired,1,[]);
        
        ocm_us(:,Nth_undesired)     = [];
        ts2_us(Nth_undesired)       = [];
       
        %% --- Ultrasound scanning parameters
        fs          = 10e6;                         % - sampling frequency, Hz
        F0          = 1e6;                          % - ultrasound frequency, Hz
        Td          = 0.2e-3;                       % - time duration of received ultrasound, s
        Nsenor      = 2;                            % - number of ultrasound sensors
        NAcq        = floor( size(ocm_us,2)/2 );    % - number of ulstrasound acquistion per sensor
        
        ocm_us_sensor1 = ocm_us(:,1:2:floor( size(ocm_us,2)/2 )*2);     % - ultrasound data of sensor 1
        ocm_us_sensor2 = ocm_us(:,2:2:floor( size(ocm_us,2)/2 )*2);     % - ultrasound data of sensor 2
        
        Tsensor1_tks = ts2_us(1:2:floor( size(ocm_us,2)/2 )*2);
        Tsensor1_tks = Tsensor1_tks - Tsensor1_tks(1);
        Tsensor2_tks = ts2_us(2:2:floor( size(ocm_us,2)/2 )*2);
        Tsensor2_tks = Tsensor2_tks - Tsensor2_tks(1);
        
        Td_tks    = 1/fs:1/fs:Td;
        figure(1);
        imagesc(Tsensor1_tks,Td_tks,ocm_us_sensor1); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title('Ultrasound Signal, Sensor1');
        figure(2);
        imagesc(Tsensor2_tks,Td_tks,ocm_us_sensor2); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title('Ultrasound Signal, Sensor2');

        %% --- Phase calculation by Hilbert-Huang transform
        s1_sensor1  = ocm_us_sensor1(:,1);
        figure; plot(Td_tks,s1_sensor1);
        xlabel('Ultrasound Time(s)'); ylabel('US Magnitude');
        title('1st US Trace, Sensor1');
        
        [imf_s1_sensor1,residual_s1_sensor1] = emd(s1_sensor1);
        [hs_s1_sensor1,f_hs1_sensor1,t_hs1_sensor1,imfinsf_hs1_sensor1,imfinse_hs1_sensor1] ... 
            = hht(imf_s1_sensor1,fs,'FrequencyResolution',(fs/2-0)/1000);
        
        s80_sensor1 = ocm_us_sensor1(:,80);
        figure; plot(Td_tks,s80_sensor1);
        xlabel('Ultrasound Time(s)'); ylabel('US Magnitude');
        title('80th US Trace, Sensor1');
        
        [imf_s80_sensor1,residual_s80_sensor1] = emd(s80_sensor1);
        [hs_s80_sensor1,f_hs80_sensor1,t_hs80_sensor1,imfinsf_hs80_sensor1,imfinse_hs80_sensor1] ... 
            = hht(imf_s80_sensor1,fs,'FrequencyResolution',(fs/2-0)/1000);
        

    else
        fprintf('No OCM file selection ...\n');
    end
end
