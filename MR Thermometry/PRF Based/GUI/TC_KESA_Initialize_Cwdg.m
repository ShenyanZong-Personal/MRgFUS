function [  ] = TC_KESA_Initialize_Cwdg( hObject,~ )
%TC_KESA Start KESA algorithm for time-continous images
%   ...

handles = guidata(hObject);

handles.TC_KESA_Initialize_pObj             = uicontrol();
handles.TC_KESA_Initialize_pObj.Parent      = handles.PRF_DataA_uObj;
handles.TC_KESA_Initialize_pObj.Style       = 'pushbutton';
handles.TC_KESA_Initialize_pObj.Units       = 'pixels';
handles.TC_KESA_Initialize_pObj.Position    = [50 400 100 30];
handles.TC_KESA_Initialize_pObj.FontSize    = 12;
handles.TC_KESA_Initialize_pObj.String      = 'KESA-TC';
handles.TC_KESA_Initialize_pObj.Callback    = @TC_KESA_Initialize_Callback;
handles.TC_KESA_Initialize_pObj.FontName    = 'Times New Roman';
handles.TC_KESA_Initialize_pObj.Enable      = 'off';


guidata(hObject,handles);


end

function [  ] = TC_KESA_Initialize_Callback(hObject,~)

handles = guidata(hObject);

Maps_Cplx   = handles.PRF_fObj.UserData.Maps_Cplx;
Headers     = handles.PRF_fObj.UserData.Headers;
%TMaps       = handles.MR_PRF.UserData.TMaps;

handles.TC_KESA_Initialize_pObj.UserData.Maps_Cplx      = Maps_Cplx;
handles.TC_KESA_Initialize_pObj.UserData.Headers        = Headers;
handles.TC_KESA_Initialize_pObj.UserData.RC_For_KESA    = handles.PRF_fObj.UserData.RC_For_KESA;
%handles.TC_KESA_pObj.UserData.TMaps      = TMaps;

%fprintf('>> All Data Delievery is Ready ...\n');

TC_KESA_Cfig(handles.TC_KESA_Initialize_pObj.UserData);


guidata(hObject,handles);

end