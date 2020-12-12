
Fs = 1000;                    % Sampling frequency ����Ƶ��
T = 1/Fs;                     % Sample time �������
L = 10000;                     % Length of signal ��������
t = (0:L-1)*T;                % Time vector ����ʱ������

y = 0.7*sin(2*pi*20.6*t) + sin(2*pi*121.7*t);  % ��ֵΪ0.7��Ƶ��Ϊ20.6Hz������ + ��ֵΪ1��Ƶ��Ϊ121.7Hz������
figure(1)
plot(t,y)
title('Original Signal')
xlabel('time')
ylabel('Amplitude')

N=1300;     % N��FFT
wn=hann(N);      % N�㺺����
yn=y(1:N).*wn';    % �Ӻ�����
% yn=y(1:N);    % �Ӻ�����
yn_fft=fft(yn,N);
f=([1:N]-1)*Fs/N;
yn_fft=abs(yn_fft)/(N);   % ��Ƶ���ԣ����ҷ�ֵ��ת��Ϊ��ʱ���ֵ��ȵ����
figure(2)
plot(f,yn_fft)   
xlabel('Frequency (Hz)')
ylabel('Amplitude')