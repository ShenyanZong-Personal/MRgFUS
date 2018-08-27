function [ ] = PRF_Max_CLim_Control_Cwdg( hObject,~ )
%Cwdg_CLim_Max Control maximal value for colormap
%   ...

handles = guidata(hObject);

handles.PRF_Max_CLim_Control_sObj            = uicontrol();
handles.PRF_Max_CLim_Control_sObj.Style      = 'slider';
handles.PRF_Max_CLim_Control_sObj.Parent     = handles.PRF_Sets_uObj;
handles.PRF_Max_CLim_Control_sObj.Position   = [510 450 25 30];

CLim        = handles.PRF_TMaps_Holder_aObj.CLim;
CMax_Value  = CLim(2);

handles.PRF_Max_CLim_Control_sObj.Value      = CMax_Value;
handles.PRF_Max_CLim_Control_sObj.Max        = 40;
handles.PRF_Max_CLim_Control_sObj.Min        = 6;
handles.PRF_Max_CLim_Control_sObj.SliderStep = ...
    [1/(handles.PRF_Max_CLim_Control_sObj.Max-handles.PRF_Max_CLim_Control_sObj.Min) ...
    1/(handles.PRF_Max_CLim_Control_sObj.Max-handles.PRF_Max_CLim_Control_sObj.Min)];
handles.PRF_Max_CLim_Control_sObj.Callback        = @Max_CLim_Control_CallBack;


guidata(hObject,handles);

end

function [ ] = Max_CLim_Control_CallBack( hObject,~ )
% CLim_Max_CallBack Change upper limit of Colormap
%   ...

handles = guidata(hObject);

CLim        = handles.PRF_TMaps_Holder_aObj.CLim;
CMin_Value  = CLim(1);

CLim_Max_Current                    = handles.PRF_Max_CLim_Control_sObj.Value;
handles.PRF_TMaps_Holder_aObj.CLim  = [CMin_Value CLim_Max_Current];
handles.PRF_Color_Bar_cObj.Ticks    = handles.PRF_TMaps_Holder_aObj.CLim;

handles.PRF_Color_Bar_cObj.Label.Position   = [1 CLim_Max_Current/2];

guidata(hObject,handles);

end