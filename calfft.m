function [f,fft_Amp] = calfft(fs,sample)
% Basic Knowledge 
%% Time Domain  %%
% Sampling Rate (samples/sec)  Fs= 1 / delta t; 
% Frame Size (second) T = N*delta t ;
% Block Size N -- the data that you collects,usually it's a lot of data.
%% Frequency Domain %%
% Fmax = Fs/2 ; which is determined by the delta T;
% Frequency Resolution delta f = Fmax /SL;
% Spectral lines SL = N/2;


%%  Demo Code  %%
% f0 = 40 ; %frequency of the sine wave
% fs = 1000 ;  
% T = 1 /fs ;
% t = 0:T:1-T; %sampling period
% y = 4*sin(2*pi*f0*t)+10*sin(2*pi*80*t);     %the sine curve
% L = length(y) ;
%%  Begin  %%
sample = sample - mean(sample);
L = length(sample);
f = fs * (0:1:(L/2))/L ;
f = f';
Y = sample(1:L) ;
S = fft(Y) ;
P2 = abs(S)/(L/2) ;
P1 = P2(1:L/2+1) ;
fft_Amp = abs(P1) ;
%%  End  %%
