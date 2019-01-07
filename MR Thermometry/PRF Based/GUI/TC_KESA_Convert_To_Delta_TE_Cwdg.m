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

handles.TC_KESA_Convert_To_Delta_TE_pObj.Enable = 'off';

PixelBW     = handles.TC_KESA_fObj.UserData.Headers.PixelBW;
N_Freq      = handles.TC_KESA_fObj.UserData.Headers.FrequencySampling;
Double_BW   = PixelBW*N_Freq;

Maps_Shift  = handles.TC_KESA_fObj.UserData.Maps_Shift;
PRF_fObj    = findobj('Name','PRF-based Thermometry');
handles_PRF = guidata(PRF_fObj);

if isscalar(Maps_Shift.Maps_Shift_iFFT)
    Maps_Delta_TE_iFFT = 0;
else
    Maps_Delta_TE_iFFT = Maps_Shift.Maps_Shift_iFFT.*( 1/Double_BW );   %--- Unit: s ---% 
end

if isscalar(Maps_Shift.Maps_Shift_POCS)
    Maps_Delta_TE_POCS = 0;
else
    Maps_Delta_TE_POCS = Maps_Shift.Maps_Shift_POCS.*( 1/Double_BW );   %--- Unit: s ---%
end

if isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    Maps_Delta_TE_iFFT_Smoothing = 0;
else
    Maps_Delta_TE_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing.*( 1/Double_BW );   %--- Unit: s ---%
end

handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_iFFT              = Maps_Delta_TE_iFFT;
handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_POCS              = Maps_Delta_TE_POCS;
handles.TC_KESA_fObj.UserData.Maps_Delta_TE.Maps_Delta_TE_iFFT_Smoothing    = Maps_Delta_TE_iFFT_Smoothing;


handles_PRF.PRF_fObj.UserData.Maps_Delta_TE = handles.TC_KESA_fObj.UserData.Maps_Delta_TE;
guidata(PRF_fObj,handles_PRF);

handles.TC_KESA_Convert_To_Delta_TE_pObj.Enable = 'on';

guidata(hObject,handles);

end