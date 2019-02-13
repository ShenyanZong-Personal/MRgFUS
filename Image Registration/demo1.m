clear; close all;

% --- Image Registration --- %
% --- Demo: Non Rigid Registration --- %

DataSet1 = load('TMap_For_Registration.mat');

TMap_GoodShim           = DataSet1.TMap_GoodShim; % Reference
TMap_BadShim_Corrected  = DataSet1.TMap_BadShim_Corrected; % To Be Registered

%figure; imshowpair(TMap_GoodShim,TMap_BadShim_Corrected,'montage');
%figure; imshowpair(TMap_GoodShim,TMap_BadShim_Corrected);

%[D,moving_reg] = imregdemons(TMap_BadShim_Corrected,TMap_GoodShim,[100 100 1000 1000 1000],'AccumulatedFieldSmoothing',1.3,'PyramidLevels',5);

%figure; imshowpair(TMap_GoodShim,moving_reg);

%figure;imshow(moving_reg,[ ]);

DataSet2 = load('Map_For_Registration.mat');

Map_GoodShim    = DataSet2.Map_GoodShim;
Map_BadShim     = DataSet2.Map_BadShim;

Magnitude_GoodShim  = abs(Map_GoodShim);
Magnitude_BadShim   = abs(Map_BadShim);

Phase_GoodShim  = angle(Map_GoodShim);
Phase_BadShim   = angle(Map_BadShim);

[D,Magnitude_BadShim_Unwarp] = imregdemons(Magnitude_BadShim,Magnitude_GoodShim,[200 200 200 200 200],'AccumulatedFieldSmoothing',1.0,'PyramidLevels',5);