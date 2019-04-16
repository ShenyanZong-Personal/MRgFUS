clear; close all;

freq_sample = 10*1e6;    % --- Hz
T_duration  = 0.2*1e-3;  % --- s
Np          = T_duration*freq_sample;
f           = 1e6;       % --- Hz

Ts = linspace(0,T_duration,Np);
fs = linspace(0,freq_sample/2,Np/2);

Sig = sin( 2*pi*f*Ts );

figure; plot(Ts,Sig);

fSig = fftshift( fft(Sig) );

figure; plot( fs,abs( fSig(Np/2+1:end) ) );


SigSpec = spectrogram(Sig,200,100,2048);
figure; imagesc( abs(SigSpec(2:end,:)) ); colormap('Gray');
figure; plot( abs( SigSpec(:,1) ) );

