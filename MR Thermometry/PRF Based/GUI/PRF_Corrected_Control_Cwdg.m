function [ ] = PRF_Corrected_Control_Cwdg( hObject,~ )
%
%   

handles = guidata(hObject);

handles.PRF_Corrected_Slice_Text_tObj           = uicontrol();
handles.PRF_Corrected_Slice_Text_tObj.Parent    = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_Slice_Text_tObj.Style     = 'text';
handles.PRF_Corrected_Slice_Text_tObj.Units     = 'pixels';
handles.PRF_Corrected_Slice_Text_tObj.Position  = [440 480 80 20];
handles.PRF_Corrected_Slice_Text_tObj.String    = 'Slice';
handles.PRF_Corrected_Slice_Text_tObj.FontSize  = 12;

handles.PRF_Corrected_Slice_Index_tObj                   = uicontrol();
handles.PRF_Corrected_Slice_Index_tObj.Parent            = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_Slice_Index_tObj.Style             = 'text';
handles.PRF_Corrected_Slice_Index_tObj.Units             = 'pixels';
handles.PRF_Corrected_Slice_Index_tObj.Position          = [430 460 100 20];
handles.PRF_Corrected_Slice_Index_tObj.BackgroundColor   = 'w';
handles.PRF_Corrected_Slice_Index_tObj.FontName          = 'Times New Roman';
handles.PRF_Corrected_Slice_Index_tObj.FontSize          = 12;
handles.PRF_Corrected_Slice_Index_tObj.String            = num2str( handles.PRF_Corrected_fObj.UserData.Headers.NumberOfSlice );

handles.PRF_Corrected_Coil_Text_tObj            = uicontrol();
handles.PRF_Corrected_Coil_Text_tObj.Parent     = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_Coil_Text_tObj.Style      = 'text';
handles.PRF_Corrected_Coil_Text_tObj.Units      = 'pixels';
handles.PRF_Corrected_Coil_Text_tObj.Position   = [440 420 80 20];
handles.PRF_Corrected_Coil_Text_tObj.String     = 'Coil';
handles.PRF_Corrected_Coil_Text_tObj.FontSize   = 12;

handles.PRF_Corrected_Coil_Index_tObj                   = uicontrol();
handles.PRF_Corrected_Coil_Index_tObj.Parent            = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_Coil_Index_tObj.Style             = 'text';
handles.PRF_Corrected_Coil_Index_tObj.Units             = 'pixels';
handles.PRF_Corrected_Coil_Index_tObj.Position          = [430 400 100 20];
handles.PRF_Corrected_Coil_Index_tObj.BackgroundColor   = 'w';
handles.PRF_Corrected_Coil_Index_tObj.FontName          = 'Times New Roman';
handles.PRF_Corrected_Coil_Index_tObj.FontSize          = 12;
handles.PRF_Corrected_Coil_Index_tObj.String            = num2str( handles.PRF_Corrected_fObj.UserData.Headers.NumberOfCoil );

handles.PRF_Corrected_TimePhase_Text_tObj           = uicontrol();
handles.PRF_Corrected_TimePhase_Text_tObj.Parent    = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_TimePhase_Text_tObj.Style     = 'text';
handles.PRF_Corrected_TimePhase_Text_tObj.Units     = 'pixels';
handles.PRF_Corrected_TimePhase_Text_tObj.Position  = [440 360 80 20];
handles.PRF_Corrected_TimePhase_Text_tObj.String    = 'TimePhase';
handles.PRF_Corrected_TimePhase_Text_tObj.FontSize  = 12;

handles.PRF_Corrected_TimePhase_Index_tObj                  = uicontrol();
handles.PRF_Corrected_TimePhase_Index_tObj.Parent           = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_TimePhase_Index_tObj.Style            = 'text';
handles.PRF_Corrected_TimePhase_Index_tObj.Units            = 'pixels';
handles.PRF_Corrected_TimePhase_Index_tObj.Position         = [430 340 100 20];
handles.PRF_Corrected_TimePhase_Index_tObj.BackgroundColor  = 'w';
handles.PRF_Corrected_TimePhase_Index_tObj.FontName         = 'Times New Roman';
handles.PRF_Corrected_TimePhase_Index_tObj.FontSize         = 12;
handles.PRF_Corrected_TimePhase_Index_tObj.String           = num2str( handles.PRF_Corrected_fObj.UserData.Headers.TemporalPhase );

handles.PRF_Corrected_TVST_pObj             = uicontrol();
handles.PRF_Corrected_TVST_pObj.Parent      = handles.PRF_Corrected_fObj;
handles.PRF_Corrected_TVST_pObj.Style       = 'pushbutton';
handles.PRF_Corrected_TVST_pObj.Units       = 'pixels';
handles.PRF_Corrected_TVST_pObj.Position    = [570 470 100 30];
handles.PRF_Corrected_TVST_pObj.FontName    = 'Times New Roman';
handles.PRF_Corrected_TVST_pObj.FontSize    = 12;
handles.PRF_Corrected_TVST_pObj.String      = 'OnPoint';
handles.PRF_Corrected_TVST_pObj.Callback    = @To_Plot_TVST_Callback;

handles.PRF_Corrected_fObj.UserData.CSlice          = handles.PRF_Corrected_fObj.UserData.Headers.NumberOfSlice;
handles.PRF_Corrected_fObj.UserData.CCoil           = handles.PRF_Corrected_fObj.UserData.Headers.NumberOfCoil;
handles.PRF_Corrected_fObj.UserData.CTimePhase      = handles.PRF_Corrected_fObj.UserData.Headers.TemporalPhase;
handles.PRF_Corrected_fObj.WindowScrollWheelFcn     = @PRF_TimePhase_Scroll_Callback;


guidata(hObject,handles);

end

function PRF_TimePhase_Scroll_Callback( hObject,eV,~ )

handles = guidata(hObject);

CTimePhase  = handles.PRF_Corrected_fObj.UserData.CTimePhase;
CCoil       = handles.PRF_Corrected_fObj.UserData.CCoil;
CSlice      = handles.PRF_Corrected_fObj.UserData.CSlice;

NTimePhase              = handles.PRF_Corrected_fObj.UserData.Headers.TemporalPhase;
TMaps_Coil_Corrected    = handles.PRF_Corrected_fObj.UserData.TMaps_Coil_Corrected;

if CTimePhase < NTimePhase && eV.VerticalScrollCount == -1
    
    CTimePhase                                      = CTimePhase +1;
    handles.PRF_Corrected_fObj.UserData.CTimePhase  = CTimePhase;
    
    CTMap_Coil_Corrected                    = TMaps_Coil_Corrected(:,:,CSlice,CCoil,CTimePhase);
    handles.PRF_Maps_Corrected_iObj.CData   = CTMap_Coil_Corrected;
    
    handles.PRF_Corrected_TimePhase_Index_tObj.String = num2str( CTimePhase );
    
elseif CTimePhase > 1 && eV.VerticalScrollCount == 1
    
    CTimePhase                                      = CTimePhase -1;
    handles.PRF_Corrected_fObj.UserData.CTimePhase  = CTimePhase;
    
    CTMap_Coil_Corrected                    = TMaps_Coil_Corrected(:,:,CSlice,CCoil,CTimePhase);
    handles.PRF_Maps_Corrected_iObj.CData   = CTMap_Coil_Corrected;
    
    handles.PRF_Corrected_TimePhase_Index_tObj.String   = num2str(CTimePhase);
    
end

guidata(hObject,handles);

end

function To_Plot_TVST_Callback( hObject,~ )

handles = guidata(hObject);

Points_DCM_Obj  = datacursormode(handles.PRF_Corrected_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

TMaps_Coil_Corrected    = handles.PRF_Corrected_fObj.UserData.TMaps_Coil_Corrected;
CSlice                  = handles.PRF_Corrected_fObj.UserData.CSlice;
CCoil                   = handles.PRF_Corrected_fObj.UserData.CCoil;

if isempty(Points_Info)

else
    
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
        
    end
    
    [~,~,~,~,NTimePhase]    = size(TMaps_Coil_Corrected);
    TChanges_Corrected      = zeros(NumP,NTimePhase);
    
    for iNumP = 1:NumP
        
        Point_Selected = Points_Selected(iNumP,:);
        
        Row_Selected = Point_Selected(1);
        Col_Selected = Point_Selected(2);
        
        TMaps_Change_Corrected = TMaps_Coil_Corrected(:,:,CSlice,CCoil,:);
        TMaps_Change_Corrected = squeeze(TMaps_Change_Corrected);
        
        
        TChange_Corrected           = TMaps_Change_Corrected(Row_Selected,Col_Selected,:);
        TChange_Corrected           = squeeze(TChange_Corrected)';
        TChanges_Corrected(iNumP,:) = TChange_Corrected;
        
    end
    
    handles.PRF_Corrected_fObj.UserData.TChanges_Corrected = TChanges_Corrected;
    PRF_Corrected_TVST_Cfig( handles.PRF_Corrected_fObj.UserData );
    
end

guidata(hObject,handles);

end


