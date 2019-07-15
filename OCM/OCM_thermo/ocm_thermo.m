clear; close all;

addpath('../for_Shenyan');
addpath('./extern');

% OCM parameters
Ts = 0.4;       % --- Time Duration: ms
fs = 10e6;       % --- Sampling Frequency: MHz

[ocm_file,ocm_path,ocm_format] = uigetfile({'*.bin'},'OCM Data Selection');
if ocm_file == 0
    fprintf('no ocm data selected ...\n');
    return;
else
    if ocm_format == 1
        
        fprintf('read ocm data in *.bin file ...\n');
        [us_ocm,us_ts1,us_ts2,us_nEl] = load_OCMdata([ocm_path ocm_file],-1);
        us_t_stamps = us_ts2 - us_ts2(1);   % --- US Trace Time
        us_s_stamps = 1/fs:1/fs:Ts*10^(-3);
        
        figure(1);
        imagesc(us_t_stamps,us_s_stamps,us_ocm); colormap('Gray');
        ylabel('US Trace Time (s)'); xlabel('US Scan Time (s)');
    end
end

[kspace_file,kspace_path] = uigetfile({'*.dat'},'Reconstructed Images Selection');
if kspace_file == 0
    fprintf('no raw kspace data selected ...\n');
    return;
else
    
    fprintf('read raw kspace data in *.dat file ...\n');
    kspace_obj  = mapVBVD([kspace_path kspace_file]);
    maps_kspace = kspace_obj.image();
    maps_kspace = realign( maps_kspace );
    
end


