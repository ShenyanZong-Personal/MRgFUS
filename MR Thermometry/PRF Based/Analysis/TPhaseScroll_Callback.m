function [ ] = TPhaseScroll_Callback( hObject,eV,~ )
%
%   

handles = guidata(hObject);

CTPhase     = handles.eVar.CTPhase;
TMapsOn     = handles.eVar.TMapsOn;
Np          = handles.eVar.Np;

if CTPhase < Np && eV.VerticalScrollCount == -1
    
    CTPhase                 = CTPhase +1;
    handles.eVar.CTPhase    = CTPhase;
    
    CTMapOn                     = TMapsOn(:,:,1,1,CTPhase);
    handles.TMapsOn_iObj.CData  = CTMapOn;
    
    handles.TPhaseDisp_tObj.String = num2str( CTPhase );
    
elseif CTPhase > 1 && eV.VerticalScrollCount == 1
    
    CTPhase                 = CTPhase -1;
    handles.eVar.CTPhase    = CTPhase;
    
    CTMapOn                     = TMapsOn(:,:,1,1,CTPhase);
    handles.TMapsOn_iObj.CData  = CTMapOn;
    
    handles.TPhaseDisp_tObj.String   = num2str( CTPhase );
    
end


guidata(hObject,handles);

end

