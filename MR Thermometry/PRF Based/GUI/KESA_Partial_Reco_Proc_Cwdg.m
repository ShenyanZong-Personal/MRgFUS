function [  ] = KESA_Partial_Reco_Proc_Cwdg( hObject,~ )
%Cwdg_Partial_Reco_Reveal Reveal partial Fourier reconstruction process
%   ...

handles = guidata(hObject);

Row         = handles.KESA_fObj.UserData.Headers.Row;
Col         = handles.KESA_fObj.UserData.Headers.Column;
Magni_Map   = handles.KESA_fObj.UserData.Magni_Map_Current;
kspace      = fftshift( fft2(Magni_Map) );

handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj                  = axes();
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.Parent           = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.Units            = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.Position         = [10 70 300 300];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.XAxisLocation    = 'top';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.YDir             = 'reverse';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.XLimMode         = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.YLimMode         = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.XLim             = [0.5 Row+0.5];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.YLim             = [0.5 Col+0.5];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.XColor           = 'none';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.YColor           = 'none';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj.CLim             = [0 500];
colormap(handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_aObj,'Gray');

handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_iObj                = image();
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_iObj.CData          = abs(kspace);
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_iObj.CDataMapping   = 'scaled';

handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj                 = axes();
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.Parent          = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.Units           = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.Position        = [350 70 300 300];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.XAxisLocation   = 'top';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.YDir            = 'reverse';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.XLimMode        = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.YLimMode        = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.XLim            = [0.5 Row+0.5];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.YLim            = [0.5 Col+0.5];
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.XColor          = 'none';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.YColor          = 'none';
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj.CLim            = [0 500];
colormap(handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_aObj,'Gray');

handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_iObj                 = image();
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_iObj.CData           = abs(kspace);
handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_iObj.CDataMapping    = 'scaled';

handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj                = axes();
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.Parent         = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.Units          = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.Position       = [690 70 300 300];
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.XAxisLocation  = 'top';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.YDir           = 'reverse';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.XLimMode       = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.YLimMode       = 'manual';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.XLim           = [0.5 Row+0.5];
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.YLim           = [0.5 Col+0.5];
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.XColor         = 'none';
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj.YColor         = 'none';
colormap(handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_aObj,'Gray');

handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_iObj                = image();
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_iObj.CData          = Magni_Map;
handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_iObj.CDataMapping   = 'scaled';


handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj              = uicontrol();
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.Style        = 'pushbutton';
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.Parent       = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.String       = 'pFourier';
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.FontSize     = 12;
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.Units        = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.Position     = [450 10 100 30];
handles.KESA_Partial_Reco_Proc_Obj.Start_Partial_Reco_pObj.Callback     = @Start_KESA_Callback;


handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj          = uibuttongroup();
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj.Parent   = handles.KESA_Partial_Reco_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj.Units    = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj.Position = [10 10 400 40];

handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj             = uicontrol();
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.Parent      = handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.Style       = 'edit';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.Units       = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.Position    = [0 0 80 40];
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.String      = 'Algorithm: ';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_TxT_eObj.FontSize    = 12;

handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj          = uicontrol();
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.Parent   = handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.Style    = 'radiobutton';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.Units    = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.Position = [90 0 80 40];
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.FontSize = 12;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_rObj.String   = 'iFFT';

handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj          = uicontrol();
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.Parent   = handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.Style    = 'radiobutton';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.Units    = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.Position = [180 0 80 40];
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.FontSize = 12;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_POCS_rObj.String   = 'POCS';

handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj             = uicontrol();
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.Parent      = handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.Style       = 'radiobutton';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.Units       = 'pixels';
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.Position    = [270 0 80 40];
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.FontSize    = 12;
handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_iFFT_Smoothing_rObj.String      = 'iFFT-S';

guidata(hObject,handles);

end

function [ ] = Start_KESA_Callback(hObject,~)

handles = guidata(hObject);

Headers                 = handles.KESA_fObj.UserData.Headers;
Magni_Map               = handles.KESA_fObj.UserData.Magni_Map_Current;
kspace                  = fftshift( fft2(Magni_Map) ) ;
Row                     = Headers.Row;
Col                     = Headers.Column;
PhaseEncodingDirection  = Headers.PhaseEncodingDirection;
Algor                   = handles.KESA_Partial_Reco_Proc_Obj.Partial_Reco_Algor_Sets_uObj.SelectedObject.String;

fprintf('>> Performing Parital Reconstruction ...\n');

switch PhaseEncodingDirection
    case 'ROW'
        
        Nkxy        = Col;
        Maps_KESA   = zeros(Row,Col,Nkxy);
        
        for iNkxy = 1:Nkxy
            
            kspace_Partial = kspace;
            kspace_Partial(:,1:iNkxy) = 0+0i;
            
            switch Algor
                case 'iFFT'
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        Partial_Fourier_iFFT(kspace_Partial);
                case 'POCS'
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        POCS(kspace,iNkxy,PhaseEncodingDirection,Col,4);
                case 'iFFT-S'
                    wid = 16;
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,Col,wid,Row);
                otherwise
                    
            end
            
            handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_iObj.CData            = abs( kspace_Partial );
            pause(0.1);
            handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_iObj.CData       = abs( kspace_Partial_Reco );
            pause(0.1);
            handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Partial_Reco_iObj.CData    = Magni_Map_Reco;
            pause(0.1);
            
            Maps_KESA(:,:,iNkxy)                    = Magni_Map_Reco;
            handles.KESA_fObj.UserData.Maps_KESA    = Maps_KESA;
        end
    case 'COL'
        
        Nkxy        = Row;
        Maps_KESA   = zeros(Row,Col,Nkxy);
        
        for iNkxy = 1:Nkxy
            
            kspace_Partial = kspace;
            kspace_Partial(1:iNkxy,:) = 0+0i;
            
            switch Algor
                case 'iFFT'
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        Partial_Fourier_iFFT(kspace_Partial);
                case 'POCS'
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        POCS(kspace,iNkxy,PhaseEncodingDirection,Row,4);
                case 'iFFT-S'
                    wid = 16;
                    [kspace_Partial_Reco,Magni_Map_Reco] = ...
                        Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,Row,wid,Col);   
                otherwise
                    
            end
            
            handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_iObj.CData            = abs( kspace_Partial );
            pause(0.01);
            handles.KESA_Partial_Reco_Proc_Obj.kspace_Partial_Reco_iObj.CData       = abs( kspace_Partial_Reco );
            pause(0.01);
            handles.KESA_Partial_Reco_Proc_Obj.Magni_Map_Reco_iObj.CData    = Magni_Map_Reco;
            pause(0.01);
            
            Maps_KESA(:,:,iNkxy)                    = Magni_Map_Reco;
            handles.KESA_fObj.UserData.Maps_KESA    = Maps_KESA;
        end
        
    otherwise
        
end

fprintf('>> KESA Maps! Ready! ...\n ');

guidata(hObject,handles);

end