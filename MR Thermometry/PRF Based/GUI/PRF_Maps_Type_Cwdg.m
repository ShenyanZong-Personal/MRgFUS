function [ ] = PRF_Maps_Type_Cwdg(hObject,~)

handles = guidata(hObject);

handles.Maps_Type_Popupmenu_pObj            = uicontrol();
handles.Maps_Type_Popupmenu_pObj.Parent     = handles.PRF_Sets_uObj;
handles.Maps_Type_Popupmenu_pObj.Units      = 'pixels';
handles.Maps_Type_Popupmenu_pObj.Position   = [50 485 110 25];
handles.Maps_Type_Popupmenu_pObj.Style      = 'popupmenu';
handles.Maps_Type_Popupmenu_pObj.String     = {'Temperature','Phase','Magnitude'};
handles.Maps_Type_Popupmenu_pObj.FontSize   = 12;
handles.Maps_Type_Popupmenu_pObj.FontName   = 'Times New Roman';
handles.Maps_Type_Popupmenu_pObj.Callback   = @Maps_Type_Popupmenu_Callback;

handles.Maps_Type_Popupmenu_pObj.Enable     = 'off';


guidata(hObject,handles);

end

function Maps_Type_Popupmenu_Callback(hObject,~)

handles = guidata(hObject);

if handles.Maps_Type_Popupmenu_pObj.Value == 1
    
    Maps_Current = handles.PRF_fObj.UserData.TMaps_Coil;
    
    Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
    Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;
    TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
    
    Map_Current     = Maps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    
    handles.PRF_TMap_iObj.CData             = Map_Current;
    handles.PRF_fObj.UserData.Maps_Current  = Maps_Current;
    
    handles.PRF_Color_Bar_cObj.Label.String     = 'Temperature';
    handles.PRF_Max_CLim_Control_sObj.Enable    = 'on';
    
    CLim                                        = [0 20];
    handles.PRF_TMaps_Holder_aObj.CLim          = CLim;
    handles.PRF_Color_Bar_cObj.Ticks            = CLim;
    handles.PRF_Color_Bar_cObj.Label.Position   = [1 ( CLim(1)+CLim(2) )/2];
    colormap(handles.PRF_TMaps_Holder_aObj,'Jet');
    
elseif handles.Maps_Type_Popupmenu_pObj.Value == 2
    
    Maps_Cplx       = handles.PRF_fObj.UserData.Maps_Cplx;
    Phase_Maps      = angle(Maps_Cplx);
    Maps_Current    = Phase_Maps;
    
    Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
    Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;
    TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
    
    Map_Current     = Maps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    
    handles.PRF_TMap_iObj.CData             = Map_Current;
    handles.PRF_fObj.UserData.Maps_Current  = Maps_Current;
    
    handles.PRF_Color_Bar_cObj.Label.String     = 'Phase';
    handles.PRF_Max_CLim_Control_sObj.Enable    = 'off';
    
    CLim                                        = [roundn(-pi,-2) roundn(pi,-2)];
    handles.PRF_TMaps_Holder_aObj.CLim          = CLim;
    handles.PRF_Color_Bar_cObj.Ticks            = CLim;
    handles.PRF_Color_Bar_cObj.Label.Position   = [1 ( CLim(1)+CLim(2) )/2];
    colormap(handles.PRF_TMaps_Holder_aObj,'Gray');
    
elseif handles.Maps_Type_Popupmenu_pObj.Value == 3
    
    Maps_Cplx       = handles.PRF_fObj.UserData.Maps_Cplx;
    Magnitude_Maps  = abs(Maps_Cplx);
    Maps_Current    = Magnitude_Maps;
    
    Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
    Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;
    TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
    
    Map_Current     = Maps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
    
    handles.PRF_TMap_iObj.CData             = Map_Current;
    handles.PRF_fObj.UserData.Maps_Current  = Maps_Current;
    
    handles.PRF_Color_Bar_cObj.Label.String     = 'Magnitude';
    handles.PRF_Max_CLim_Control_sObj.Enable    = 'off';
    
    CLim                                        = [roundn(min(min(Map_Current)),-2) roundn(max(max(Map_Current)),-2)];
    handles.PRF_TMaps_Holder_aObj.CLim          = CLim;
    handles.PRF_Color_Bar_cObj.Ticks            = CLim;
    handles.PRF_Color_Bar_cObj.Label.Position   = [1 ( CLim(1)+CLim(2) )/2];
    colormap(handles.PRF_TMaps_Holder_aObj,'Gray');
    
end



guidata(hObject,handles);

end