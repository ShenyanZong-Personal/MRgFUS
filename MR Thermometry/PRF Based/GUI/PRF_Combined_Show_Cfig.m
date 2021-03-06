function [ ] = PRF_Combined_Show_Cfig( UserData )
%
%   

handles.PRF_Combined_Show_fObj              = figure();
handles.PRF_Combined_Show_fObj.UserData     = UserData;
handles.PRF_Combined_Show_fObj.Name         = 'PRF - Combined';
handles.PRF_Combined_Show_fObj.NumberTitle  = 'off';
handles.PRF_Combined_Show_fObj.Position     = [80 80 800 600];

hObject = handles.PRF_Combined_Show_fObj;
guidata(hObject,handles);

handles.PRF_Combined_Holder_aObj                = axes();
handles.PRF_Combined_Holder_aObj.Parent         = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_Holder_aObj.Units          = 'pixels';
handles.PRF_Combined_Holder_aObj.Position       = [15 100 400 400];
handles.PRF_Combined_Holder_aObj.YDir           = 'reverse';
handles.PRF_Combined_Holder_aObj.XAxisLocation  = 'top';
handles.PRF_Combined_Holder_aObj.XColor         = 'none';
handles.PRF_Combined_Holder_aObj.YColor         = 'none';
handles.PRF_Combined_Holder_aObj.XLimMode       = 'manual';
handles.PRF_Combined_Holder_aObj.YLimMode       = 'manual';
handles.PRF_Combined_Holder_aObj.XLim           = [0.5 UserData.Headers.Column];
handles.PRF_Combined_Holder_aObj.YLim           = [0.5 UserData.Headers.Row];
handles.PRF_Combined_Holder_aObj.CLim           = [0 20];
colormap(handles.PRF_Combined_Holder_aObj,'Jet');

handles.PRF_Combined_Slice_Text_tObj           = uicontrol();
handles.PRF_Combined_Slice_Text_tObj.Parent    = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_Slice_Text_tObj.Style     = 'text';
handles.PRF_Combined_Slice_Text_tObj.Units     = 'pixels';
handles.PRF_Combined_Slice_Text_tObj.Position  = [440 480 80 20];
handles.PRF_Combined_Slice_Text_tObj.String    = 'Slice';
handles.PRF_Combined_Slice_Text_tObj.FontSize  = 12;

handles.PRF_Combined_Slice_Index_tObj                   = uicontrol();
handles.PRF_Combined_Slice_Index_tObj.Parent            = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_Slice_Index_tObj.Style             = 'text';
handles.PRF_Combined_Slice_Index_tObj.Units             = 'pixels';
handles.PRF_Combined_Slice_Index_tObj.Position          = [430 460 100 20];
handles.PRF_Combined_Slice_Index_tObj.BackgroundColor   = 'w';
handles.PRF_Combined_Slice_Index_tObj.FontName          = 'Times New Roman';
handles.PRF_Combined_Slice_Index_tObj.FontSize          = 12;

handles.PRF_Combined_TimePhase_Text_tObj           = uicontrol();
handles.PRF_Combined_TimePhase_Text_tObj.Parent    = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_TimePhase_Text_tObj.Style     = 'text';
handles.PRF_Combined_TimePhase_Text_tObj.Units     = 'pixels';
handles.PRF_Combined_TimePhase_Text_tObj.Position  = [440 360 80 20];
handles.PRF_Combined_TimePhase_Text_tObj.String    = 'TimePhase';
handles.PRF_Combined_TimePhase_Text_tObj.FontSize  = 12;

handles.PRF_Combined_TimePhase_Index_tObj                  = uicontrol();
handles.PRF_Combined_TimePhase_Index_tObj.Parent           = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_TimePhase_Index_tObj.Style            = 'text';
handles.PRF_Combined_TimePhase_Index_tObj.Units            = 'pixels';
handles.PRF_Combined_TimePhase_Index_tObj.Position         = [430 340 100 20];
handles.PRF_Combined_TimePhase_Index_tObj.BackgroundColor  = 'w';
handles.PRF_Combined_TimePhase_Index_tObj.FontName         = 'Times New Roman';
handles.PRF_Combined_TimePhase_Index_tObj.FontSize         = 12;

handles.PRF_Combined_TVST_pObj             = uicontrol();
handles.PRF_Combined_TVST_pObj.Parent      = handles.PRF_Combined_Show_fObj;
handles.PRF_Combined_TVST_pObj.Style       = 'pushbutton';
handles.PRF_Combined_TVST_pObj.Units       = 'pixels';
handles.PRF_Combined_TVST_pObj.Position    = [570 470 100 30];
handles.PRF_Combined_TVST_pObj.FontName    = 'Times New Roman';
handles.PRF_Combined_TVST_pObj.FontSize    = 12;
handles.PRF_Combined_TVST_pObj.String      = 'OnPoint';
handles.PRF_Combined_TVST_pObj.Callback    = @To_Plot_TVST_Callback;

guidata(hObject,handles);

TMaps_Combined    = UserData.TMaps_Combined;
NSlice            = UserData.Headers.NumberOfSlice;
NTimePhase        = UserData.Headers.TemporalPhase;

handles.PRF_Maps_Combined_iObj                 = image();
handles.PRF_Maps_Combined_iObj.Parent          = handles.PRF_Combined_Holder_aObj;
handles.PRF_Maps_Combined_iObj.CDataMapping    = 'scaled';
for iSlice = 1:NSlice
    for iTimePhase = 1:NTimePhase

        TMap_Combined                           = TMaps_Combined(:,:,iSlice,iTimePhase);
        handles.PRF_Maps_Combined_iObj.CData    = TMap_Combined;
        pause(0.1);
            
    end
end

handles.PRF_Combined_Show_fObj.UserData.CSlice      = NSlice;
handles.PRF_Combined_Show_fObj.UserData.CTimePhase  = NTimePhase;

handles.PRF_Combined_Slice_Index_tObj.String        = num2str( handles.PRF_Combined_Show_fObj.UserData.Headers.NumberOfSlice );
handles.PRF_Combined_TimePhase_Index_tObj.String    = num2str( handles.PRF_Combined_Show_fObj.UserData.Headers.TemporalPhase );
handles.PRF_Combined_Show_fObj.WindowScrollWheelFcn = @TMaps_Combined_Scroll_Callback;

guidata(hObject,handles);

end

% --- WindowScrollWheelFcn --- 
function TMaps_Combined_Scroll_Callback( hObject,eV,~ )

handles = guidata(hObject);

CTimePhase  = handles.PRF_Combined_Show_fObj.UserData.CTimePhase;
CSlice      = handles.PRF_Combined_Show_fObj.UserData.CSlice;

NTimePhase        = handles.PRF_Combined_Show_fObj.UserData.Headers.TemporalPhase;
TMaps_Combined    = handles.PRF_Combined_Show_fObj.UserData.TMaps_Combined;

if CTimePhase < NTimePhase && eV.VerticalScrollCount == -1
    
    CTimePhase                                          = CTimePhase +1;
    handles.PRF_Combined_Show_fObj.UserData.CTimePhase  = CTimePhase;
    
    CTMap_Combined                          = TMaps_Combined(:,:,CSlice,CTimePhase);
    handles.PRF_Maps_Combined_iObj.CData    = CTMap_Combined;
    
    handles.PRF_Combined_TimePhase_Index_tObj.String = num2str( CTimePhase );
    
elseif CTimePhase > 1 && eV.VerticalScrollCount == 1
    
    CTimePhase                                          = CTimePhase -1;
    handles.PRF_Combined_Show_fObj.UserData.CTimePhase  = CTimePhase;
    
    CTMap_Combined                          = TMaps_Combined(:,:,CSlice,CTimePhase);
    handles.PRF_Maps_Combined_iObj.CData     = CTMap_Combined;
    
    handles.PRF_Combined_TimePhase_Index_tObj.String   = num2str( CTimePhase );
    
end


guidata(hObject,handles);

end
% ----------------------------------------------------------------------- %

% --- Callback ---
function To_Plot_TVST_Callback( hObject,~ )

handles = guidata(hObject);

Points_DCM_Obj  = datacursormode(handles.PRF_Combined_Show_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

TMaps_Combined    = handles.PRF_Combined_Show_fObj.UserData.TMaps_Combined;
CSlice            = handles.PRF_Combined_Show_fObj.UserData.CSlice;

if isempty(Points_Info)

else
    
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
        
    end
    
    [~,~,~,NTimePhase]    = size(TMaps_Combined);
    TChanges_Combined       = zeros(NumP,NTimePhase);
    
    for iNumP = 1:NumP
        
        Point_Selected = Points_Selected(iNumP,:);
        
        Row_Selected = Point_Selected(1);
        Col_Selected = Point_Selected(2);
        
        TMaps_Change_Combined = TMaps_Combined(:,:,CSlice,:);
        TMaps_Change_Combined = squeeze(TMaps_Change_Combined);
        
        
        TChange_Combined           = TMaps_Change_Combined(Row_Selected,Col_Selected,:);
        TChange_Combined           = squeeze(TChange_Combined)';
        TChanges_Combined(iNumP,:) = TChange_Combined;
        
    end
    
    handles.PRF_Combined_Show_fObj.UserData.TChanges_Combined = TChanges_Combined;
    PRF_Combined_TVST_Cfig( handles.PRF_Combined_Show_fObj.UserData );
    
end

guidata(hObject,handles);

end

