function [ ] = FocusROI_Callback(hObject,~)
%
%   

handles = guidata(hObject);

DataTips    = datacursormode( handles.TMapsDisp_fObj );
DTInfos     = getCursorInfo( DataTips );

if handles.TMapsFirst_tObj.Value == 1 && ...
        handles.TMapsSecond_tObj.Value == 1 && ...
        handles.TMapsThird_tObj.Value ~= 1 && ...
        size(DTInfos,2) == 2
            
    PRows = [DTInfos(1).Position(2) DTInfos(2).Position(2)];
    PCols = [DTInfos(1).Position(1) DTInfos(2).Position(1)];
        
    MinPRow = min( PRows );
    MaxPRow = max( PRows );
    MinPCol = min( PCols );
    MaxPCol = max( PCols );
    
    RecPosition = [MinPCol MinPRow MaxPCol-MinPCol+1 MaxPRow-MinPRow+1];
    
    if ~isfield( handles,'FocusRecROI_rObj' )
        
        handles.FocusRecROI_rObj = rectangle(handles.TMapsHolder_aObj,'Position',RecPosition);
    
        handles.FocusRecROI_rObj.EdgeColor = 'r';
        handles.FocusRecROI_rObj.LineWidth = 1.5;
        
        
        % --- Crop Focus ROI ---
        
        TMaps
        
    else
        
    end
else
    
    if isfield( handles,'FocusRecROI_rObj' )
        
        delete(handles.FocusRecROI_rObj);
        handles = rmfield(handles,'FocusRecROI_rObj');
    end
    
end



guidata(hObject,handles);

end

