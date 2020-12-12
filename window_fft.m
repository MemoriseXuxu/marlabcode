
Fs = 1000;                    % Sampling frequency 采样频率
T = 1/Fs;                     % Sample time 采样间隔
L = 10000;                     % Length of signal 采样点数
t = (0:L-1)*T;                % Time vector 采样时间序列

y = 0.7*sin(2*pi*20.6*t) + sin(2*pi*121.7*t);  % 幅值为0.7、频率为20.6Hz的正弦 + 幅值为1、频率为121.7Hz的正弦
figure(1)
plot(t,y)
title('Original Signal')
xlabel('time')
ylabel('Amplitude')

N=1300;     % N点FFT
wn=hann(N);      % N点汉宁窗
yn=y(1:N).*wn';    % 加汉宁窗
% yn=y(1:N);    % 加汉宁窗
yn_fft=fft(yn,N);
f=([1:N]-1)*Fs/N;
yn_fft=abs(yn_fft)/(N);   % 幅频特性，并且幅值已转化为与时域幅值相等的情况
figure(2)
plot(f,yn_fft)   
xlabel('Frequency (Hz)')
ylabel('Amplitude')