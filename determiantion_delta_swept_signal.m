% �����������ж�����ɨƵ��Ƶ�ʼ��
Fs = 48000 ;    %Sample rate/Hz
f0 = 20 ;       %The start of Frequency/Hz
f1 = 500 ;      %The end of Frequency/Hz
T = 10 ;        %the period of swept-cos signal/s
delta_F = (f1 - f0) / ( T * Fs)  ;
display(delta_F);