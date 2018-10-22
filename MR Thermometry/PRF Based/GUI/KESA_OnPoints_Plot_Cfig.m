function [  ] = KESA_OnPoints_Plot_Cfig( UserData )
%KESA_OnPoints_Plot_Cwdg ...
%   ...

handles.KESA_OnPoints_Plot_fObj             = figure();
handles.KESA_OnPoints_Plot_fObj.UserData    = UserData;
handles.KESA_OnPoints_Plot_fObj.Name        = 'Plot KESA Curve';
handles.KESA_OnPoints_Plot_fObj.NumberTitle = 'off';
handles.KESA_OnPoints_Plot_fObj.Position    = [150 150 1000 600];

hObject = handles.KESA_OnPoints_Plot_fObj;

handles.KESA_OnPoints_Plot_aObj             = axes();
handles.KESA_OnPoints_Plot_aObj.Parent      = handles.KESA_OnPoints_Plot_fObj;
handles.KESA_OnPoints_Plot_aObj.Units       = 'pixels';
handles.KESA_OnPoints_Plot_aObj.Position    = [50 100 600 400];

Curves_KESA = UserData.Curves_KESA;

if ~isnumerictype(Curves_KESA.Curves_KESA_iFFT)
    
    [~,Nkxy] = size(Curves_KESA.Curves_KESA_iFFT);
    Nkxy_Tick = 1:1:Nkxy;
    
    axes(handles.KESA_OnPoints_Plot_aObj);
    hold on;
    plot(Nkxy_Tick,Curves_KESA.Curves_KESA_iFFT,...
        'DisplayName','iFFT',...
        'LineWidth',1.5);
end

if ~isnumerictype(Curves_KESA.Curves_KESA_POCS)
    
    [~,Nkxy] = size(Curves_KESA.Curves_KESA_POCS);
    Nkxy_Tick = 1:1:Nkxy;
    
    axes(handles.KESA_OnPoints_Plot_aObj);
    hold on;
    plot(Nkxy_Tick,Curves_KESA.Curves_KESA_POCS,...
        'DisplayName','POCS',...
        'LineWidth',1.5);
end

if ~isnumerictype(Curves_KESA.Curves_KESA_iFFT_Smoothing)
    
    [~,Nkxy] = size(Curves_KESA.Curves_KESA_iFFT_Smoothing);
    Nkxy_Tick = 1:1:Nkxy;
    
    axes(handles.KESA_OnPoints_Plot_aObj);
    hold on;
    plot(Nkxy_Tick,Curves_KESA.Curves_KESA_iFFT_Smoothing,...
        'DisplayName','iFFT-S',...
        'LineWidth',1.5);
end

legend('show');

guidata(hObject,handles);
%{
handles = guidata(hObject);

%Row = handles.KESA_fObj.UserData.Headers.Row;
Col = handles.KESA_fObj.UserData.Headers.Column;

handles.KESA_OnPoints_Plot_aObj                 = axes();
handles.KESA_OnPoints_Plot_aObj.Parent          = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_OnPoints_Plot_aObj.Units           = 'pixels';
handles.KESA_OnPoints_Plot_aObj.Position        = [480 25 450 320];
%handles.KESA_OnPoints_Plot_aObj.XAxisLocation   = 'top';
%handles.KESA_OnPoints_Plot_aObj.YDir            = 'reverse';
%handles.KESA_OnPoints_Plot_aObj.XColor          = 'none';
%handles.KESA_OnPoints_Plot_aObj.YColor          = 'none';
handles.KESA_OnPoints_Plot_aObj.XLimMode        = 'manual';
handles.KESA_OnPoints_Plot_aObj.XLim            = [0 Col];
handles.KESA_OnPoints_Plot_aObj.YLimMode        = 'manual';
handles.KESA_OnPoints_Plot_aObj.YLim            = [0 1];

guidata(hObject,handles);
%}
end

