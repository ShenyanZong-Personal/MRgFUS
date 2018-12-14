function [  ] = Options_Data_Analysis_Cwdg( hObject,~ )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

handles = guidata(hObject);

handles.Options_tObj                        = uicontrol();
handles.Options_tObj.Parent                 = handles.PRF_DataA_uObj;
handles.Options_tObj.Style                  = 'text';
handles.Options_tObj.Units                  = 'pixels';
handles.Options_tObj.Position               = [170 450 80 30];
handles.Options_tObj.String                 = 'Options: ';
handles.Options_tObj.FontSize               = 12;
handles.Options_tObj.HorizontalAlignment    = 'left';
handles.Options_tObj.BackgroundColor        = 'w';

handles.KESA_Orientation_Select_pObj            = uicontrol();
handles.KESA_Orientation_Select_pObj.Parent     = handles.PRF_DataA_uObj;
handles.KESA_Orientation_Select_pObj.Style      = 'popupmenu';
handles.KESA_Orientation_Select_pObj.Units      = 'pixels';
handles.KESA_Orientation_Select_pObj.Position   = [170 420 150 30];
handles.KESA_Orientation_Select_pObj.String     = {'Phase Encoding';'Frequency Encoding'};
handles.KESA_Orientation_Select_pObj.FontSize   = 12;
handles.KESA_Orientation_Select_pObj.FontName   = 'Times New Roman';
handles.KESA_Orientation_Select_pObj.Callback   = @KESA_Orientation_Select;
handles.KESA_Orientation_Select_pObj.Enable     = 'off';


guidata(hObject,handles);

end

function [ ] = KESA_Orientation_Select( hObject,~ )

handles = guidata(hObject);
Headers = handles.PRF_fObj.UserData.Headers;

if handles.KESA_Orientation_Select_pObj.Value == 1
    
    %ED_In_KESA = 'Phase Encoding';   % ED_In_KESA: KESA Along Specified Encoding Direction.   
    
     % Convert Phase Encoding Direction To Its Corresponding 'ROW' Or 'COL'.
    if strcmp(Headers.PhaseEncodingDirection,'ROW')
         RC_For_KESA = 'ROW';
    elseif strcmp(Headers.PhaseEncodingDirection,'COL')
         RC_For_KESA = 'COL';
    end        
    
    handles.PRF_fObj.UserData.RC_For_KESA = RC_For_KESA;
    
elseif handles.KESA_Orientation_Select_pObj.Value == 2
    
    %ED_In_KESA = 'Frequency Encoding';
    if strcmp(Headers.PhaseEncodingDirection,'ROW')
        RC_For_KESA = 'COL';
    elseif strcmp(Headers.PhaseEncodingDirection,'COL')
        RC_For_KESA = 'ROW';
    end
    
    handles.PRF_fObj.UserData.RC_For_KESA = RC_For_KESA;
end


guidata(hObject,handles);

end