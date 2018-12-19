function [  ] = TC_KESA_Convert_To_Delta_TE_Cwdg( hObject,~ )
%
%   

handles = guidata(hObject);

handles.TC_KESA_Convert_To_Delta_TE_pObj            = uicontrol();
handles.TC_KESA_Convert_To_Delta_TE_pObj.Parent     = handles.TC_KESA_fObj;
handles.TC_KESA_Convert_To_Delta_TE_pObj.Style      = 'pushbutton';
handles.TC_KESA_Convert_To_Delta_TE_pObj.Units      = 'pixels';
handles.TC_KESA_Convert_To_Delta_TE_pObj.FontSize   = 12;
handles.TC_KESA_Convert_To_Delta_TE_pObj.String     = 'To Delta TE';
handles.TC_KESA_Convert_To_Delta_TE_pObj.Position   = [1000 520 100 30];
handles.TC_KESA_Convert_To_Delta_TE_pObj.FontName   = 'Times New Roman';
handles.TC_KESA_Convert_To_Delta_TE_pObj.Callback   = @All_To_Delta_TE_Callback;

guidata(hObject,handles);

end

function All_To_Delta_TE_Callback( hObject,~ )

handles = guidata(hObject);

PixelBW     = handles.TC_KESA_fObj.UserData.Headers.PixelBW;
N_Freq      = handles.TC_KESA_fObj.UserData.Headers.FrequencySampling;
Double_BW   = PixelBW*N_Freq;

Maps_Shift  = handles.TC_KESA_fObj.UserData.Maps_Shift;
handle_PRF  = findobj('Name','PRF-based Thermometry');

if isscalar(Maps_Shift.Maps_Shift_iFFT)
    Maps_Delta_TE_iFFT = 0;
else
    Maps_Delta_TE_iFFT = Maps_Shift.Maps_Shift_iFFT.*Double_BW;    
end

if isscalar(Maps_Shift.Maps_Shift_POCS)
    Maps_Delta_TE_POCS = 0;
else
    Maps_Delta_TE_POCS = Maps_Shift.Maps_Shift_POCS.*Double_BW;
end

if isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    Maps_Delta_TE_iFFT_Smoothing = 0;
else
    Maps_Delta_TE_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing.*Double_BW;
end

handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_iFFT              = Maps_Delta_TE_iFFT;
handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_POCS              = Maps_Delta_TE_POCS;
handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_iFFT_Smoothing    = Maps_Delta_TE_iFFT_Smoothing;


handle_PRF.UserData.Maps_Delta_TE = handles.TC_KESA_fObj.UserData.Maps_Delta_TE;
guidata(handle_PRF,handle_PRF);

guidata(hObject,handles);

end