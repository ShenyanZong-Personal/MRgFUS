function [  ] = TC_KESA_Run_Shift_Cwdg( hObject,~ )
%Cwdg_KESA_TC_Start Start KESA for all images over time
%   ...

handles = guidata(hObject);

CLim                                = [-20 20];
handles.TC_KESA_fObj.UserData.CLim  = CLim;

handles.TC_KESA_Run_Shift_pObj          = uicontrol();
handles.TC_KESA_Run_Shift_pObj.Parent   = handles.TC_KESA_fObj;
handles.TC_KESA_Run_Shift_pObj.Style    = 'pushbutton';
handles.TC_KESA_Run_Shift_pObj.String   = 'R-Shift';
handles.TC_KESA_Run_Shift_pObj.Units    = 'pixels';
handles.TC_KESA_Run_Shift_pObj.Position = [520 520 100 30];
handles.TC_KESA_Run_Shift_pObj.FontSize = 12;
handles.TC_KESA_Run_Shift_pObj.Callback = @TC_KESA_Run_Shift_Callback;
handles.TC_KESA_Run_Shift_pObj.FontName = 'Times New Roman';
handles.TC_KESA_Run_Shift_pObj.Enable   = 'off';

handles.TC_KESA_Shift_Maps_uObj             = uipanel();
handles.TC_KESA_Shift_Maps_uObj.Parent      = handles.TC_KESA_fObj;
handles.TC_KESA_Shift_Maps_uObj.Units       = 'pixels';
handles.TC_KESA_Shift_Maps_uObj.Position    = [10 70 1070 410];

handles.TC_KESA_SM_iFFT_aObj                  = axes();
handles.TC_KESA_SM_iFFT_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_iFFT_aObj.Units            = 'pixels';
handles.TC_KESA_SM_iFFT_aObj.Position         = [5 10 350 350];
handles.TC_KESA_SM_iFFT_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_iFFT_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_iFFT_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_iFFT_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_iFFT_aObj.XColor           = 'none';
handles.TC_KESA_SM_iFFT_aObj.YColor           = 'none';
handles.TC_KESA_SM_iFFT_aObj.Title.String     = 'Shift Map In iFFT';
handles.TC_KESA_SM_iFFT_aObj.Title.FontName   = 'Times New Roman';
%handles.TC_KESA_SM_iFFT_aObj.Colormap         = gray;
colormap(handles.TC_KESA_SM_iFFT_aObj,'Gray');
handles.TC_KESA_SM_iFFT_aObj.CLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_aObj.CLim             = CLim;

handles.TC_KESA_SM_POCS_aObj                  = axes();
handles.TC_KESA_SM_POCS_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_POCS_aObj.Units            = 'pixels';
handles.TC_KESA_SM_POCS_aObj.Position         = [360 10 350 350];
handles.TC_KESA_SM_POCS_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_POCS_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_POCS_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_POCS_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_POCS_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_POCS_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_POCS_aObj.XColor           = 'none';
handles.TC_KESA_SM_POCS_aObj.YColor           = 'none';
handles.TC_KESA_SM_POCS_aObj.Title.String     = 'Shift Map In POCS';
handles.TC_KESA_SM_POCS_aObj.Title.FontName   = 'Times New Roman';
%handles.TC_KESA_SM_POCS_aObj.Colormap         = gray;
colormap(handles.TC_KESA_SM_POCS_aObj,'Gray');
handles.TC_KESA_SM_POCS_aObj.CLimMode         = 'manual';
handles.TC_KESA_SM_POCS_aObj.CLim             = CLim;

handles.TC_KESA_SM_iFFT_Smoothing_aObj                  = axes();
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Parent           = handles.TC_KESA_Shift_Maps_uObj;
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Units            = 'pixels';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Position         = [715 10 350 350];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XAxisLocation    = 'top';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YDir             = 'reverse';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Column];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YLim             = [0.5 handles.TC_KESA_fObj.UserData.Headers.Row];
handles.TC_KESA_SM_iFFT_Smoothing_aObj.XColor           = 'none';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.YColor           = 'none';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Title.String     = 'Shift Map In iFFT-S';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.Title.FontName   = 'Times New Roman';
%handles.TC_KESA_SM_iFFT_Smoothing_aObj.Colormap         = gray;
colormap(handles.TC_KESA_SM_iFFT_Smoothing_aObj,'Gray');
handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLimMode         = 'manual';
handles.TC_KESA_SM_iFFT_Smoothing_aObj.CLim             = CLim;

handles.TC_KESA_SM_Status_tObj                      = uicontrol();
handles.TC_KESA_SM_Status_tObj.Parent               = handles.TC_KESA_fObj;
handles.TC_KESA_SM_Status_tObj.Style                = 'text';
handles.TC_KESA_SM_Status_tObj.FontSize             = 12;
handles.TC_KESA_SM_Status_tObj.FontName             = 'Times New Roman';
handles.TC_KESA_SM_Status_tObj.Position             = [10 40 300 30];
handles.TC_KESA_SM_Status_tObj.HorizontalAlignment  = 'left';
handles.TC_KESA_SM_Status_tObj.String               = 'Ready To Show ... !';

guidata(hObject,handles);

end

function [ ] = TC_KESA_Run_Shift_Callback(hObject,~)

handles = guidata(hObject);

Maps_KESA   = handles.TC_KESA_fObj.UserData.Maps_KESA;
%Ref_KESA    = ( 1+handles.TC_KESA_fObj.UserData.Headers.PhaseSampling )/2;

%handles.TC_KESA_fObj.UserData.Ref_KESA  = Ref_KESA;

Maps_Shift.Maps_Shift_iFFT              = 0;
Maps_Shift.Maps_Shift_POCS              = 0;
Maps_Shift.Maps_Shift_iFFT_Smoothing    = 0;

if Maps_KESA.Maps_KESA_iFFT == 0
    
else
    
    %fprintf('>> Performing! Shift Maps! iFFT ...! \n');
    handles.TC_KESA_SM_Status_tObj.String = 'Getting Shift Maps! iFFT ... !';
    pause(0.1);
    
    Maps_KESA_iFFT = Maps_KESA.Maps_KESA_iFFT;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_iFFT);
    
    Maps_Shift_iFFT = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_iFFT = Maps_KESA_iFFT(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_iFFT = squeeze(Map_KESA_iFFT);
                
                Map_Shift_iFFT = Drop_Determine(Map_KESA_iFFT);
                
                Maps_Shift_iFFT(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_iFFT;
                
                handles.TC_KESA_Shift_Map_iFFT_iObj                 = image();
                handles.TC_KESA_Shift_Map_iFFT_iObj.Parent          = handles.TC_KESA_SM_iFFT_aObj;
                handles.TC_KESA_Shift_Map_iFFT_iObj.CData           = Map_Shift_iFFT;
                handles.TC_KESA_Shift_Map_iFTT_iObj.CDataMapping    = 'scaled';
                pause(0.1);
                
                handles.TC_KESA_Info_tObj.String = ['Infos: iSlice=' num2str(iSlice) ' ' 'iCoil=' num2str(iCoil) ' ' 'iFrame=' num2str(iTimePhase)];
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT = Maps_Shift_iFFT;
    
    %fprintf('>> All Done! Shift Maps! iFFT ...! \n');
    
end

if Maps_KESA.Maps_KESA_POCS == 0
    
else
    
    handles.TC_KESA_SM_Status_tObj.String = 'Performing! Shift Maps! POCS ...!';
    pause(0.1);
    
    Maps_KESA_POCS = Maps_KESA.Maps_KESA_POCS;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_POCS);
    
    Maps_Shift_POCS = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_POCS = Maps_KESA_POCS(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_POCS = squeeze(Map_KESA_POCS);
                
                Map_Shift_POCS = Drop_Determine(Map_KESA_POCS);
                
                Maps_Shift_POCS(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_POCS; 
                
                handles.TC_KESA_Shift_Map_POCS_iObj                 = image();
                handles.TC_KESA_Shift_Map_POCS_iObj.Parent          = handles.TC_KESA_SM_POCS_aObj;
                handles.TC_KESA_Shift_Map_POCS_iObj.CData           = Map_Shift_POCS;
                handles.TC_KESA_Shift_Map_POCS_iObj.CDataMapping    = 'scaled';
                pause(0.1);
                
                handles.TC_KESA_Info_tObj.String = ['Infos: iSlice=' num2str(iSlice) ' ' 'iCoil=' num2str(iCoil) ' ' 'iFrame=' num2str(iTimePhase)];
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_POCS = Maps_Shift_POCS;
    
    %fprintf('>> All Done! Shift Maps! POCS ...! \n');
end

if Maps_KESA.Maps_KESA_iFFT_Smoothing == 0
    
else
    
    handles.TC_KESA_SM_Status_tObj.String = 'Performing! Shift Maps! iFFT-S ... !';
    pause(0.1);
    
    Maps_KESA_iFFT_Smoothing = Maps_KESA.Maps_KESA_iFFT_Smoothing;
    
    [Row,Col,NSlice,NCoil,NTimePhase,~] = size(Maps_KESA_iFFT_Smoothing);
    
    Maps_Shift_iFFT_Smoothing = zeros(Row,Col,NSlice,NCoil,NTimePhase);
    
    for iSlice = 1:NSlice
        for iCoil = 1:NCoil
            for iTimePhase = 1:NTimePhase
                
                Map_KESA_iFFT_Smoothing = Maps_KESA_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase,:);
                Map_KESA_iFFT_Smoothing = squeeze(Map_KESA_iFFT_Smoothing);
                
                Map_Shift_iFFT_Smoothing = Drop_Determine(Map_KESA_iFFT_Smoothing);
                
                Maps_Shift_iFFT_Smoothing(:,:,iSlice,iCoil,iTimePhase) = Map_Shift_iFFT_Smoothing;
                
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj               = image();
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.Parent        = handles.TC_KESA_SM_iFFT_Smoothing_aObj;
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData         = Map_Shift_iFFT_Smoothing;
                handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CDataMapping  = 'scaled';
                pause(0.1);
                
                handles.TC_KESA_Info_tObj.String = ['Infos: iSlice=' num2str(iSlice) ' ' 'iCoil=' num2str(iCoil) ' ' 'iFrame=' num2str(iTimePhase)];
                pause(0.1);
                
            end
        end
    end
    
    Maps_Shift.Maps_Shift_iFFT_Smoothing = Maps_Shift_iFFT_Smoothing;
    
    %fprintf('>> All Done! Shift Maps! iFFT-S ... \n');
end

if isscalar(Maps_Shift.Maps_Shift_iFFT) && isscalar(Maps_Shift.Maps_Shift_POCS) && isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    
else
    
   handles.TC_KESA_fObj.UserData.Slice_Current      = NSlice;
   handles.TC_KESA_fObj.UserData.Coil_Current       = NCoil;
   handles.TC_KESA_fObj.UserData.TimePhase_Current  = NTimePhase;
   
   handles.TC_KESA_iCoil_Info_tObj.String       = num2str(NCoil);
   handles.TC_KESA_iTimePhase_Info_tObj.String  = num2str(NTimePhase);
   handles.TC_KESA_fObj.WindowScrollWheelFcn    = @TC_KESA_iTimePhase_Control_Callback;
   handles.SvsT_OnPoint_pObj.Enable             = 'on';
   
   CLim                                         = handles.TC_KESA_fObj.UserData.CLim;
   handles.TC_KESA_Shift_Win_Up_tObj.String     = num2str( CLim(2) );
   handles.TC_KESA_Shift_Win_Down_tObj.String   = num2str( CLim(1) );
   
end

handles.TC_KESA_fObj.UserData.Maps_Shift        = Maps_Shift;


guidata(hObject,handles);

end

function TC_KESA_iTimePhase_Control_Callback(hObject,eV,~)

handles = guidata(hObject);

if isempty(handles.TC_KESA_iTimePhase_Info_tObj.String)
    
else
    Maps_Cplx               = handles.TC_KESA_fObj.UserData.Maps_Cplx;
    Maps_Shift              = handles.TC_KESA_fObj.UserData.Maps_Shift;
    [~,~,~,~,NTimePhase]    = size(Maps_Cplx);
    iSlice_Current          = handles.TC_KESA_fObj.UserData.Slice_Current;
    iCoil_Current           = handles.TC_KESA_fObj.UserData.Coil_Current;
    
    
    iTimePhase_Current = handles.TC_KESA_fObj.UserData.TimePhase_Current;
    if iTimePhase_Current > 1 && eV.VerticalScrollCount == 1
        
        iTimePhase_Current = iTimePhase_Current -1;
        
        if Maps_Shift.Maps_Shift_iFFT == 0
            
        else
            Map_Shift_iFFT = Maps_Shift.Maps_Shift_iFFT(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_iObj.CData = Map_Shift_iFFT;
        end
        
        if Maps_Shift.Maps_Shift_POCS == 0
            
        else
            Map_Shift_POCS = Maps_Shift.Maps_Shift_POCS(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_POCS_iObj.CData = Map_Shift_POCS;
        end
        
        if Maps_Shift.Maps_Shift_iFFT_Smoothing == 0
            
        else
            Map_Shift_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData = Map_Shift_iFFT_Smoothing;
        end
        
        if isscalar(Maps_Shift.Maps_Shift_iFFT) && isscalar(Maps_Shift.Maps_Shift_POCS) && isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    
        else
    
            handles.TC_KESA_iTimePhase_Info_tObj.String     = num2str(iTimePhase_Current);
            handles.TC_KESA_fObj.UserData.TimePhase_Current = iTimePhase_Current;
            handles.TC_KESA_Info_tObj.String                = ['Infos: iSlice=' num2str(iSlice_Current) ' ' 'iCoil=' num2str(iCoil_Current) ' ' 'iFrame=' num2str(iTimePhase_Current)];
            
        end         
    end
    
    if iTimePhase_Current < NTimePhase && eV.VerticalScrollCount == -1
        
        iTimePhase_Current = iTimePhase_Current +1;
        
        if Maps_Shift.Maps_Shift_iFFT == 0
            
        else
            Map_Shift_iFFT = Maps_Shift.Maps_Shift_iFFT(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_iObj.CData = Map_Shift_iFFT;
        end
        
        if Maps_Shift.Maps_Shift_POCS == 0
            
        else
            Map_Shift_POCS = Maps_Shift.Maps_Shift_POCS(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_POCS_iObj.CData = Map_Shift_POCS;
        end
        
        if Maps_Shift.Maps_Shift_iFFT_Smoothing == 0
            
        else
            Map_Shift_iFFT_Smoothing = Maps_Shift.Maps_Shift_iFFT_Smoothing(:,:,iSlice_Current,iCoil_Current,iTimePhase_Current);
            
            handles.TC_KESA_Shift_Map_iFFT_Smoothing_iObj.CData = Map_Shift_iFFT_Smoothing;
        end
        
        if isscalar(Maps_Shift.Maps_Shift_iFFT) && isscalar(Maps_Shift.Maps_Shift_POCS) && isscalar(Maps_Shift.Maps_Shift_iFFT_Smoothing)
    
        else
            
            handles.TC_KESA_iCoil_Info_tObj.String          = num2str(iCoil_Current);
            handles.TC_KESA_iTimePhase_Info_tObj.String     = num2str(iTimePhase_Current);
            handles.TC_KESA_fObj.UserData.TimePhase_Current = iTimePhase_Current;
            handles.TC_KESA_Info_tObj.String                = ['Infos: iSlice=' num2str(iSlice_Current) ' ' 'iCoil=' num2str(iCoil_Current) ' ' 'iFrame=' num2str(iTimePhase_Current)];
            
        end         
    end
    
end



guidata(hObject,handles);

end




