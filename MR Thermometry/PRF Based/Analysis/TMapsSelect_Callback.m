function [ ] = TMapsSelect_Callback( hObject,~ )
%
%   

handles = guidata(hObject);

NumS    = handles.TMapsSelect_pObj.Value;
TMapsD  = handles.eVar.TMapsD;
CTPhase = handles.eVar.CTPhase;

TMapsOn = TMapsD{ NumS };
CTMapOn = TMapsOn(:,:,1,1,CTPhase);

handles.TMapsOn_iObj.CData  = CTMapOn;
handles.eVar.TMapsOn        = TMapsOn;


guidata(hObject,handles);

end

