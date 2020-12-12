%����������ѧϵ����������,��N���ӳ���,��Ϊ1/3.��������FFTʵ����ѹ��ʱ��Ƶ��ļ���.
%   ʱ�䵥λΪ�루s��,��ѹ��λΪ����Pa��.ͨ��FFT֮��,����ʵ�����鲿����,
%   ����������ʹ��.
%   ������������,�ֱ�Ϊʱ��/������/ʱ����ѹ��С/��������.������ɺ����Ƶ��/��ѹ��ֵ/����ѹ�鲿

%   ����д��2020��2��14��

%   �����Ƽ���ѧ��˹Դ

function [frequency,freqAmp,freqImag] =  t2f(time,fs,timep,freqname)
tic                                      %ͳ�Ƴ�������ʱ��
%%  ������ݳ����Ƿ����,��Ȼ�޷�����FFT����	%%
    testA = time(~isnan(time));              %ȥ����ֵ
    testB = timep(~isnan(timep));            %ȥ����ֵ

    testA = length(testA);                   %���ݳ���
    testB = length(testB);                   %���ݳ���

if testA == testB
    disp('����һ��,���Խ���FFT����')
else
    disp('������һ��,���ܽ���FFT�仯,����')
    pause
end

%%	����FFT����	%%
    timep = timep - mean(timep) ;           %ȥֱ��,���͵���
    tlength = length(time);                 %ȡʱ�䳤��Ϊ���ݳ���
    frep = fft(timep);                      %����FFT����
% ��ΪFFT�����Ϊ˫����,����Գ�,����ֻ��Ҫȡһ�뼴��,Ƶ�ʺ���ѹ����Ҫ��ȡ
    x_frequency =  0:fs/(tlength-1):fs ;    %��������˫��x����
    frequency = x_frequency(1:length(x_frequency)/2) ; %d���嵥��Ƶ������
    frequency = frequency';                 %ת��Ƶ������
    frep = frep(1:length(x_frequency)/2);   %ȡ������ѹ��С
    freqAmp = abs(frep);                    %ȡƵ����ѹ����ʵ��
freqImag = imag(frep);                  %ȡƵ����ѹ�����鲿

%%  �����д��Excel�����  %%
    xlswrite(freqname,frequency,'1','A2') ; %��Ƶ��д��A2��Ԫ��
    xlswrite(freqname,freqAmp,'1','B2') ;   %����ѹ��ֵд��B2��Ԫ��

toc                                     %�������н���,��ʾ����ʱ��
