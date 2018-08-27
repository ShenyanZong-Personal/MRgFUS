function [ ] = PRF_Open_Cwdg( hObject,~ )
% Cwdg_Open Present a dialog to load images for analysis
%   Function: axes(),pushbutton(),...,etc

handles = guidata(hObject);

handles.PRF_Open_uObj                 =   uicontrol();
handles.PRF_Open_uObj.Parent          =   handles.PRF_Sets_uObj;
handles.PRF_Open_uObj.Style           =   'pushbutton';
handles.PRF_Open_uObj.Position        =   [550 450 100 30];
handles.PRF_Open_uObj.String          =   'Open-PRF';
handles.PRF_Open_uObj.FontSize        =   12;
handles.PRF_Open_uObj.Callback        =   @PRF_Open_CallBack;


guidata(hObject,handles);

end

function [ ] = PRF_Open_CallBack( hObject,~ )
%Open_CallBack  Response to load image files for button 'Open'.
%   ...

handles = guidata(hObject);

[Maps_Cplx,Headers]     =   Read_Image();

handles.PRF_fObj.UserData.Maps_Cplx  =   Maps_Cplx;
handles.PRF_fObj.UserData.Headers    =   Headers;

if Maps_Cplx == 0
    
else
    
    handles.PRF_TMaps_Holder_aObj.XLim = [0.50 Headers.Column+0.50];
    handles.PRF_TMaps_Holder_aObj.YLim = [0.50 Headers.Row+0.50];
    
    if isfield(handles,'PRF_Encoding_Orient_Obj')
        handles = rmfield(handles,'PRF_Encoding_Orient_Obj');
    else
        PRF_Encoding_Orient_Cwdg(hObject);
    end
    
    handles.PRF_Para_Obj.Paras_TxT_tObj.String = {['TR: ' num2str(Headers.TR)],...
        ['TE: ' num2str(Headers.TE)],...
        ['NCoils: ' num2str(Headers.NumberOfCoil)],...
        ['TPhase: ' num2str(Headers.TemporalPhase)],...
        ['NSlice: ' num2str(Headers.NumberOfSlice)],...
        ['TiSlice: ' num2str(Headers.SliceThickness)],...
        ['PixelBW: ' num2str(Headers.PixelBW)],...
        ['Matrix: ' num2str(Headers.Row) '×' num2str(Headers.Column)],...
        ['FOV: ' num2str(Headers.FOV)]};
    
    [TMaps_Coil,TMaps_Combined]                 = PRF(hObject);
    handles.PRF_fObj.UserData.TMaps_Coil        = TMaps_Coil;
    handles.PRF_fObj.UserData.TMaps_Combined    = TMaps_Combined;
    
    fprintf('>> Temperature Maps! Ready! ...\n');
    
    handles.PRF_TMap_iObj                = image();
    handles.PRF_TMap_iObj.CDataMapping   = 'scaled';
    
    NSlice      = Headers.NumberOfSlice;
    NTimePhase  = Headers.TemporalPhase;
    NCoil       = Headers.NumberOfCoil;
    
    switch handles.PRF_Combined_Option_rObj.Value
        case 0
            TMaps_Current = TMaps_Coil;
        case 1
            TMaps_Current = TMaps_Combined;
    end
    handles.PRF_fObj.UserData.TMaps_Current     = TMaps_Current;
    
    for iSlice = 1:NSlice
        
        handles.PRF_Slice_Control_Obj.iSlice_TxT_tObj.String = [num2str(iSlice) '/' num2str(NSlice)];
        
        for iCoil = 1:NCoil
            
            handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.String = [num2str(iCoil) '/' num2str(NCoil)];
            
            for iTimePhase = 1:NTimePhase
                
                handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.String     = [num2str(iTimePhase) '/' num2str(NTimePhase)];
                TMap_Current                                                    = TMaps_Current(:,:,iSlice,iCoil,iTimePhase);
                handles.PRF_TMap_iObj.CData                                     = TMap_Current;
                pause(0.1);
                
            end
        end
    end
    
    handles.PRF_fObj.UserData.Slice_Current     = iSlice;
    handles.PRF_fObj.UserData.Coil_Current      = iCoil;
    handles.PRF_fObj.UserData.TimePhase_Current = iTimePhase;
    
    handles.PRF_fObj.WindowScrollWheelFcn               = @TMaps_Wheel_Callback;
    handles.PRF_Coil_Control_Obj.Left_pObj.Callback     = @Left_Coil_Wheel_Callback;
    handles.PRF_Coil_Control_Obj.Right_pObj.Callback    = @Right_Coil_Wheel_Callback;
    
end

guidata(hObject,handles);

end

function [ ] = TMaps_Wheel_Callback( hObject,eV,~ )
% Image_TimePhase Exhibit time-varied temperature map
%   ...

handles = guidata(hObject);

TimePhase           = handles.PRF_fObj.UserData.Headers.TemporalPhase;
TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
TMaps_Current       = handles.PRF_fObj.UserData.TMaps_Current;
Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;

if TimePhase_Current < TimePhase && ...
        eV.VerticalScrollCount == -1
    
    TimePhase_Current                           = TimePhase_Current +1;
    handles.PRF_fObj.UserData.TimePhase_Current = TimePhase_Current;
    TMap_Current                                = TMaps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    handles.PRF_TMap_iObj.CData                 = TMap_Current;
    
    handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.String ...
                                                = [num2str(TimePhase_Current) '/' num2str(TimePhase)];
    
elseif TimePhase_Current > 1 && ...
        eV.VerticalScrollCount == 1
    
    TimePhase_Current                           = TimePhase_Current -1;
    handles.PRF_fObj.UserData.TimePhase_Current = TimePhase_Current;
    TMap_Current                                = TMaps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    handles.PRF_TMap_iObj.CData                 = TMap_Current;
    
    handles.PRF_Time_Phase_Index_Obj.Time_Phase_TxT_tObj.String ...
                                                = [num2str(TimePhase_Current) '/' num2str(TimePhase)];
    
else
    
end

guidata(hObject,handles);

end


function [  ] = Left_Coil_Wheel_Callback(hObject,~)

handles = guidata(hObject);

Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;
NCoil               = handles.PRF_fObj.UserData.Headers.NumberOfCoil;
Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
TMaps_Current       = handles.PRF_fObj.UserData.TMaps_Current;

if Coil_Current > 1 
    
    Coil_Current                            = Coil_Current -1;
    handles.PRF_fObj.UserData.Coil_Current  = Coil_Current;
    handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.String ...
                                            = [num2str(Coil_Current) '/' num2str(NCoil)];
    
    TMap_Current                = TMaps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);    
    handles.PRF_TMap_iObj.CData = TMap_Current;

end

guidata(hObject,handles);

end


function [  ] = Right_Coil_Wheel_Callback(hObject,~)

handles = guidata(hObject);

Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;
NCoil               = handles.PRF_fObj.UserData.Headers.NumberOfCoil;
Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
TMaps_Current       = handles.PRF_fObj.UserData.TMaps_Current; 

if Coil_Current < NCoil

    Coil_Current                            = Coil_Current +1;
    handles.PRF_fObj.UserData.Coil_Current  = Coil_Current;
    handles.PRF_Coil_Control_Obj.iCoil_TxT_tObj.String ...
                                            = [num2str(Coil_Current) '/' num2str(NCoil)];
    
    TMap_Current                = TMaps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    handles.PRF_TMap_iObj.CData = TMap_Current;
    
end

guidata(hObject,handles);

end