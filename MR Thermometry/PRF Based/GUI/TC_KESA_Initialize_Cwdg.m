function [  ] = TC_KESA_Initialize_Cwdg( hObject,~ )
%TC_KESA Start KESA algorithm for time-continous images
%   ...

handles = guidata(hObject);

handles.TC_KESA_pObj             = uicontrol();
handles.TC_KESA_pObj.Parent      = handles.KESA_Map_Shift_Sets_uObj;
handles.TC_KESA_pObj.Style       = 'pushbutton';
handles.TC_KESA_pObj.Units       = 'pixels';
handles.TC_KESA_pObj.Position    = [10 10 100 40];
handles.TC_KESA_pObj.FontSize    = 12;
handles.TC_KESA_pObj.String      = 'TC_KESA';
handles.TC_KESA_pObj.Callback    = @TC_KESA_Initialize_Callback;


guidata(hObject,handles);


end

function [  ] = TC_KESA_Initialize_Callback(hObject,~)

handles = guidata(hObject);

Maps_Cplx   = handles.KESA_fObj.UserData.Maps_Cplx;
Headers     = handles.KESA_fObj.UserData.Headers;
%TMaps       = handles.MR_PRF.UserData.TMaps;

handles.TC_KESA_pObj.UserData.Maps_Cplx  = Maps_Cplx;
handles.TC_KESA_pObj.UserData.Headers    = Headers;
%handles.TC_KESA_pObj.UserData.TMaps      = TMaps;

fprintf('>> All Data Delievery is Ready ...\n');

TC_KESA_Cfig(handles.TC_KESA_pObj.UserData);


guidata(hObject,handles);

end