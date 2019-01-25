clear; close all;

% --- Image Registration --- %
% --- Demo: Non Rigid Registration --- %

DataSet = load('TMap_For_Registration.mat');

TMap_GoodShim           = DataSet.TMap_GoodShim; % Reference
TMap_BadShim_Corrected  = DataSet.TMap_BadShim_Corrected; % To Be Registered

figure; imshowpair(TMap_GoodShim,TMap_BadShim_Corrected,'montage');
figure; imshowpair(TMap_GoodShim,TMap_BadShim_Corrected);

[D,moving_reg] = imregdemons(TMap_BadShim_Corrected,TMap_GoodShim,[100 100 1000 1000 1000],'AccumulatedFieldSmoothing',1.3,'PyramidLevels',5);

figure; imshowpair(TMap_GoodShim,moving_reg);

figure;imshow(moving_reg,[ ]);