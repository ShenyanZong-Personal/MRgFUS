function [  ] = KESA_Initialize_Cwdg( hObject,~ )
%Cwdg_KESA Transfer data and create figure for starting KESA
%   ...

handles = guidata(hObject);

handles.KESA_Initialize_pObj            = uicontrol();
handles.KESA_Initialize_pObj.Style      = 'pushbutton';
handles.KESA_Initialize_pObj.Parent     = handles.PRF_DataA_uObj;
handles.KESA_Initialize_pObj.String     = 'KESA';
handles.KESA_Initialize_pObj.FontSize   = 12;
handles.KESA_Initialize_pObj.Position   = [50 450 100 30];
handles.KESA_Initialize_pObj.FontName   = 'Times New Roman';
handles.KESA_Initialize_pObj.Enable     = 'off';

handles.KESA_Initialize_pObj.Callback  = @KESA_Initialize_Callback;

guidata(hObject,handles);

end

function [ ] = KESA_Initialize_Callback(hObject,~)

handles = guidata(hObject);

TimePhase_Current   = handles.PRF_fObj.UserData.TimePhase_Current;
Slice_Current       = handles.PRF_fObj.UserData.Slice_Current;
Coil_Current        = handles.PRF_fObj.UserData.Coil_Current;

Maps_Cplx           = handles.PRF_fObj.UserData.Maps_Cplx;
TMaps_Current       = handles.PRF_fObj.UserData.TMaps_Coil;

TMap_Current        = TMaps_Current(:,:,Slice_Current,Coil_Current,TimePhase_Current);
Map_Cplx_Current    = Maps_Cplx(:,:,Slice_Current,Coil_Current,TimePhase_Current);
Magni_Map_Current   = abs(Map_Cplx_Current);
Phase_Map_Current   = angle(Map_Cplx_Current);
%{
Row     = handles.MR_PRF.UserData.Headers.Row;
Col     = handles.MR_PRF.UserData.Headers.Column;
NCoil   = handles.MR_PRF.UserData.Headers.NumberOfCoil;

WCoils  = zeros(Row,Col,NCoil);
fx      = zeros(Row,Col);
for icoil = 1:NCoil
    fx  = fx + abs(Map_Cplx_Current(:,:,icoil)).^2;
end
for icoil = 1:NCoil
    fx_coil             = abs(Map_Cplx_Current(:,:,icoil)).^2;
    WCoil               = fx_coil./fx;
    WCoils(:,:,icoil)   = WCoil;
end

Map_Magn = zeros(Row,Col);

for icoil = 1:NCoil
    
    Map_Magn = Map_Magn + abs(Map_Cplx_Current(:,:,icoil)) .* WCoils(:,:,icoil);
    Map_Magn(isnan(Map_Magn)) = 0;
end

Map_Phas = zeros(Row,Col);

for icoil = 1:NCoil
    Map_Phas = Map_Phas + angle(Map_Cplx_Current(:,:,icoil)) .* WCoils(:,:,icoil);
    Map_Phas( isnan(Map_Phas) ) = 0;
end

TMaps       = handles.MR_PRF.UserData.TMaps;
TMap        = TMaps(:,:,Slice_Current,TimePhase_Current);

handles.KESA_Initialize_pObj.UserData.Headers  = handles.MR_PRF.UserData.Headers;
handles.KESA_Initialize_pObj.UserData.Map_Magn = Map_Magn;
handles.KESA_Initialize_pObj.UserData.TMap     = TMap;
handles.KESA_Initialize_pObj.UserData.Map_Phas = Map_Phas;
%}

handles.KESA_Initialize_pObj.UserData.Headers               = handles.PRF_fObj.UserData.Headers;
handles.KESA_Initialize_pObj.UserData.Magni_Map_Current     = Magni_Map_Current;
handles.KESA_Initialize_pObj.UserData.Phase_Map_Current     = Phase_Map_Current;
handles.KESA_Initialize_pObj.UserData.TMap_Current          = TMap_Current;
handles.KESA_Initialize_pObj.UserData.Maps_Cplx             = Maps_Cplx;
handles.KESA_Initialize_pObj.UserData.Map_Cplx_Current      = Map_Cplx_Current;
handles.KESA_Initialize_pObj.UserData.Slice_Current         = Slice_Current;
handles.KESA_Initialize_pObj.UserData.Coil_Current          = Coil_Current;
handles.KESA_Initialize_pObj.UserData.TimePhase_Current     = TimePhase_Current;
handles.KESA_Initialize_pObj.UserData.RC_For_KESA           = handles.PRF_fObj.UserData.RC_For_KESA;

%fprintf('>> Data Delievery! Done! ...\n');

KESA_One_Cfig(handles.KESA_Initialize_pObj.UserData);
KESA_Two_Cfig(handles.KESA_Initialize_pObj.UserData);

guidata(hObject,handles);

end

