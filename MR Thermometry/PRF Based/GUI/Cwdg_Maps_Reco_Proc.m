function [  ] = Cwdg_Maps_Reco_Proc( hObject,~ )
%Cwdg_Maps_Reco_Proc Create axes() to reveal partial Fourier process
%   ...

handles = guidata(hObject);

Row         = handles.KESA_TC_fObj.UserData.Headers.Row;
Col         = handles.KESA_TC_fObj.UserData.Headers.Column;
Maps_Cplx   = handles.KESA_TC_fObj.UserData.Maps_Cplx;

%---Original Truncated kspace---
handles.kspace_Partial_aObj                 = axes();
handles.kspace_Partial_aObj.Parent          = handles.Reco_PF_Charts_uObj;
handles.kspace_Partial_aObj.Units           = 'pixels';
handles.kspace_Partial_aObj.Position        = [10 10 300 300];
handles.kspace_Partial_aObj.XAxisLocation   = 'top';
handles.kspace_Partial_aObj.YDir            = 'reverse';
handles.kspace_Partial_aObj.XLimMode        = 'manual';
handles.kspace_Partial_aObj.YLimMode        = 'manual';
handles.kspace_Partial_aObj.XLim            = [0.5 Row+0.5];
handles.kspace_Partial_aObj.YLim            = [0.5 Col+0.5];
handles.kspace_Partial_aObj.XColor          = 'none';
handles.kspace_Partial_aObj.YColor          = 'none';
handles.kspace_Partial_aObj.CLim            = [0 1e+03];
colormap(handles.kspace_Partial_aObj,'Gray');

NSlice_Org          = 1;
TimePhase_Org       = 1;
Map_Cplx_Coil_Org   = Maps_Cplx(:,:,NSlice_Org,:,TimePhase_Org);
Map_Cplx_Coil_Org   = squeeze(Map_Cplx_Coil_Org);
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
Magni_Map_Org = zeros(Row,Col);
for iNCoil = 1:NCoil
    Magni_Map_Org = Magni_Map_Org + abs( Map_Cplx_Coil_Org(:,:,iNCoil) ).* WCoils(:,:,iNCoil);
    Magni_Map_Org( isnan(Magni_Map_Org) ) = 0;
end

kspace_Partial_Org                          = fftshift( fft2(Magni_Map_Org) );
handles.kspace_Partial_iObj                 = image();
handles.kspace_Partial_iObj.CData           = abs(kspace_Partial_Org);
handles.kspace_Partial_iObj.CDataMapping    = 'scaled';
%------------

%---Orignal Reconstructed kspace from Partial kspace---
handles.kspace_Partial_Reco_aObj                = axes();
handles.kspace_Partial_Reco_aObj.Parent         = handles.Reco_PF_Charts_uObj;
handles.kspace_Partial_Reco_aObj.Units          = 'pixels';
handles.kspace_Partial_Reco_aObj.Position       = [320 10 300 300];
handles.kspace_Partial_Reco_aObj.XAxisLocation  = 'top';
handles.kspace_Partial_Reco_aObj.YDir           = 'reverse';
handles.kspace_Partial_Reco_aObj.XLimMode       = 'manual';
handles.kspace_Partial_Reco_aObj.YLimMode       = 'manual';
handles.kspace_Partial_Reco_aObj.XLim           = [0.5 Row+0.5];
handles.kspace_Partial_Reco_aObj.YLim           = [0.5 Col+0.5];
handles.kspace_Partial_Reco_aObj.XColor         = 'none';
handles.kspace_Partial_Reco_aObj.YColor         = 'none';
handles.kspace_Partial_Reco_aObj.CLim           = [0 1e+03];
colormap(handles.kspace_Partial_Reco_aObj,'Gray');

handles.kspace_Partial_Reco_iObj                = image();
handles.kspace_Partial_Reco_iObj.CData          = abs(kspace_Partial_Org);
handles.kspace_Partial_Reco_iObj.CDataMapping   = 'scaled';
%------------

%---Original Reconstructed Map---
handles.Magni_Map_Reco_aObj               = axes();
handles.Magni_Map_Reco_aObj.Parent        = handles.Reco_PF_Charts_uObj;
handles.Magni_Map_Reco_aObj.Units         = 'pixels';
handles.Magni_Map_Reco_aObj.Position      = [640 10 300 300];
handles.Magni_Map_Reco_aObj.XAxisLocation = 'top';
handles.Magni_Map_Reco_aObj.YDir          = 'reverse';
handles.Magni_Map_Reco_aObj.XLimMode      = 'manual';
handles.Magni_Map_Reco_aObj.YLimMode      = 'manual';
handles.Magni_Map_Reco_aObj.XLim          = [0.5 Row+0.5];
handles.Magni_Map_Reco_aObj.YLim          = [0.5 Col+0.5];
handles.Magni_Map_Reco_aObj.XColor        = 'none';
handles.Magni_Map_Reco_aObj.YColor        = 'none';
colormap(handles.Magni_Map_Reco_aObj,'Gray');

Magni_Map_Reco_Org = ifft2(kspace_Partial_Org);
handles.Magni_Map_Reco_iObj               = image();
handles.Magni_Map_Reco_iObj.CData         = abs(Magni_Map_Reco_Org);
handles.Magni_Map_Reco_iObj.CDataMapping  = 'scaled';
%------------

guidata(hObject,handles);


end

