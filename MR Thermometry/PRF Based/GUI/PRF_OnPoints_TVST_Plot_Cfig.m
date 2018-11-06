function [  ] = PRF_OnPoints_TVST_Plot_Cfig( UserData )
%Cwdg_Maps_Shift Create axe() to reveal kshift images
%   ...

handles.PRF_OnPoints_TVST_Plot_fObj             = figure();
handles.PRF_OnPoints_TVST_Plot_fObj.UserData    = UserData;
handles.PRF_OnPoints_TVST_Plot_fObj.Name        = 'Plot KESA Curve';
handles.PRF_OnPoints_TVST_Plot_fObj.NumberTitle = 'off';
handles.PRF_OnPoints_TVST_Plot_fObj.Position    = [150 150 1000 600];

hObject = handles.PRF_OnPoints_TVST_Plot_fObj;

handles.PRF_OnPoints_TVST_Plot_aObj             = axes();
handles.PRF_OnPoints_TVST_Plot_aObj.Parent      = handles.PRF_OnPoints_TVST_Plot_fObj;
handles.PRF_OnPoints_TVST_Plot_aObj.Units       = 'pixels';
handles.PRF_OnPoints_TVST_Plot_aObj.Position    = [50 100 600 400];

TChanges = UserData.TChanges;
    
[~,NTimePhase] = size(TChanges);
NTimePhase_Tick = 1:1:NTimePhase;
    
axes(handles.PRF_OnPoints_TVST_Plot_aObj);
hold on;
plot(NTimePhase_Tick,TChanges,...
        'DisplayName','iFFT',...
        'LineWidth',1.5);

legend('show');

guidata(hObject,handles);

end