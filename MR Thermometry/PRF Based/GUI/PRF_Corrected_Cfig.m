function [  ] = PRF_Corrected_Cfig( UserData )
%Cgro_KESA_Result Display the results of KESA curve and map
%   ...

handles.PRF_Corrected_fObj              = figure();
handles.PRF_Corrected_fObj.UserData     = UserData;
handles.PRF_Corrected_fObj.Name         = 'PRF-TE Corrected';
handles.PRF_Corrected_fObj.NumberTitle  = 'off';
handles.PRF_Corrected_fObj.Position     = [80 80 800 600];

hObject = handles.PRF_Corrected_fObj;
guidata(hObject,handles);

handles.PRF_Maps_Corrected_aObj                 = axes();
handles.PRF_Maps_Corrected_aObj.Parent          = handles.PRF_Corrected_fObj;
handles.PRF_Maps_Corrected_aObj.Units           = 'pixels';
handles.PRF_Maps_Corrected_aObj.Position        = [15 100 400 400];
handles.PRF_Maps_Corrected_aObj.YDir            = 'reverse';
handles.PRF_Maps_Corrected_aObj.XAxisLocation   = 'top';
handles.PRF_Maps_Corrected_aObj.XColor          = 'none';
handles.PRF_Maps_Corrected_aObj.YColor          = 'none';
handles.PRF_Maps_Corrected_aObj.XLimMode        = 'manual';
handles.PRF_Maps_Corrected_aObj.YLimMode        = 'manual';
handles.PRF_Maps_Corrected_aObj.XLim            = [0.5 UserData.Headers.Column];
handles.PRF_Maps_Corrected_aObj.YLim            = [0.5 UserData.Headers.Row];
handles.PRF_Maps_Corrected_aObj.CLim            = [0 20];
colormap(handles.PRF_Maps_Corrected_aObj,'Jet');

guidata(hObject,handles);

TMaps_Coil_Corrected    = UserData.TMaps_Coil_Corrected;
NSlice                  = UserData.Headers.NumberOfSlice;
NCoil                   = UserData.Headers.NumberOfCoil;
NTimePhase              = UserData.Headers.TemporalPhase;

handles.PRF_Maps_Corrected_iObj                 = image();
handles.PRF_Maps_Corrected_iObj.Parent          = handles.PRF_Maps_Corrected_aObj;
handles.PRF_Maps_Corrected_iObj.CDataMapping    = 'scaled';
for iSlice = 1:NSlice
    for iCoil = 1:NCoil
        for iTimePhase = 1:NTimePhase
            
            TMap_Coil_Corrected = TMaps_Coil_Corrected(:,:,iSlice,iCoil,iTimePhase);
            
            handles.PRF_Maps_Corrected_iObj.CData   = TMap_Coil_Corrected;
            pause(0.1);
            
        end
    end
end

guidata(hObject,handles);

PRF_Corrected_Control_Cwdg(hObject);

end

