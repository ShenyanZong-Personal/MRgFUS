% This file is to load Siemens MR maps which have been stored in *.mat 
% 
% Edit Histories:
% 07-08-2019 /Shenyan/ Create this file by Shenyan.

clear;

[maps_file,maps_path] = uigetfile({'*.mat'},'Mat Data Selection');
if maps_file == 0
    fprintf('no *.mat file selected ...\n');
else
    fprintf('load maps in *.mat file ...\n');
    DS          = load([maps_path maps_file]);
    maps_obj_m  = DS.IM_recon;
end