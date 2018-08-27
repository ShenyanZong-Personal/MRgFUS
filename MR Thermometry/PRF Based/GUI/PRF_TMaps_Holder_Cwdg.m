function [ ] = PRF_TMaps_Holder_Cwdg( hObject,~ )
%Cwdg_Image_Reveal Create an axes to contain and exhibit all images.
%   Function: axes(),pushbutton(),...,etc

handles = guidata(hObject);

handles.PRF_TMaps_Holder_aObj = axes();

handles.PRF_TMaps_Holder_aObj.Parent         = handles.PRF_Sets_uObj;
handles.PRF_TMaps_Holder_aObj.Units          = 'pixels';
handles.PRF_TMaps_Holder_aObj.Position       = [50 80 400 400];
handles.PRF_TMaps_Holder_aObj.YDir           = 'reverse';
handles.PRF_TMaps_Holder_aObj.XAxisLocation  = 'top';
handles.PRF_TMaps_Holder_aObj.XColor         = 'none';
handles.PRF_TMaps_Holder_aObj.YColor         = 'none';
handles.PRF_TMaps_Holder_aObj.ZColor         = 'none';
handles.PRF_TMaps_Holder_aObj.XLimMode       = 'manual';
handles.PRF_TMaps_Holder_aObj.YLimMode       = 'manual';
handles.PRF_TMaps_Holder_aObj.CLimMode       = 'manual';
handles.PRF_TMaps_Holder_aObj.CLim           = [0 20];


guidata(hObject,handles);

end

