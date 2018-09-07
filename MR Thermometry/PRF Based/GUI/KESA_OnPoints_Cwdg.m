function [  ] = KESA_OnPoints_Cwdg( hObject )
%KESA_OnPoint_Cwdg ...
%   ...

handles = guidata(hObject);

handles.KESA_OnPoints_pObj          = uicontrol();
handles.KESA_OnPoints_pObj.Parent   = handles.KESA_Map_Shift_Sets_uObj;
handles.KESA_OnPoints_pObj.Style    = 'pushbutton';
handles.KESA_OnPoints_pObj.Units    = 'pixels';
handles.KESA_OnPoints_pObj.FontSize = 12;
handles.KESA_OnPoints_pObj.String   = 'KOP-Plot';
handles.KESA_OnPoints_pObj.Position = [370 260 80 40];
handles.KESA_OnPoints_pObj.Callback = @Plot_KESA_OnPoints_Callback;


%Points_DCM_Obj = datacursormode(handles.KESA_fObj);

guidata(hObject,handles);

end

function [  ] = Plot_KESA_OnPoints_Callback(hObject,~)

handles = guidata(hObject);

Maps_KESA       = handles.KESA_fObj.UserData.Maps_KESA;

Points_DCM_Obj  = datacursormode(handles.KESA_fObj);
Points_Info     = getCursorInfo(Points_DCM_Obj);

Curves_KESA.Curves_KESA_iFFT            = 0;
Curves_KESA.Curves_KESA_POCS            = 0;
Curves_KESA.Curves_KESA_iFFT_Smoothing  = 0;

if isempty(Points_Info)
    fprintf('>> Please Add Data Cursor ... \n');
else
    [~,NumP]        = size(Points_Info);
    Points_Selected = zeros(NumP,2);
    
    for iNumP = 1:NumP
        Points_Selected(iNumP,:) = fliplr( Points_Info(iNumP).Position );
    end
    
    if ~isnumerictype(Maps_KESA.Maps_KESA_iFFT)
        [~,~,Nkxy]          = size(Maps_KESA.Maps_KESA_iFFT);
        Curves_KESA_iFFT    = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            Curve_KESA_iFFT = Maps_KESA.Maps_KESA_iFFT(Row_Selected,Col_Selected);
            Curve_KESA_iFFT = squeeze(Curve_KESA_iFFT);
            
            Curves_KESA_iFFT(iNumP,:) = Curve_KESA_iFFT;
        end
        
        Curves_KESA.Curves_KESA_iFFT = Curves_KESA_iFFT;
    end
    
    if ~isnumerictype(Maps_KESA.Maps_KESA_POCS)
        [~,~,Nkxy]          = size(Maps_KESA.Maps_KESA_POCS);
        Curves_KESA_POCS    = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            Curve_KESA_POCS = Maps_KESA.Maps_KESA_POCS(Row_Selected,Col_Selected);
            Curve_KESA_POCS = squeeze(Curve_KESA_POCS);
            
            Curves_KESA_POCS(iNumP,:) = Curve_KESA_POCS;
        end
        
        Curves_KESA.Curves_KESA_POCS = Curves_KESA_POCS;
    end
    
    if ~isnumerictype(Maps_KESA.Maps_KESA_iFFT_Smoothing)
        [~,~,Nkxy]                  = size(Maps_KESA.Maps_KESA_iFFT_Smoothing);
        Curves_KESA_iFFT_Smoothing  = zeros(NumP,Nkxy);
        
        for iNumP = 1:NumP
            Point_Selected = Points_Selected(iNumP,:);
            
            Row_Selected = Point_Selected(1);
            Col_Selected = Point_Selected(2);
            
            Curve_KESA_iFFT_Smoothing = Maps_KESA.Maps_KESA_iFFT_Smoothing(Row_Selected,Col_Selected);
            Curve_KESA_iFFT_Smoothing = squeeze(Curve_KESA_iFFT_Smoothing);
            
            Curves_KESA_iFFT_Smoothing(iNumP,:) = Curve_KESA_iFFT_Smoothing;
        end
        
        Curves_KESA.Curves_KESA_iFFT_Smoothing = Curves_KESA_iFFT_Smoothing;
    end
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
handles.KESA_OnPoints_pObj.UserData.Headers     = handles.KESA_fObj.UserData.Headers;

fprintf('>> Build KESA Curves On Data Cursor ... / Done ... \n ');
guidata(hObject,handles);

KESA_OnPoints_Plot_Cfig(handles.KESA_OnPoints_pObj.UserData);

end