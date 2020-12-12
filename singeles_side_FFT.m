%%%   单侧谱FFT计算程序   %%%
% 要求被分析的点数为偶�?!!!
%
%%%
close all
f0 = 40 ; %frequency of the sine wave
fs = 1000 ;  
T = 1 /fs ;
t = 0:T:1-T; %sampling period
y = 4*sin(2*pi*f0*t); %the sine curve
L = length(y) ;

% y = mic_1_time ;
% L = length(y) ;
% fs = 48000 ;

f = fs * (0:1:(L/2))/L ;
Y = y(1:L) ;
S = fft(Y) ;
P2 = (S)/(L) ;
P1 = P2(1:L/2+1) ;
P1(2:end-1) = 2 * P1(2:end-1) ;
P1 = (abs(P1)).^2 ;
plot(f,P1) ;
grid