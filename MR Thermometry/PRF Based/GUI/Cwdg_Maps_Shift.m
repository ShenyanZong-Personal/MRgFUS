function [  ] = Cwdg_Maps_Shift( hObject,~ )
%Cwdg_Maps_Shift Create axe() to reveal kshift images
%   ...

handles = guidata(hObject);

Maps_Shift = handles.KESA_TC_fObj.UserData.Maps_Shift;
[Row,Col,NSlice,TimePhase] = size(Maps_Shift);

handles.Maps_Shift_aObj                 = axes();
handles.Maps_Shift_aObj.Parent          = handles.Maps_Shift_Charts_uObj;
handles.Maps_Shift_aObj.Units           = 'pixels';
handles.Maps_Shift_aObj.Position        = [5 25 350 350];
handles.Maps_Shift_aObj.XAxisLocation   = 'top';
handles.Maps_Shift_aObj.YDir            = 'reverse';
handles.Maps_Shift_aObj.XLimMode        = 'manual';
handles.Maps_Shift_aObj.YLimMode        = 'manual';
handles.Maps_Shift_aObj.XLim            = [0.5 Col+0.5];
handles.Maps_Shift_aObj.YLim            = [0.5 Row+0.5];
handles.Maps_Shift_aObj.XColor          = 'none';
handles.Maps_Shift_aObj.YColor          = 'none';
colormap(handles.Maps_Shift_aObj,'Gray');

handles.Maps_Shift_iObj                 = image();
handles.Maps_Shift_iObj.Parent          = handles.Maps_Shift_aObj;
handles.Maps_Shift_iObj.CDataMapping    = 'scaled';

for iNSlice = 1:NSlice
    for iTimePhase = 1:TimePhase
        
        Map_Shift = Maps_Shift(:,:,iNSlice,iTimePhase);
        
        handles.Maps_Shift_iObj.CData = Map_Shift;
        
    end
end

handles.KESA_TC_fObj.WindowScrollWheelFcn           = @Map_Shift_Current;
handles.Maps_Shift_iObj.UserData.iTimePhase_Current = TimePhase;

guidata(hObject,handles);

end

function [  ] = Map_Shift_Current(hObject,EvD)

handles = guidata(hObject);

Maps_Shift                  = handles.KESA_TC_fObj.UserData.Maps_Shift;
[~,~,NSlice,TimePhase]  = size(Maps_Shift);
iTimePhase_Current          = handles.Maps_Shift_iObj.UserData.iTimePhase_Current;

if NSlice == 1
    Maps_Shift_TimePhase = squeeze( Maps_Shift(:,:,NSlice,:) );
else
    
end

if (EvD.VerticalScrollCount < 0) && (iTimePhase_Current < TimePhase)
    
    iTimePhase_Current                                      = iTimePhase_Current +1;
    Map_Shift_Current                                       = Maps_Shift_TimePhase(:,:,iTimePhase_Current);
    handles.Maps_Shift_iObj.CData                           = Map_Shift_Current;
    handles.Maps_Shift_iObj.UserData.iTimePhase_Current     = iTimePhase_Current;
    
elseif (EvD.VerticalScrollCount > 0) && (iTimePhase_Current > 1)
    iTimePhase_Current                                      = iTimePhase_Current -1;
    Map_Shift_Current                                       = Maps_Shift_TimePhase(:,:,iTimePhase_Current);
    handles.Maps_Shift_iObj.CData                           = Map_Shift_Current;
    handles.Maps_Shift_iObj.UserData.iTimePhase_Current     = iTimePhase_Current;
end

guidata(hObject,handles);

end