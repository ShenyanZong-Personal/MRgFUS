function [ ] = PRF_Color_Bar_Cwdg( hObject,~ )
%Cwdg_ColorBar Colorbar to indicate pseudo color
%   Function: Colorbar

handles = guidata(hObject);

handles.PRF_Color_Bar_cObj              =   colorbar();
handles.PRF_Color_Bar_cObj.Parent       =   handles.PRF_Sets_uObj;
handles.PRF_Color_Bar_cObj.Location     =   'manual';
handles.PRF_Color_Bar_cObj.Units        =   'pixels';
handles.PRF_Color_Bar_cObj.Position     =   [460 80 20 400];
handles.PRF_Color_Bar_cObj.Ticks        =   handles.PRF_TMaps_Holder_aObj.CLim;

handles.PRF_Color_Bar_cObj.Label.String      = 'Temperature';
handles.PRF_Color_Bar_cObj.Label.FontSize    = 12;
handles.PRF_Color_Bar_cObj.Label.Position    = [1 10];
handles.PRF_Color_Bar_cObj.Label.FontName    = 'Segoe UI';

guidata(hObject,handles);

end

