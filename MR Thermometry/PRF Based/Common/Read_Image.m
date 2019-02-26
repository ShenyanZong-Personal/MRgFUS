function [ imgs_cplx,Headers ] = Read_Image( )
% Read_Image Dialog to choose image data
%   Data Type: 5-D Matrix; [row column slice coil phase]
%   row: Row Number of Image
%   column: Column Number of Image
%   slice: Number of Scanned Object
%   coil: Number of RF Receive Coil
%   phase: Number of Scanned Time Frame


[filename,pathname] = uigetfile({'*.mat','MAT';...
    'I.*','DICOM';'*.MRDC.*','DICOM';'*.dcm','DICOM'});

if filename == 0
    fprintf('>> No Image Available...\n');
    imgs_cplx = 0;
    Headers   = 0;
else
    bkp = strfind(filename,'.');
    if numel(bkp) == 1
        file_pre = filename(1 : bkp-1);
        file_suf = filename(bkp+1 : end);
        file_med = 'None';
    elseif numel( bkp) == 2
        file_pre = 'None';
        file_suf = 'None';
        file_med = filename(bkp(1)+1 : bkp(2)-1);
    end
    
    if strcmp(file_suf,'mat')
        DSet = open([pathname filename]);
        
        if strcmp(filename,'forPeixin.mat')
            
            imgs_cplx = DSet.data1;
            
        elseif strcmp(filename,'ForSY_ESpatient.mat')
            imgs_cplx = DSet.data;

        elseif strcmp(filename,'result.mat')
            DSets       = load('result.mat');
            imgs_cplx   = DSets.fisp;
            Headers     = Header_ReWrite_result(DSets.psd_info);
            
        elseif strcmp(filename,'autoshim.mat')
            BW_DSets    = load('BW.mat');
            BW          = BW_DSets.BW;
            
            BW_Index    = 1;
            DSets       = load('autoshim.mat');
            
            if BW_Index == 1
                imgs_cplx   = DSets.result1;
                Headers     = Header_ReWrite_AutoShim( BW(BW_Index) );
            elseif BW_Index == 2
                imgs_cplx   = DSets.result2;
                Headers     = Header_ReWrite_AutoShim( BW(BW_Index) );
            elseif BW_Index == 3
                imgs_cplx   = DSets.result3;
                Headers     = Header_ReWrite_AutoShim( BW(BW_Index) );
            elseif BW_Index == 4
                imgs_cplx   = DSets.result4;
                Headers     = Header_ReWrite_AutoShim( BW(BW_Index) );
            end
           
        elseif strcmp(filename,'badshim.mat')
            BW_DSets    = load('BW.mat');
            BW          = BW_DSets.BW;
            
            BW_Index    = 1;
            DSets       = load('badshim.mat');
            
            if BW_Index == 1
                imgs_cplx   = DSets.result1_bad;
                Headers     = Header_ReWrite_BadShim( BW(BW_Index) );
            elseif BW_Index == 2
                imgs_cplx   = DSets.result2_bad;
                Headers     = Header_ReWrite_BadShim( BW(BW_Index) );
            elseif BW_Index == 3
                imgs_cplx   = DSets.result3_bad;
                Headers     = Header_ReWrite_BadShim( BW(BW_Index) );
            elseif BW_Index == 4
                imgs_cplx   = DSets.result4_bad;
                Headers     = Header_ReWrite_BadShim( BW(BW_Index) );
            end
            
        elseif strcmp(filename,'ForShenyan.mat')
            
            BW      = [5.81 8.33 15.63 50 125];
            DSets   = load('ForShenyan.mat');
            
            BW_Index    = 5;
            Shim_Status = 'Good';
            
            if (BW_Index == 1) && strcmp(Shim_Status,'Good')
                
                imgs_cplx   = DSets.data1;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr1 );
                
            elseif (BW_Index == 2) && strcmp(Shim_Status,'Good')
                
                imgs_cplx   = DSets.data2;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr2 );
                
            elseif (BW_Index == 3) && strcmp(Shim_Status,'Good')
                
                imgs_cplx   = DSets.data3;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr3 );
                
            elseif (BW_Index == 4) && strcmp(Shim_Status,'Good')
                
                imgs_cplx   = DSets.data4;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr4 );
                
            elseif (BW_Index == 5) && strcmp(Shim_Status,'Good')
                imgs_cplx   = DSets.data5;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr5 );
                
            elseif (BW_Index == 1) && strcmp(Shim_Status,'Bad')
                imgs_cplx   = DSets.data1_bad;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr1_bad);
                
            elseif (BW_Index == 2) && strcmp(Shim_Status,'Bad')
                imgs_cplx   = DSets.data2_bad;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr2_bad);
                
            elseif (BW_Index == 3) && strcmp(Shim_Status,'Bad')
                imgs_cplx   = DSets.data3_bad;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr3_bad);
            
            elseif (BW_Index == 4) && strcmp(Shim_Status,'Bad')
                imgs_cplx   = DSets.data4_bad;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr4_bad);
            elseif (BW_Index == 5) && strcmp(Shim_Status,'Bad')
                imgs_cplx   = DSets.data5_bad;
                Headers     = Header_ReWrite_Mei( BW_Index,BW(BW_Index),Shim_Status,DSets.hdr5_bad);
            end
        end
        
    elseif strcmp(file_pre,'I')

        
    elseif strcmp(file_med,'MRDC')
        ncoils              = 8;
        files               = dir(pathname);
        nfiles              = numel(files)-2;
        ntfrs               = nfiles/((ncoils+1)*3);
        [row,col,nslices]   = size(dicomread([pathname filename]));
        
        imgs_cplx = zeros(row,col,nslices,ncoils,ntfrs);
        for itemporalphase = 1:ntfrs
            for icoil = 1:ncoils
                for islice = 1:nslices
                    Nrank = (itemporalphase-1)*((ncoils+1)*3) + (icoil-1)*3;
                    real = dicomread([pathname files(Nrank+2 +2).name]);
                    imag = dicomread([pathname files(Nrank+3 +2).name]);
                
                    imgs_cplx(:,:,islice,icoil,itemporalphase) = double(complex(real,imag));
                end
            end
        end
        
    elseif strcmp(file_suf,'dcm')
        
        Infos   =   dicominfo([pathname filename]);
        Headers =   Header_ReWrite(Infos);
        %Headers.PhaseEncodingDirection = 'COL';
             
        Nrow            =   Headers.Row;
        Ncol            =   Headers.Column;
        Nslice          =   Headers.NumberOfSlice;
        Ncoil           =   Headers.NumberOfCoil;
        Ntemporalphase  =   Headers.TemporalPhase;
        
        files       = dir(pathname);
        imgs_cplx   = zeros(Nrow,Ncol,Nslice,Ncoil,Ntemporalphase);
        
        for islice = 1:Nslice
            for itemporalphase = 1:Ntemporalphase
                for icoil = 1:Ncoil
                    
                    Nrank = (islice-1)*Ntemporalphase*(Ncoil+1)*3+(itemporalphase-1)*((Ncoil+1)*3) + (icoil-1)*3;
                    
                    real = dicomread([pathname files(Nrank+2 +2).name]);
                    imag = dicomread([pathname files(Nrank+3 +2).name]);
                
                    imgs_cplx(:,:,islice,icoil,itemporalphase) = double(complex(real,imag));
                end
            end
        end      
    end
    
%   fprintf('>> Loading Images.../Done..\n');
    
end

end


% ------ Notices ------ %
% PhaseEncodingDirection: 'ROW' --- Horizontal; 'COL' --- Vertical %

function [ Headers ] = Header_ReWrite(Infos)

    Headers.InstitutionName         =   Infos.InstitutionName;
    Headers.B0                      =   Infos.MagneticFieldStrength;        % Unit: T
    Headers.TR                      =   Infos.RepetitionTime;               % Unit: ms
    Headers.TE                      =   Infos.EchoTime;                     % Unit: ms
    Headers.Gama                    =   42.576;
    Headers.SliceThickness          =   Infos.SliceThickness;               % Unit: mm
    Headers.Spacing                 =   Infos.SpacingBetweenSlices;         % Unit: mm
    Headers.Row                     =   Infos.Rows;
    Headers.Column                  =   Infos.Columns;
    Headers.FlipAngle               =   Infos.FlipAngle;
    Headers.PatientPosition         =   Infos.PatientPosition;
    Headers.FOV                     =   Infos.ReconstructionDiameter;       % Unit: mm
    Headers.AcquisitionMatrix       =   Infos.AcquisitionMatrix;
    Headers.PixelBW                 =   Infos.PixelBandwidth;
    Headers.FrequencySampling       =   Infos.PercentSampling;
    Headers.PhaseSampling           =   Infos.PercentPhaseFieldOfView;
    Headers.TemporalPhase           =   Infos.NumberOfTemporalPositions;
    Headers.ImagesAcquisition       =   Infos.ImagesInAcquisition;
    Headers.NumberOfSlice           =   Infos.Private_0021_104f;
    Headers.CoilName                =   Infos.ReceiveCoilName;
    Headers.NumberOfCoil            =   Headers.ImagesAcquisition./Headers.NumberOfSlice./Headers.TemporalPhase./3 - 1;
    Headers.PhaseEncodingDirection  =   Infos.InPlanePhaseEncodingDirection;
    Headers.SoftwareVersion         =   Infos.SoftwareVersion;

end

function [ Headers ] = Header_ReWrite_result(psd_info)

    Headers.InstitutionName         =   'BWH Data from Mei';
    Headers.B0                      =   3;
    Headers.TR                      =   psd_info.act_tr/1000;
    Headers.TE                      =   psd_info.te_fisp/1000;
    Headers.Gama                    =   42.576;
    Headers.SliceThickness          =   psd_info.opslthick;
    Headers.Spacing                 =   0;
    Headers.Row                     =   psd_info.opyres;
    Headers.Column                  =   psd_info.opxres;
    Headers.FlipAngle               =   psd_info.opflip;
    Headers.PatientPosition         =   'unknown';
    Headers.FOV                     =   psd_info.opfov/10;
    Headers.AcquisitionMatrix       =   'unknown';
    Headers.PixelBW                 =   psd_info.bw;
    Headers.FrequencySampling       =   'unknown';
    Headers.PhaseSampling           =   'unknown';
    Headers.TemporalPhase           =   psd_info.opfphases - psd_info.NumOfRefScans;
    Headers.ImagesAcquisition       =   'unknown';
    Headers.NumberOfSlice           =   psd_info.Nsl;
    Headers.CoilName                =   'unknown';
    Headers.NumberOfCoil            =   psd_info.numrecv;
    Headers.PhaseEncodingDirection  =   'ROW';
    Headers.SoftwareVersion         =   'unknown';

end

function [ Headers ] = Header_ReWrite_AutoShim( BW_Current )

    Headers.InstitutionName         =   'BWH Data';
    Headers.B0                      =   3;
    Headers.TR                      =   'unknown';
    Headers.TE                      =   10;
    Headers.Gama                    =   42.576;
    Headers.SliceThickness          =   'unknown';
    Headers.Spacing                 =   'unknown';
    Headers.Row                     =   128;
    Headers.Column                  =   128;
    Headers.FlipAngle               =   'unknown';
    Headers.PatientPosition         =   'unknown';
    Headers.FOV                     =   'unknown';
    Headers.AcquisitionMatrix       =   'unknown';
    Headers.PixelBW                 =   (BW_Current*10^3)/128;
    Headers.FrequencySampling       =   128;
    Headers.PhaseSampling           =   128;
    Headers.TemporalPhase           =   40;
    Headers.ImagesAcquisition       =   'unknown';
    Headers.NumberOfSlice           =   1;
    Headers.CoilName                =   'unknown';
    Headers.NumberOfCoil            =   8;
    Headers.PhaseEncodingDirection  =   'ROW';
    Headers.SoftwareVersion         =   'unknown';

end


function [ Headers ] = Header_ReWrite_BadShim( BW_Current )

    Headers.InstitutionName         =   'BWH Data';
    Headers.B0                      =   3;
    Headers.TR                      =   'unknown';
    Headers.TE                      =   10;
    Headers.Gama                    =   42.576;
    Headers.SliceThickness          =   'unknown';
    Headers.Spacing                 =   'unknown';
    Headers.Row                     =   128;
    Headers.Column                  =   128;
    Headers.FlipAngle               =   'unknown';
    Headers.PatientPosition         =   'unknown';
    Headers.FOV                     =   'unknown';
    Headers.AcquisitionMatrix       =   'unknown';
    Headers.PixelBW                 =   (BW_Current*10^3)/128;
    Headers.FrequencySampling       =   128;
    Headers.PhaseSampling           =   128;
    Headers.TemporalPhase           =   40;
    Headers.ImagesAcquisition       =   'unknown';
    Headers.NumberOfSlice           =   1;
    Headers.CoilName                =   'unknown';
    Headers.NumberOfCoil            =   8;
    Headers.PhaseEncodingDirection  =   'ROW';
    Headers.SoftwareVersion         =   'unknown';

end

function [ Headers ] = Header_ReWrite_Mei( BW_Index,BW_Value,Shim_Status,hdr )

    Headers.InstitutionName         =   'Good and Bad Shim Data';
    Headers.B0                      =   hdr.B0;
    Headers.TR                      =   hdr.TR/1000;
    Headers.TE                      =   hdr.TE/1000;
    Headers.Gama                    =   42.576;
    Headers.SliceThickness          =   hdr.slthick*10;
    Headers.Spacing                 =   hdr.scanspacing;
    Headers.Row                     =   hdr.N_ver;
    Headers.Column                  =   hdr.N_hor;
    Headers.FlipAngle               =   'unknown';
    Headers.PatientPosition         =   'unknown';
    Headers.FOV                     =   'unknown';
    Headers.AcquisitionMatrix       =   'unknown';
    Headers.PixelBW                 =   (2*BW_Value*1000)/128;
    Headers.FrequencySampling       =   128;
    Headers.PhaseSampling           =   128;
    Headers.TemporalPhase           =   hdr.nph;
    Headers.ImagesAcquisition       =   'unknown';
    Headers.NumberOfSlice           =   hdr.N_sl;
    Headers.CoilName                =   'unknown';
    Headers.NumberOfCoil            =   hdr.ncoils;
    Headers.PhaseEncodingDirection  =   'COL';
    Headers.SoftwareVersion         =   'unknown';
    Headers.Others                  =   ['BW' num2str(BW_Index) ':' ' ' num2str(BW_Value) ' ; ' Shim_Status ' ' 'Shim'];

end