function [  ] = KESA_OnPoints_Cwdg( hObject )
%KESA_OnPoint_Cwdg ...
%   ...

handles = guidata(hObject);

handles.KESA_OnPoints_pObj          = uicontrol();
%handles.KESA_OnPoints_pObj.Parent   = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_OnPoints_pObj.Parent   = handles.KESA_One_fObj;
handles.KESA_OnPoints_pObj.Style    = 'pushbutton';
handles.KESA_OnPoints_pObj.Units    = 'pixels';
handles.KESA_OnPoints_pObj.FontSize = 12;
handles.KESA_OnPoints_pObj.String   = 'KOP-Plot';
%handles.KESA_OnPoints_pObj.Position = [370 260 80 40];
handles.KESA_OnPoints_pObj.Position = [810 330 100 30];
handles.KESA_OnPoints_pObj.FontSize = 12;
handles.KESA_OnPoints_pObj.FontName = 'Times New Roman';
handles.KESA_OnPoints_pObj.Callback = @Plot_KESA_OnPoints_Callback;
handles.KESA_OnPoints_pObj.Enable   = 'off';

%Points_DCM_Obj = datacursormode(handles.KESA_fObj);

handles.KESA_OnPoints_Status_tObj                       = uicontrol();
handles.KESA_OnPoints_Status_tObj.Parent                = handles.KESA_One_fObj;
handles.KESA_OnPoints_Status_tObj.Style                 = 'text';
handles.KESA_OnPoints_Status_tObj.Position              = [915 335 300 20];
handles.KESA_OnPoints_Status_tObj.FontSize              = 12;
handles.KESA_OnPoints_Status_tObj.FontName              = 'Times New Roman';
handles.KESA_OnPoints_Status_tObj.String                = 'KESA Maps Are Not Ready ... !';
handles.KESA_OnPoints_Status_tObj.HorizontalAlignment   = 'left';

guidata(hObject,handles);

end

function [  ] = Plot_KESA_OnPoints_Callback(hObject,~)

handles = guidata(hObject);

Maps_KESA       = handles.KESA_One_fObj.UserData.Maps_KESA;

Points_DCM_Obj  = datacursormode(handles.KESA_One_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

Curves_KESA.Curves_KESA_iFFT            = 0;
Curves_KESA.Curves_KESA_POCS            = 0;
Curves_KESA.Curves_KESA_iFFT_Smoothing  = 0;

if isempty(Points_Info)
    
    %fprintf('>> Please Add Data Cursor ... \n');
    handles.KESA_OnPoints_Status_tObj.String = 'Need To Put A Datatip On Maps ... !';
    
else
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
    end
    
    if ~isscalar(Maps_KESA.Maps_KESA_iFFT)
        [~,~,Nkxy]          = size(Maps_KESA.Maps_KESA_iFFT);
        Curves_KESA_iFFT    = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            
            for iNkxy = 1:Nkxy
                Maps_KESA_iFFT_Current = Maps_KESA.Maps_KESA_iFFT(:,:,iNkxy);
                Maps_KESA_iFFT_Current = squeeze(Maps_KESA_iFFT_Current);
                
                Magnitude_iFFT_Current          = Maps_KESA_iFFT_Current(Row_Selected,Col_Selected);
                Curves_KESA_iFFT(iNumP,iNkxy)   = Magnitude_iFFT_Current;
            end
            
        end
        
        Curves_KESA.Curves_KESA_iFFT = Curves_KESA_iFFT;
    end
    
    if ~isscalar(Maps_KESA.Maps_KESA_POCS)
        [~,~,Nkxy]          = size(Maps_KESA.Maps_KESA_POCS);
        Curves_KESA_POCS    = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            for iNkxy = 1:Nkxy
                Maps_KESA_POCS_Current = Maps_KESA.Maps_KESA_POCS(:,:,iNkxy);
                Maps_KESA_POCS_Current = squeeze(Maps_KESA_POCS_Current);
                
                Magnitude_POCS_Current          = Maps_KESA_POCS_Current(Row_Selected,Col_Selected);
                Curves_KESA_POCS(iNumP,iNkxy)   = Magnitude_POCS_Current;
            end
            
        end
        
        Curves_KESA.Curves_KESA_POCS = Curves_KESA_POCS;
    end
    
    if ~isscalar(Maps_KESA.Maps_KESA_iFFT_Smoothing)
        [~,~,Nkxy]                  = size(Maps_KESA.Maps_KESA_iFFT_Smoothing);
        Curves_KESA_iFFT_Smoothing  = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            for iNkxy = 1:Nkxy
                Maps_KESA_iFFT_Smoothing_Current = Maps_KESA.Maps_KESA_iFFT_Smoothing(:,:,iNkxy);
                Maps_KESA_iFFT_Smoothing_Current = squeeze(Maps_KESA_iFFT_Smoothing_Current);
                
                Magnitude_iFFT_Smoothing_Current        = Maps_KESA_iFFT_Smoothing_Current(Row_Selected,Col_Selected);
                Curves_KESA_iFFT_Smoothing(iNumP,iNkxy) = Magnitude_iFFT_Smoothing_Current;
                
            end
            
        end
        
        Curves_KESA.Curves_KESA_iFFT_Smoothing = Curves_KESA_iFFT_Smoothing;
    end
    
    handles.KESA_OnPoints_Status_tObj.String = 'Plotted ... !';
    
end
%{
[~,~,Nkxy]      = size(Maps_KESA);

Points_DCM_Obj  = datacursormode(handles.KESA_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

if isempty(Points_Info)
    fprintf('>> Please Add Data Cursor...\n');
else
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
    end
    
    Curves_KESA = zeros(NumP,Nkxy);
    for iNumP = 1:NumP
        Point_Selected  = Points_Selected(iNumP,:);
        Row_Selected    = Point_Selected(1);
        Col_Selected    = Point_Selected(2);
        
        Curve_KESA              = Maps_KESA(Row_Selected,Col_Selected,:);
        Curve_KESA              = squeeze(Curve_KESA)';
        Curves_KESA(iNumP,:)    = Curve_KESA;
    end
    
    for iNumP = 1:NumP
        Curve_KESA = Curves_KESA(iNumP,:);
        
        hold(handles.KESA_OnPoints_Plot_aObj,'on');
        plot(handles.KESA_OnPoints_Plot_aObj,Curve_KESA);
    end
    
    handles.KESA_fObj.UserData.Points_Selected = Points_Selected;
end
%}

handles.KESA_OnPoints_pObj.UserData.Curves_KESA = Curves_KESA;
handles.KESA_OnPoints_pObj.UserData.Headers     = handles.KESA_One_fObj.UserData.Headers;
handles.KESA_One_fObj.UserData.Curves_KESA      = Curves_KESA;

%fprintf('>> Build KESA Curves On Data Cursor ... / Done ... \n ');
guidata(hObject,handles);

KESA_OnPoints_Plot_Cfig(handles.KESA_OnPoints_pObj.UserData);

end