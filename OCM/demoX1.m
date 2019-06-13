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

        %% --- Phase calculation by Hilbert transform
        
        % - Hilbert transform
        HbAS_us_sensor1 = hilbert( ocm_us_sensor1 );
        HbAS_us_sensor2 = hilbert( ocm_us_sensor2 );
        
        InstPh_us_sensor1 = unwrap( angle(HbAS_us_sensor1) );
        InstPh_us_sensor2 = unwrap( angle(HbAS_us_sensor2) );
        
        dPh_us_sensor1 = diff( InstPh_us_sensor1 );
        dPh_us_sensor1 = padarray( dPh_us_sensor1,[1 0],'pre' );
        dPh_us_sensor2 = diff( InstPh_us_sensor2 );
        dPh_us_sensor2 = padarray( dPh_us_sensor2,[1 0],'pre' );
        
        % - Convert instant phase to instant frequency
        instf_us_sensor1 = ( dPh_us_sensor1./(2*pi) ).*fs;
        instf_us_sensor2 = ( dPh_us_sensor2./(2*pi) ).*fs;
        
        figure(3);
        imagesc(Tsensor1_tks,Td_tks,instf_us_sensor1); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title({'Instant Frequency(Hz), Sensor1';'Hilbert Transform'});
        figure(4);
        imagesc(Tsensor2_tks,Td_tks,instf_us_sensor2); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title({'Instant Frequency(Hz), Sensor2';'Hilbert Transform'});
        
        %% --- Phase calculation by negative frequency removal
        us_sensor1_spectrum = fft( ocm_us_sensor1 );  % - along column
        us_sensor2_spectrum = fft( ocm_us_sensor2 );
        
        us_sensor1_spectrum = fftshift( us_sensor1_spectrum,1 );    % - along column
        us_sensor2_spectrum = fftshift( us_sensor2_spectrum,1 );
        
        % - Remove negative frequecy
        us_sensor1_spectrum_positive    = us_sensor1_spectrum;
        us_sensor1_spectrum_positive(1:nEl/2,:)     = [];
        us_sensor2_spectrum_positive    = us_sensor2_spectrum;
        us_sensor2_spectrum_positive(1:nEl/2,:)     = [];
        
        us_sensor1_complex  = ifft( us_sensor1_spectrum_positive );
        us_sensor2_complex  = ifft( us_sensor2_spectrum_positive );
        
        us_sensor1_InstPh   = unwrap( angle(us_sensor1_complex) );
        us_sensor2_InstPh   = unwrap( angle(us_sensor2_complex) );
        
        us_sensor1_dPh  = diff( us_sensor1_InstPh );
        us_sensor1_dPh  = padarray( us_sensor1_dPh,[1 0],'pre' );
        us_sensor2_dPh  = diff( us_sensor2_InstPh );
        us_sensor2_dPh  = padarray( us_sensor2_dPh,[1 0],'pre' );
        
        us_sensor1_instf    = ( us_sensor1_dPh/(2*pi) ).*fs;
        us_sensor2_instf    = ( us_sensor2_dPh/(2*pi) ).*fs;
        
        figure(5); imagesc(Tsensor1_tks,Td_tks(1:2:end),us_sensor1_instf); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title({'Instant Frequency(Hz), Sensor 1';'Negative Frequency Removal'});
        figure(6); imagesc(Tsensor2_tks,Td_tks(1:2:end),us_sensor2_instf); colormap('Gray');
        xlabel('Sensor Time(s)'); ylabel('Ultrasound Time(s)');
        title({'Instant Frequency(Hz), Sensor 2';'Negative Frequency Removal'});
    else
        fprintf('No OCM file selection ...\n');
    end
end

