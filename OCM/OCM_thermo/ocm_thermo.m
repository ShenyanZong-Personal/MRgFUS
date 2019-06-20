clear; clf;

addpath('../for_Shenyan');

[ocm_file,ocm_path,ocm_format] = uigetfile({'*.bin'},'OCM Data Selection');

if ocm_file == 0
    fprintf('no ocm data selected ...\n');
else
    if ocm_format == 1
        fprintf('read ocm data in *.bin file ...\n');
        
        [us_ocm,us_ts1,us_ts2,us_nEl] = load_OCMdata([ocm_path ocm_file],-1);
        
        us_t_stamps = us_ts2 - us_ts2(1);
        
        figure(1);
        imagesc(us_ocm); colormap('Gray');
    end
end