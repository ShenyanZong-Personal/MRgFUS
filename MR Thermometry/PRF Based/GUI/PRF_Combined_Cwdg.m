function [ ] = PRF_Combined_Cwdg( hObject,~ )
%
%   
handles = guidata(hObject);

handles.PRF_Combined_pObj           = uicontrol();
handles.PRF_Combined_pObj.Parent    = handles.PRF_DataA_uObj;
handles.PRF_Combined_pObj.Style     = 'pushbutton';
handles.PRF_Combined_pObj.String    = 'Combine';
handles.PRF_Combined_pObj.FontSize  = 12;
handles.PRF_Combined_pObj.Position  = [50 300 100 30];
handles.PRF_Combined_pObj.FontName  = 'Times New Roman';
handles.PRF_Combined_pObj.Callback  = @Combine_Coil_Weights_Callback;


guidata(hObject,handles);

end

function Combine_Coil_Weights_Callback( hObject,~ )

handles = guidata(hObject);

if isfield( handles.PRF_fObj.UserData,'WCoils' )

    TMaps_Combined = PRF_Combine(handles.PRF_fObj.UserData.TMaps_Coil,handles.PRF_fObj.UserData.WCoils);

    handles.PRF_fObj.UserData.TMaps_Combined = TMaps_Combined;
    
    PRF_Combined_Show_Cfig( handles.PRF_fObj.UserData );
    
else

end

guidata(hObject,handles);

end


