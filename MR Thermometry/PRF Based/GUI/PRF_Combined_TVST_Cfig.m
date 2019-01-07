function [ ] = PRF_Combined_TVST_Cfig( UserData )
%
%   

handles.PRF_OnPoints_Combined_TVST_fObj                = figure();
handles.PRF_OnPoints_Combined_TVST_fObj.UserData       = UserData;
handles.PRF_OnPoints_Combined_TVST_fObj.Name           = 'Temperature VS Time - TE Combined';
handles.PRF_OnPoints_Combined_TVST_fObj.NumberTitle    = 'off';
handles.PRF_OnPoints_Combined_TVST_fObj.Position       = [100 100 1000 600];

hObject = handles.PRF_OnPoints_Combined_TVST_fObj;

handles.PRF_OnPoints_Combined_TVST_aObj             = axes();
handles.PRF_OnPoints_Combined_TVST_aObj.Parent      = handles.PRF_OnPoints_Combined_TVST_fObj;
handles.PRF_OnPoints_Combined_TVST_aObj.Units       = 'pixels';
handles.PRF_OnPoints_Combined_TVST_aObj.Position    = [100 100 600 400];

TChanges_Combined = UserData.TChanges_Combined;
    
[~,NTimePhase]  = size(TChanges_Combined);
NTimePhase_Tick = 1:1:NTimePhase;
    
axes(handles.PRF_OnPoints_Combined_TVST_aObj);
hold on;
plot(NTimePhase_Tick,TChanges_Combined,...
        'DisplayName','PRF',...
        'LineWidth',1.5,...
        'Marker','o');

title('Temperature Evoluation','FontSize',12,'FontWeight','normal','FontName','Times New Roman');
ylabel('Temperaure','FontSize',12,'FontName','Times New Roman');
xlabel('Temperary Phase','FontSize',12,'FontName','Times New Roman');
    
handles.PRF_Combined_axes_legend_lObj            = legend('show');
handles.PRF_Combined_axes_legend_lObj.FontSize   = 12;
handles.PRF_Combined_axes_legend_lObj.FontName   = 'Segoe UI';

%legend('show');

guidata(hObject,handles);


end

