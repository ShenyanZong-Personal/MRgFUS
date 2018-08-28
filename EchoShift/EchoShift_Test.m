clear;

%---Read EPI image individually
%{
Map_File_Path   = 'EPI_SurfaceCoil_rs';
Map_File        = double( dicomread(Map_File_Path) );
Map_Headers     = dicominfo(Map_File_Path);

row = Map_Headers.Rows;
col = Map_Headers.Columns;
%}

%---Read my experiment data
%{
Map_File    = load('Map_Selected.mat');
Map_File    = Map_File.Map_Magn;
[row,col]   = size(Map_File);
%}

%---Read MR image with phase
Map_Cplx_File   = open('Map_Cplx.mat');
Map_Cplx        = Map_Cplx_File.Map_Cplx;
Map_File        = Map_Cplx;
[row,col]       = size(Map_File);

handles.Figure_Obj          = figure();
handles.Figure_Obj.Units    = 'pixels';
handles.Figure_Obj.Position = [100 100 800 500];
hObject                     = handles.Figure_Obj;

handles.Axes_Obj                = axes();
handles.Axes_Obj.Parent         = handles.Figure_Obj;
handles.Axes_Obj.XLimMode       = 'manual';
handles.Axes_Obj.XLim           = [0.5 row+0.5];
handles.Axes_Obj.YLimMode       = 'manual';
handles.Axes_Obj.YLim           = [0.5 col+0.5];
handles.Axes_Obj.Units          = 'pixels';
handles.Axes_Obj.Position       = [50 50 400 400];
handles.Axes_Obj.XAxisLocation  = 'top';
handles.Axes_Obj.YDir           = 'reverse';

handles.Image_Obj               = image();
handles.Image_Obj.Parent        = handles.Axes_Obj;
handles.Image_Obj.CData         = abs(Map_File);
handles.Image_Obj.CDataMapping  = 'scaled';
colormap(handles.Axes_Obj,'Gray');

handles.KESA_Obj            = uicontrol();
handles.KESA_Obj.Parent     = handles.Figure_Obj;
handles.KESA_Obj.Style      = 'pushbutton';
handles.KESA_Obj.String     = 'KESA Campare';
handles.KESA_Obj.Units      = 'pixels';
handles.KESA_Obj.Position   = [480 50 150 50];
handles.KESA_Obj.FontSize   = 12;
handles.KESA_Obj.Callback   = @Compare_KESA;

handles.Shift_Obj           = uicontrol();
handles.Shift_Obj.Parent    = handles.Figure_Obj;
handles.Shift_Obj.Style     = 'pushbutton';
handles.Shift_Obj.String    = 'Shift Map';
handles.Shift_Obj.Units     = 'pixels';
handles.Shift_Obj.Position  = [480 150 150 50];
handles.Shift_Obj.FontSize  = 12;
handles.Shift_Obj.Callback  = @Identify_Shift;

guidata(hObject,handles);

kspace = fftshift( fft2(Map_File) );
%PhaseEncodingDirection = Map_Headers.InPlanePhaseEncodingDirection;
%switch PhaseEncodingDirection
PhaseEncodingDirection = 'ROW';
switch PhaseEncodingDirection
    case 'ROW'
        Nkxy = col;
        Maps_KESA = zeros(row,col,Nkxy);
        for iNkxy = 1:Nkxy
            kspace_Truncated            = kspace;
            kspace_Truncated(:,1:iNkxy) = 0+0i;
            %[kspace_Reco,Map_Reco] = Partial_Fourier_iFFT(kspace_Truncated);
            %[kspace_Reco,Map_Reco] = Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,col,16,row);
            [kspace_Reco,Map_Reco] = POCS(kspace,iNkxy,PhaseEncodingDirection,col,2);
            Maps_KESA(:,:,iNkxy) = Map_Reco;
            handles.Figure_Obj.UserData.Maps_KESA = Maps_KESA;
        end
    
    case 'COL'
        Nkxy = row;
        Maps_KESA = zeros(row,col,Nkxy);
        for iNkxy = 1:Nkxy
            kspace_Truncated            = kspace;
            kspace_Truncated(1:iNkxy,:) = 0+0i;
            
            %[kspace_Reco,Map_Reco] = Partial_Fourier_iFFT_Smoothing(kspace,iNkxy,PhaseEncodingDirection,row,16,col);
            [kspace_Reco,Map_Reco] = POCS(kspace,iNkxy,PhaseEncodingDirection,row,2);
            Maps_KESA(:,:,iNkxy) =  Map_Reco;
            handles.Figure_Obj.UserData.Maps_KESA = Maps_KESA;
        end
        
    otherwise
        
end
















