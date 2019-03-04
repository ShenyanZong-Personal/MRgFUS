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
        
        NRef            = str2double( handles.RefSelection_gObj.SelectedObject.Tag );
        Np              = handles.eVar.Np;
        TMapsRef        = handles.eVar.TMapsD{NRef};
        TMapRefCrop     = TMapsRef(MinPRow:MaxPRow,MinPCol:MaxPCol,1,1,Np);
        
        [NRowCrop,NColCrop] = size(TMapRefCrop);
        TMapRefCropT        = zeros(NRowCrop,NColCrop);
        for iRowCrop = 1:NRowCrop
            for iColCrop = 1:NColCrop
                
                if TMapRefCorp(iRowCrop,iColCrop) >= 2 % --- Focus Threshold
                    
                    TMapRefCropT(iRowCrop,iColCrop) = TMapRefCrop(iRowCrop,iColCrop);
                    
                else
                    
                    TMapRefCropT(iRowCrop,iColCrop) = 0;
                    
                end
                
            end
        end
        
        if str2double( handles.RefSelection_gObj.SelectedObject.Tag ) == 1
            NotNRef = 2;
        elseif str2double( handles.RefSelection_gObj.SelectedObject.Tag ) == 2
            NotNRef = 1;
        end
        
        TMapsNotRef     = handles.eVar.TMapsD{NotNRef};
        TMapNotRefCrop  = TMapsNotRef(MinPRow:MaxPRow,MinPCol:MaxPCol,1,1,Np);
        
        [NRowCrop,NColCrop] = size(TMapNotRefCrop);
        TMapNotRefCropT     = zeros(NRowCrop,NColCrop);
        for iRowCrop = 1:NRowCrop
            for iColCrop = 1:NColCrop
                
                if TMapNotRefCrop(iRowCrop,iColCrop) >= 2 % --- Focus Threshold
                    
                    TMapNotRefCropT(iRowCrop,iColCrop) = TMapNotRefCrop(iRowCrop,iColCrop);
                    
                else
                    
                    TMapNotRefCropT(iRowCrop,iColCrop) = 0;
                    
                end
                
            end
        end
        
        % --- ////// ---
        
        
        
    elseif ~isequal( RecPosition,handles.FocusRecROI_rObj.Position )
        
        handles.FocusRecROI_rObj.Position = RecPosition;
        
        % --- Crop Focus ROI ---
        
        NRef    = str2double( handles.RefSelection_gObj.SelectedObj.Tag );
        Np              = handles.eVar.Np;
        TMapsRef        = handles.eVar.TMapsD{NRef};
        TMapRefCrop     = TMapsRef(MinPRow:MaxPRow,MinPCol:MaxPCol,1,1,Np);
        
        [NRowCrop,NColCrop] = size(TMapsRefCorp);
        TMapRefCropT        = zeros(NRowCrop,NColCrop);
        for iRowCrop = 1:NRowCrop
            for iColCrop = 1:NColCrop
                
                if TMapRefCorp(iRowCrop,iColCrop) >= 2 % --- Focus Threshold
                    
                    TMapRefCropT(iRowCrop,iColCrop) = TMapRefCrop(iRowCrop,iColCrop);
                    
                else
                    
                    TMapRefCropT(iRowCrop,iColCrop) = 0;
                    
                end
                
            end
        end
        
        if str2double( handles.RefSelection_gObj.SelectedObject.Tag ) == 1
            NotNRef = 2;
        elseif str2double( handles.RefSelection_gObj.SelectedObject.Tag ) == 2
            NotNRef = 1;
        end
        
        TMapsNotRef     = handles.eVar.TMapsD{NotNRef};
        TMapNotRefCrop  = TMapsNotRef(MinPRow:MaxPRow,MinPCol:MaxPCol,1,1,Np);
        
        [NRowCrop,NColCrop] = size(TMapNotRefCrop);
        TMapNotRefCropT     = zeros(NRowCrop,NColCrop);
        for iRowCrop = 1:NRowCrop
            for iColCrop = 1:NColCrop
                
                if TMapNotRefCrop(iRowCrop,iColCrop) >= 2 % --- Focus Threshold
                    
                    TMapNotRefCropT(iRowCrop,iColCrop) = TMapNotRefCrop(iRowCrop,iColCrop);
                    
                else
                    
                    TMapNotRefCropT(iRowCrop,iColCrop) = 0;
                    
                end
                
            end
        end
        
        % --- ////// ---
        
        TMapDiffFocusCrop = TMapNotRefCropT - TMapRefCrop
        
    end
else
    
    if isfield( handles,'FocusRecROI_rObj' )
        
        delete(handles.FocusRecROI_rObj);
        handles = rmfield(handles,'FocusRecROI_rObj');
    end
    
end



guidata(hObject,handles);

end

