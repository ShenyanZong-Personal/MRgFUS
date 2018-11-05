function [  ] = TC_KESA_OnPoint_Plot_Cfig( UserData )
%Cwdg_Maps_Shift Contain axes() to reveal all KESA shift images
%   ...


handles.TC_KESA_OnPoints_Plot_fObj             = figure();
handles.TC_KESA_OnPoints_Plot_fObj.UserData    = UserData;
handles.TC_KESA_OnPoints_Plot_fObj.Name        = 'Plot k VS time';
handles.TC_KESA_OnPoints_Plot_fObj.NumberTitle = 'off';
handles.TC_KESA_OnPoints_Plot_fObj.Position    = [50 50 1000 600];

hObject = handles.TC_KESA_OnPoints_Plot_fObj;

handles.TC_KESA_OnPoints_Plot_aObj             = axes();
handles.TC_KESA_OnPoints_Plot_aObj.Parent      = handles.TC_KESA_OnPoints_Plot_fObj;
handles.TC_KESA_OnPoints_Plot_aObj.Units       = 'pixels';
handles.TC_KESA_OnPoints_Plot_aObj.Position    = [50 100 600 400];

TPlot_Shift = UserData.TPlot_Shift;

if ~isscalar(TPlot_Shift.TPlot_Shift_iFFT)
    
    [~,NTimePhase] = size(TPlot_Shift.TPlot_Shift_iFFT);
    TimePhase_Tick = 1:1:NTimePhase;
    
    axes(handles.TC_KESA_OnPoints_Plot_aObj);
    hold on;
    plot(TimePhase_Tick,TPlot_Shift.TPlot_Shift_iFFT,...
        'DisplayName','iFFT',...
        'LineWidth',1.5);
end

if ~isscalar(TPlot_Shift.TPlot_Shift_POCS)
    
    [~,NTimePhase] = size(TPlot_Shift.TPlot_Shift_POCS);
    TimePhase_Tick = 1:1:NTimePhase;
    
    axes(handles.TC_KESA_OnPoints_Plot_aObj);
    hold on;
    plot(TimePhase_Tick,TPlot_Shift.TPlot_Shift_POCS,...
        'DisplayName','POCS',...
        'LineWidth',1.5);
end

if ~isscalar(TPlot_Shift.TPlot_Shift_iFFT_Smoothing)
    
    [~,NTimePhase] = size(TPlot_Shift.TPlot_Shift_iFFT_Smoothing);
    TimePhase_Tick = 1:1:NTimePhase;
    
    axes(handles.TC_KESA_OnPoints_Plot_aObj);
    hold on;
    plot(TimePhase_Tick,TPlot_Shift.TPlot_Shift_iFFT_Smoothing,...
        'DisplayName','iFFT-S',...
        'LineWidth',1.5);
end

legend('show');

guidata(hObject,handles);



end

