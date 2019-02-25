function [ ] = PtCompare_Callback(hObject,~)
%
%   

handles = guidata(hObject);

DCursor = datacursormode( handles.TMapsDisp_fObj );
DCInfo  = getCursorInfo( DCursor );

if isempty( DCInfo )

else
    
    handles.TPlots_fObj                = figure();
    handles.TPlots_fObj.Name           = 'Temperature VS Time - Compare';
    handles.TPlots_fObj.NumberTitle    = 'off';
    handles.TPlots_fObj.Position       = [100 100 1000 600];


    handles.TPlots_aObj             = axes();
    handles.TPlots_aObj.Parent      = handles.TPlots_fObj;
    handles.TPlots_aObj.Units       = 'pixels';
    handles.TPlots_aObj.Position    = [100 100 600 400];
    
    SRow = DCInfo(1).Position(2);
    SCol = DCInfo(1).Position(1);
    
    Np      = handles.eVar.Np;
    NDSet   = size( handles.eVar.TMapsD,2 );
    TMapsD  = handles.eVar.TMapsD;
    OrderNs = handles.eVar.OrderNs;
    NpTick  = 1:1:Np;
    
    Tpfs = zeros(NDSet,Np);
    
    for iNDSet = 1:NDSet
        
        CTMaps = TMapsD{iNDSet};
        
        for iNp = 1:Np
            
            CTMap       = CTMaps(:,:,1,1,iNp);
            Tv          = CTMap(SRow,SCol);
            
            Tpfs(iNDSet,iNp)    = Tv;
            
        end
    end
    
    axes(handles.TPlots_aObj);
    hold on;
    
    if ~strcmp(handles.TMapsFirst_tObj.String,'none') && ...
            handles.TMapsFirst_tObj.Value == 1
        
        plot(NpTick,Tpfs(1,:),'DisplayName',strrep(OrderNs{1},'_','\_'),'LineWidth',1.5,'LineStyle','-','Marker','o','Color','r');
        
    end
    
    if ~strcmp(handles.TMapsSecond_tObj.String,'none') && ...
            handles.TMapsSecond_tObj.Value == 1
        
        plot(NpTick,Tpfs(2,:),'DisplayName',strrep(OrderNs{2},'_','\_'),'LineWidth',1.5,'LineStyle','--','Marker','+','Color','b');
        
    end
    
    if ~strcmp(handles.TMapsThird_tObj.String,'none') && ...
            handles.TMapsThird_tObj.Value == 1
        
        plot(NpTick,Tpfs(3,:),'DisplayName',strrep(OrderNs{3},'_','\_'),'LineWidth',1.5,'LineStyle','-.','Marker','*','Color','c');
        
    end
    
    title('Temperature Evolution','FontSize',12,'FontWeight','normal','FontName','Times New Roman');
    ylabel('Temperaure','FontSize',12,'FontName','Times New Roman');
    xlabel('Phase #N','FontSize',12,'FontName','Times New Roman');

    handles.TPlots_lObj            = legend('show');
    handles.TPlots_lObj.FontSize   = 10;
    handles.TPlots_lObj.FontName   = 'Segoe UI';
    
end



guidata(hObject,handles);

end

