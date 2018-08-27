function [  ] = Cwdg_KESA_TC( hObject,~ )
%KESA_TC Start KESA algorithm for time-continous images
%   ...

handles = guidata(hObject);

handles.KESA_TC_pObj             = uicontrol();
handles.KESA_TC_pObj.Parent      = handles.PRF_DataA_uObj;
handles.KESA_TC_pObj.Style       = 'pushbutton';
handles.KESA_TC_pObj.Units       = 'pixels';
handles.KESA_TC_pObj.Position    = [50 400 100 30];
handles.KESA_TC_pObj.FontSize    = 12;
handles.KESA_TC_pObj.String      = 'KESA_TC';
handles.KESA_TC_pObj.Callback    = @Pre_KESA_TC;


guidata(hObject,handles);


end

function [  ] = Pre_KESA_TC(hObject,~)

handles = guidata(hObject);

Maps_Cplx   = handles.MR_PRF.UserData.Maps_Cplx;
Headers     = handles.MR_PRF.UserData.Headers;
TMaps       = handles.MR_PRF.UserData.TMaps;

handles.KESA_TC_pObj.UserData.Maps_Cplx  = Maps_Cplx;
handles.KESA_TC_pObj.UserData.Headers    = Headers;
handles.KESA_TC_pObj.UserData.TMaps      = TMaps;

fprintf('>> All Data Delievery is Ready ...\n');

Cfig_KESA_TC(handles.KESA_TC_pObj.UserData);


guidata(hObject,handles);

end