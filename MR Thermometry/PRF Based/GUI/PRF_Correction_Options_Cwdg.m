function [ ] = PRF_Correction_Options_Cwdg( hObject,~ )
%
%   

handles = guidata(hObject);

handles.PRF_Delta_TE_Correction_cObj            = uicontrol();
handles.PRF_Delta_TE_Correction_cObj.Parent     = handles.PRF_Sets_uObj;
handles.PRF_Delta_TE_Correction_cObj.Style      = 'checkbox';
handles.PRF_Delta_TE_Correction_cObj.Units      = 'pixels';
handles.PRF_Delta_TE_Correction_cObj.Position   = [10 2 100 30];
handles.PRF_Delta_TE_Correction_cObj.String     = 'TE Calibr';
handles.PRF_Delta_TE_Correction_cObj.FontSize   = 12;
handles.PRF_Delta_TE_Correction_cObj.FontName   = 'New Times Roman';
handles.PRF_Delta_TE_Correction_cObj.Callback   = @TE_Correction_Callback;

guidata(hObject,handles);

end

function [ ] = TE_Correction_Callback( hObject,~ )

handles = guidata(hObject);

if isfield(handles.PRF_fObj.UserData,'Maps_Delta_TE')
    
    if handles.PRF_Delta_TE_Correction_cObj.Value == 1
        
        if isempty( findobj('Name','PRF-TE Corrected') )
            
            TMaps_Coil_Corrected = PRF_Corrected( hObject,handles.PRF_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_iFFT_Smoothing);
        
            handles.PRF_fObj.UserData.TMaps_Coil_Corrected = TMaps_Coil_Corrected;
        
            PRF_Corrected_Cfig( handles.PRF_fObj.UserData );
            
        end
        
    elseif handles.PRF_Delta_TE_Correction_cObj.Value == 0
        
        if isempty( findobj('Name','PRF-TE Corrected') )
            
        else
            
            close( findobj('Name','PRF-TE Corrected') );
            
        end
        
    end
    
else

end
    
guidata(hObject,handles);

end