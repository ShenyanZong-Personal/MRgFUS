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
        figure(2);
        imagesc(Tsensor2_tks,Td_tks,ocm_us_sensor2); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');

        %% --- Phase calculation by Hilbert transform
        HbAS_us_sensor1 = hilbert( ocm_us_sensor1 );
        HbAS_us_sensor2 = hilbert( ocm_us_sensor2 );
        
        InstPh_us_sensor1 = unwrap( angle(HbAS_us_sensor1) );
        InstPh_us_sensor2 = unwrap( angle(HbAS_us_sensor2) );
        
        dPh_us_sensor1 = diff( InstPh_us_sensor1 );
        dPh_us_sensor2 = diff( InstPh_us_sensor2 );
        
    else
        fprintf('No OCM file selection ...\n');
    end
end

