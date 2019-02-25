function [ ] = TMapsDisp( OrderNs,varargin )
%
%   

handles.TMapsDisp_fObj              = figure();
handles.TMapsDisp_fObj.Name         = 'Temperature Analysis';
handles.TMapsDisp_fObj.NumberTitle  = 'off';
handles.TMapsDisp_fObj.Position     = [150 150 1000 600];

handles.TMapsHolder_aObj                = axes();
handles.TMapsHolder_aObj.Parent         = handles.TMapsDisp_fObj;
handles.TMapsHolder_aObj.Units          = 'pixels';
handles.TMapsHolder_aObj.Position       = [15 100 400 400];
handles.TMapsHolder_aObj.YDir           = 'reverse';
handles.TMapsHolder_aObj.XAxisLocation  = 'top';
handles.TMapsHolder_aObj.XColor         = 'none';
handles.TMapsHolder_aObj.YColor         = 'none';
handles.TMapsHolder_aObj.XLimMode       = 'manual';
handles.TMapsHolder_aObj.YLimMode       = 'manual';
handles.TMapsHolder_aObj.CLim           = [0 20];
colormap(handles.TMapsHolder_aObj,'Jet');

handles.TMapsSelect_pObj            = uicontrol();
handles.TMapsSelect_pObj.Parent     = handles.TMapsDisp_fObj;
handles.TMapsSelect_pObj.Style      = 'popupmenu';
handles.TMapsSelect_pObj.Position   = [430 470 200 30];
handles.TMapsSelect_pObj.FontSize   = 10;
handles.TMapsSelect_pObj.String     = {' '};
handles.TMapsSelect_pObj.Value      = 1;

handles.TMapsOn_iObj                = image();
handles.TMapsOn_iObj.Parent         = handles.TMapsHolder_aObj;
handles.TMapsOn_iObj.CDataMapping   = 'scaled';

handles.TPhaseDisp_tObj                   = uicontrol();
handles.TPhaseDisp_tObj.Parent            = handles.TMapsDisp_fObj;
handles.TPhaseDisp_tObj.Style             = 'text';
handles.TPhaseDisp_tObj.Units             = 'pixels';
handles.TPhaseDisp_tObj.Position          = [15 75 80 20];
handles.TPhaseDisp_tObj.BackgroundColor   = 'w';
handles.TPhaseDisp_tObj.FontName          = 'Times New Roman';
handles.TPhaseDisp_tObj.FontSize          = 12;

handles.TMapsFirst_tObj          = uicontrol();
handles.TMapsFirst_tObj.Parent   = handles.TMapsDisp_fObj;
handles.TMapsFirst_tObj.Style    = 'checkbox';
handles.TMapsFirst_tObj.Units    = 'pixels';
handles.TMapsFirst_tObj.Position = [430 425 200 30];
handles.TMapsFirst_tObj.String   = 'none';
handles.TMapsFirst_tObj.FontSize = 12;

handles.TMapsSecond_tObj          = uicontrol();
handles.TMapsSecond_tObj.Parent   = handles.TMapsDisp_fObj;
handles.TMapsSecond_tObj.Style    = 'checkbox';
handles.TMapsSecond_tObj.Units    = 'pixels';
handles.TMapsSecond_tObj.Position = [430 390 200 30];
handles.TMapsSecond_tObj.String   = 'none';
handles.TMapsSecond_tObj.FontSize = 12;

handles.TMapsThird_tObj          = uicontrol();
handles.TMapsThird_tObj.Parent   = handles.TMapsDisp_fObj;
handles.TMapsThird_tObj.Style    = 'checkbox';
handles.TMapsThird_tObj.Units    = 'pixels';
handles.TMapsThird_tObj.Position = [430 355 200 30];
handles.TMapsThird_tObj.String   = 'none';
handles.TMapsThird_tObj.FontSize = 12;

handles.PtCompare_pObj          = uicontrol();
handles.PtCompare_pObj.Parent   = handles.TMapsDisp_fObj;
handles.PtCompare_pObj.Style    = 'pushbutton';
handles.PtCompare_pObj.Units    = 'pixels';
handles.PtCompare_pObj.Position = [430 310 200 30];
handles.PtCompare_pObj.String   = 'PtCompare';
handles.PtCompare_pObj.FontSize = 12;

if size(OrderNs,2) == size(varargin,2)
    
    handles.TMapsSelect_pObj.String     = OrderNs;
    
    switch size(OrderNs,2)
        case 1
            handles.TMapsFirst_tObj.String  = OrderNs{1};
            handles.TMapsFirst_tObj.Value   = 1;
        case 2
            handles.TMapsFirst_tObj.String  = OrderNs{1};
            handles.TMapsFirst_tObj.Value   = 1;
            handles.TMapsSecond_tObj.String = OrderNs{2};
            handles.TMapsSecond_tObj.Value  = 1;
        case 3
            handles.TMapsFirst_tObj.String  = OrderNs{1};
            handles.TMapsFirst_tObj.Value   = 1;
            handles.TMapsSecond_tObj.String = OrderNs{2};
            handles.TMapsSecond_tObj.Value  = 1;
            handles.TMapsThird_tObj.String  = OrderNs{3};
            handles.TMapsThird_tObj.Value   = 1;
    end
    
    TMapsOn                 = varargin{ handles.TMapsSelect_pObj.Value };
    handles.eVar.TMapsOn    = TMapsOn;
    [Nx,Ny,~,~,Np]          = size(TMapsOn);
    handles.eVar.Np         = Np;
    handles.eVar.TMapsD     = varargin;
    handles.eVar.OrderNs    = OrderNs;
    
    handles.TMapsHolder_aObj.XLim   = [0.5 Nx+0.5];
    handles.TMapsHolder_aObj.YLim   = [0.5 Ny+0.5];
    
    for iNp = 1:Np
        
        CTMapOn = TMapsOn(:,:,1,1,iNp);
        
        handles.TMapsOn_iObj.CData = CTMapOn;
        pause(0.1);
        
        handles.eVar.CTPhase            = iNp;
        handles.TPhaseDisp_tObj.String  = num2str( handles.eVar.CTPhase );
    end
    
    handles.TMapsDisp_fObj.WindowScrollWheelFcn     = @TPhaseScroll_Callback;
    handles.TMapsSelect_pObj.Callback               = @TMapsSelect_Callback;
    handles.PtCompare_pObj.Callback                 = @PtCompare_Callback;
    
end

hObject = handles.TMapsDisp_fObj;
guidata(hObject,handles);


end




