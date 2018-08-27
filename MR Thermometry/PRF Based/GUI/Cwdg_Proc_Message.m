function [  ] = Cwdg_Proc_Message( hObject,~ )
%Cwdg_Proc_Message Indicate KESA process step by step
%   ...

handles = guidata(hObject);

handles.Proc_Message_eObj                       = uicontrol();
handles.Proc_Message_eObj.Style                 = 'text';
handles.Proc_Message_eObj.Parent                = handles.KESA_TC_Setting_uObj;
handles.Proc_Message_eObj.Units                 = 'pixels';
handles.Proc_Message_eObj.Position              = [5 150 80 30];
handles.Proc_Message_eObj.FontSize              = 12;
handles.Proc_Message_eObj.String                = 'Steps:';
handles.Proc_Message_eObj.HorizontalAlignment   = 'left';

handles.Steps_Info_eObj                         = uicontrol();
handles.Steps_Info_eObj.Style                   = 'text';
handles.Steps_Info_eObj.Parent                  = handles.KESA_TC_Setting_uObj;
handles.Steps_Info_eObj.Units                   = 'pixels';
handles.Steps_Info_eObj.Position                = [5 5 150 145];
handles.Steps_Info_eObj.HorizontalAlignment     = 'left';
handles.Steps_Info_eObj.BackgroundColor         = 'w';
handles.Steps_Info_eObj.FontSize                = 10;

NSlice_Org      = 1;
NSlice          = handles.KESA_TC_fObj.UserData.Headers.NumberOfSlice;
TimePhase_Org   = 1;
TimePhase       = handles.KESA_TC_fObj.UserData.Headers.TemporalPhase;

handles.Steps_Info_eObj.String  = {[ 'iNSlice: ' [num2str(NSlice_Org) '/' num2str(NSlice)] ],...
    [ 'iTimePhase: ' [num2str(TimePhase_Org) '/' num2str(TimePhase)] ]};


guidata(hObject,handles);

end

