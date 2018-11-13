function [  ] = PRF_OnPoints_TVST_Cwdg( hObject,~ )
%Cwdg_Maps_Three Create three axes() to reveal Magnitude, Temperature and Phase images over time
%   ...

handles = guidata(hObject);

handles.PRF_OnPoints_TVST_pObj          = uicontrol();
%handles.KESA_OnPoints_pObj.Parent   = handles.KESA_Map_Shift_Sets_uObj;
handles.PRF_OnPoints_TVST_pObj.Parent   = handles.PRF_DataA_uObj;
handles.PRF_OnPoints_TVST_pObj.Style    = 'pushbutton';
handles.PRF_OnPoints_TVST_pObj.Units    = 'pixels';
handles.PRF_OnPoints_TVST_pObj.FontSize = 12;
handles.PRF_OnPoints_TVST_pObj.String   = 'TvsT';
%handles.KESA_OnPoints_pObj.Position = [370 260 80 40];
handles.PRF_OnPoints_TVST_pObj.Position = [50 350 100 30];
handles.PRF_OnPoints_TVST_pObj.FontSize = 12;
handles.PRF_OnPoints_TVST_pObj.FontName = 'Times New Roman';
handles.PRF_OnPoints_TVST_pObj.Callback = @TvsT_OnPoints_Callback;
handles.PRF_OnPoints_TVST_pObj.Enable   = 'off';

guidata(hObject,handles);

end

function TvsT_OnPoints_Callback(hObject,~)

handles = guidata(hObject);

Points_DCM_Obj  = datacursormode(handles.PRF_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

TMaps_Coil      = handles.PRF_fObj.UserData.TMaps_Coil;
Slice_Current   = handles.PRF_fObj.UserData.Slice_Current;
Coil_Current    = handles.PRF_fObj.UserData.Coil_Current;

if isempty(Points_Info)
    
    %fprintf('>> Please Add Data Cursor ... \n');
    %handles.KESA_OnPoints_Status_tObj.String = 'Need To Put A Datatip On Maps ... !';
    
else
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
    end
    
    
    [~,~,~,~,NTimePhase]    = size(TMaps_Coil);
    TChanges                = zeros(NumP,NTimePhase);
        
    for iNumP = 1:NumP
         Point_Selected = Points_Selected(iNumP,:);
            
         Row_Selected = Point_Selected(1);
         Col_Selected = Point_Selected(2);
               
         
         TMaps_Change   = TMaps_Coil(:,:,Slice_Current,Coil_Current,:);
         TMaps_Change   = squeeze(TMaps_Change);
                
         TChange               = TMaps_Change(Row_Selected,Col_Selected,:);
         TChange               = squeeze(TChange)';
         TChanges(iNumP,:)     = TChange;
                  
    end
    
    handles.PRF_fObj.UserData.TChanges = TChanges;
    
end

guidata(hObject,handles);

if isempty(Points_Info)
    
else
    PRF_OnPoints_TVST_Plot_Cfig(handles.PRF_fObj.UserData);
end

end