clear; close all;

freq_sample = 10*1e6;    % --- Hz
T_duration  = 0.2*1e-3;  % --- s
Np          = T_duration*freq_sample;
f           = 1e6;       % --- Hz

Ts = linspace(0,T_duration,Np);
fs = linspace(0,freq_sample/2,Np/2);

Sig = sin( 2*pi*f*Ts );
figure; plot(Ts,Sig); title('Signal over Time');


%% iFFT On Positive Frequence
fSig = fftshift( fft(Sig) );
figure; plot( fs,abs( fSig(Np/2+1:end) ) ); title('Signal Spectrum');
fSigP               = fSig;
fSigP(1:(end/2))    = [];
SigC               = ifft( fSigP ); % in complex
figure; plot( abs(SigC) ); title('By Removing Negative Frequency');
figure; plot( angle(SigC) ); title('By Removing Negative Frequency');

%% Short-Time Fourier Analysis
%{
SigSpec = spectrogram(Sig,200,100,2048);
figure; imagesc( abs(SigSpec(2:end,:)) ); colormap('Gray');
figure; plot( abs( SigSpec(:,1) ) );
%}

%% Hilbert Transform

HbSig   = hilbert(Sig);
instPh  = unwrap( angle(HbSig) );
dPh     = diff(instPh);
figure; plot( Ts,unwrap( atan2(imag(HbSig),real(HbSig)) ) ); title('By Hilbert Transfrom');
figure; plot( diff( unwrap( atan2(imag(HbSig),real(HbSig))) ) );
axis([-inf inf 0 pi]);

%% Hilbert-Huang Transform
[imf_sig,residual_sig]  = emd(Sig);
hs_sig  = hht(imf_sig,freq_sample);
