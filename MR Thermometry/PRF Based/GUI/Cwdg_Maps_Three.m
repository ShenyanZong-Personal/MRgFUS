function [  ] = Cwdg_Maps_Three( hObject,~ )
%Cwdg_Maps_Three Create three axes() to reveal Magnitude, Temperature and Phase images over time
%   ...

handles = guidata(hObject);

Row         = handles.KESA_TC_fObj.UserData.Headers.Row;
Col         = handles.KESA_TC_fObj.UserData.Headers.Column;
Maps_Cplx   = handles.KESA_TC_fObj.UserData.Maps_Cplx;
TMaps       = handles.KESA_TC_fObj.UserData.TMaps;

%---Original Magnitude Image---
handles.Magni_Map_aObj                  = axes();
handles.Magni_Map_aObj.Parent           = handles.Maps_Charts_TC_uObj;
handles.Magni_Map_aObj.Units            = 'pixels';
handles.Magni_Map_aObj.Position         = [10 510 200 200];
handles.Magni_Map_aObj.XAxisLocation    = 'top';
handles.Magni_Map_aObj.YDir             = 'reverse';
handles.Magni_Map_aObj.XLimMode         = 'manual';
handles.Magni_Map_aObj.YLimMode         = 'manual';
handles.Magni_Map_aObj.XLim             = [0.5 Col+0.5];
handles.Magni_Map_aObj.YLim             = [0.5 Row+0.5];
handles.Magni_Map_aObj.XColor           = 'none';
handles.Magni_Map_aObj.YColor           = 'none';
colormap(handles.Magni_Map_aObj,'Gray');

NSlice_Org      = 1;
TimePhase_Org   = 1;
Map_Cplx_Coil_Org    = Maps_Cplx(:,:,NSlice_Org,:,TimePhase_Org);
Map_Cplx_Coil_Org    = squeeze(Map_Cplx_Coil_Org);
NCoil           = handles.KESA_TC_fObj.UserData.Headers.NumberOfCoil;

WCoils  = zeros(Row,Col,NCoil);
fx      = zeros(Row,Col);
for iNCoil = 1:NCoil
    fx  = fx + abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).^2;
end
for iNCoil = 1:NCoil
    fx_Coil             = abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).^2;
    WCoil               = fx_Coil./fx;
    WCoils(:,:,iNCoil)  = WCoil;
end
Magni_Map_Org = zeros(Row,Col);
for iNCoil = 1:NCoil
    Magni_Map_Org = Magni_Map_Org + abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).* WCoils(:,:,iNCoil);
    Magni_Map_Org( isnan(Magni_Map_Org) ) = 0;
end

handles.Magni_Map_iObj                  = image();
handles.Magni_Map_iObj.CData            = Magni_Map_Org;
handles.Magni_Map_iObj.CDataMapping     = 'scaled';
%------------

%---Original Temperature Image---
handles.Tempt_Map_aObj                  = axes();
handles.Tempt_Map_aObj.Parent           = handles.Maps_Charts_TC_uObj;
handles.Tempt_Map_aObj.Units            = 'pixels';
handles.Tempt_Map_aObj.Position         = [10 260 200 200];
handles.Tempt_Map_aObj.XAxisLocation    = 'top';
handles.Tempt_Map_aObj.YDir             = 'reverse';
handles.Tempt_Map_aObj.XLimMode         = 'manual';
handles.Tempt_Map_aObj.YLimMode         = 'manual';
handles.Tempt_Map_aObj.XLim             = [0.5 Row+0.5];
handles.Tempt_Map_aObj.YLim             = [0.5 Col+0.5];
handles.Tempt_Map_aObj.XColor           = 'none';
handles.Tempt_Map_aObj.YColor           = 'none';
colormap(handles.Tempt_Map_aObj,'Jet');

TMap_Org = TMaps(:,:,NSlice_Org,TimePhase_Org);

handles.Tempt_Map_iObj                  = image();
handles.Tempt_Map_iObj.CData            = TMap_Org;
handles.Tempt_Map_iObj.CDataMapping     = 'scaled';
%------------

%---Original Phase Image---
handles.Phase_Map_aObj                  = axes();
handles.Phase_Map_aObj.Parent           = handles.Maps_Charts_TC_uObj;
handles.Phase_Map_aObj.Units            = 'pixels';
handles.Phase_Map_aObj.Position         = [10 10 200 200];
handles.Phase_Map_aObj.XAxisLocation    = 'top';
handles.Phase_Map_aObj.YDir             = 'reverse';
handles.Phase_Map_aObj.XLimMode         = 'manual';
handles.Phase_Map_aObj.YLimMode         = 'manual';
handles.Phase_Map_aObj.XLim             = [0.5 Row+0.5];
handles.Phase_Map_aObj.YLim             = [0.5 Col+0.5];
handles.Phase_Map_aObj.XColor           = 'none';
handles.Phase_Map_aObj.YColor           = 'none';
colormap(handles.Phase_Map_aObj,'Gray');

NSlice_Org      = 1;
TimePhase_Org   = 1;
Map_Cplx_Coil_Org   = Maps_Cplx(:,:,NSlice_Org,:,TimePhase_Org);
Map_Cplx_Coil_Org   = squeeze(Map_Cplx_Coil_Org);
Phase_Map_Coil_Org  = angle(Map_Cplx_Coil_Org);
NCoil               = handles.KESA_TC_fObj.UserData.Headers.NumberOfCoil;

WCoils  = zeros(Row,Col,NCoil);
fx      = zeros(Row,Col);
for iNCoil = 1:NCoil
    fx  = fx + abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).^2;
end
for iNCoil = 1:NCoil
    fx_Coil             = abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).^2;
    WCoil               = fx_Coil./fx;
    WCoils(:,:,iNCoil)  = WCoil;
end
Phase_Map_Org = zeros(Row,Col);
for iNCoil = 1:NCoil
    Phase_Map_Org = Phase_Map_Org + Phase_Map_Coil_Org(:,:,iNCoil).* WCoils(:,:,iNCoil);
    Phase_Map_Org( isnan(Phase_Map_Org) ) = 0;
end

handles.Phase_Map_iObj                  = image();
handles.Phase_Map_iObj.CData            = Phase_Map_Org;
handles.Phase_Map_iObj.CDataMapping     = 'scaled';
%------------

guidata(hObject,handles);

end

