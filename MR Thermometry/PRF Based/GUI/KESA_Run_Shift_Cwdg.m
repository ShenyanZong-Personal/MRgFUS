function [  ] = KESA_Run_Shift_Cwdg( hObject,~ )
%Shift_Analysis Analyze KESA maps to get shift map in kspace
%   ...

handles = guidata(hObject);

handles.KESA_Run_Shift_pObj             = uicontrol();
handles.KESA_Run_Shift_pObj.Parent      = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_Run_Shift_pObj.Style       = 'pushbutton';
handles.KESA_Run_Shift_pObj.Units       = 'pixels';
handles.KESA_Run_Shift_pObj.Position    = [370 310 80 40];
handles.KESA_Run_Shift_pObj.FontSize    = 12;
handles.KESA_Run_Shift_pObj.String      = 'R-Shift';
handles.KESA_Run_Shift_pObj.Callback    = @Get_Shift_Map_Callback;


guidata(hObject,handles);

end

function [ ] = Get_Shift_Map_Callback(hObject,~)


handles = guidata(hObject);

Maps_KESA   = handles.KESA_fObj.UserData.Maps_KESA;
%Row         = handles.KESA_fObj.UserData.Headers.Row;
%Col         = handles.KESA_fObj.UserData.Headers.Column;

Maps_Shift.Map_Shift_iFFT           = 0;
Maps_Shift.Map_Shift_POCS           = 0;
Maps_Shift.Map_Shift_iFFT_Smoothing = 0;

%PhaseEncodingDirection = handles.KESA_fObj.UserData.Headers.PhaseEncodingDirection;
%switch PhaseEncodingDirection
%    case 'ROW'
%        Nkxy = Col;
%    case 'COL'
%        Nkxy = Row;
%end

if Maps_KESA.Maps_KESA_iFFT == 0
    
else 
    Maps_KESA_iFFT = Maps_KESA.Maps_KESA_iFFT;
    
    Map_Shift_iFFT              = Drop_Determine(Maps_KESA_iFFT);
    Maps_Shift.Map_Shift_iFFT   = Map_Shift_iFFT;
end

if Maps_KESA.Maps_KESA_POCS == 0
    
else
    Maps_KESA_POCS = Maps_KESA.Maps_KESA_POCS;
    
    Map_Shift_POCS              = Drop_Determine(Maps_KESA_POCS);
    Maps_Shift.Map_Shift_POCS   = Map_Shift_POCS;
end

if Maps_KESA.Maps_KESA_iFFT_Smoothing == 0
    
else
    Maps_KESA_iFFT_Smoothing = Maps_KESA.Maps_KESA_iFFT_Smoothing;
    
    Map_Shift_iFFT_Smoothing            = Drop_Determine(Maps_KESA_iFFT_Smoothing);
    Maps_Shift.Map_Shift_iFFT_Smoothing = Map_Shift_iFFT_Smoothing;
end

% Waiting to continue ...

%PhaseEncodingDirection = handles.MR_KESA.UserData.Headers.PhaseEncodingDirection;
%switch PhaseEncodingDirection 
%    case 'ROW'
%        Nkxy = col;
%    case 'COL'
%        Nkxy = row;
%end
%KESA_profile    = zeros(1,Nkxy);
%{
KESA_Shift_Map  = zeros(Row,Col);
for iRow = 1:Row
    for iCol = 1:Col
        
        profile     = Maps_KESA(iRow,iCol,:);
        profile     = squeeze(profile)';
        profile_G   = gradient(profile);
        
        Dropping_P  = find( profile_G == min(profile_G) );
        KESA_Shift_Map(iRow,iCol) = Dropping_P;
        
    end
end

handles.KESA_Shift_Map_iObj                 = image();
handles.KESA_Shift_Map_iObj.Parent          = handles.KESA_Shift_Map_aObj;
handles.KESA_Shift_Map_iObj.CData           = KESA_Shift_Map;
handles.KESA_Shift_Map_iObj.CDataMapping    = 'scaled';
colormap(handles.KESA_Shift_Map_aObj,'Jet');
%}



guidata(hObject,handles);

end