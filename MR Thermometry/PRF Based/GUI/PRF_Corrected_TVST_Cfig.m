function [ ] = PRF_Corrected_TVST_Cfig( UserData )
%
%   

handles.PRF_OnPoints_Corrected_TVST_fObj                = figure();
handles.PRF_OnPoints_Corrected_TVST_fObj.UserData       = UserData;
handles.PRF_OnPoints_Corrected_TVST_fObj.Name           = 'Temperature VS Time - TE Corrected';
handles.PRF_OnPoints_Corrected_TVST_fObj.NumberTitle    = 'off';
handles.PRF_OnPoints_Corrected_TVST_fObj.Position       = [100 100 1000 600];

hObject = handles.PRF_OnPoints_Corrected_TVST_fObj;

handles.PRF_OnPoints_Corrected_TVST_aObj             = axes();
handles.PRF_OnPoints_Corrected_TVST_aObj.Parent      = handles.PRF_OnPoints_Corrected_TVST_fObj;
handles.PRF_OnPoints_Corrected_TVST_aObj.Units       = 'pixels';
handles.PRF_OnPoints_Corrected_TVST_aObj.Position    = [100 100 600 400];

TChanges_Corrected = UserData.TChanges_Corrected;
    
[~,NTimePhase]  = size(TChanges_Corrected);
NTimePhase_Tick = 1:1:NTimePhase;
    
axes(handles.PRF_OnPoints_Corrected_TVST_aObj);
hold on;
plot(NTimePhase_Tick,TChanges_Corrected,...
        'DisplayName','PRF',...
        'LineWidth',1.5,...
        'Marker','o');

title('Temperature Evoluation','FontSize',12,'FontWeight','normal','FontName','Times New Roman');
ylabel('Temperaure','FontSize',12,'FontName','Times New Roman');
xlabel('Temperary Phase','FontSize',12,'FontName','Times New Roman');
    
handles.PRF_Corrected_axes_legend_lObj            = legend('show');
handles.PRF_Corrected_axes_legend_lObj.FontSize   = 12;
handles.PRF_Corrected_axes_legend_lObj.FontName   = 'Segoe UI';

%legend('show');

guidata(hObject,handles);

end

