%����������ѧϵ����������,��N���ӳ���,��Ϊ2/3.�������ƽ�沨����ʵ��������������.
%   ��������λ˵����:��(s).��ѹ��λΪ��(Pa).������(Hz).����(m)
%   ͨ��FFT֮��,����ʵ�����鲿����,����������ʹ��.
%   ������Ҫ��д

%   ����д��2020��2��15��

%   �����Ƽ���ѧ��˹Դ

function [p_plus,p_minus] = planewave(pressure_1,pressure_2,frequency,phase)
%% �������ϵ�� %% 
    w = 2*pi*frequency;                             %�����Ƶ��w
    c = 340;                                        %��������340m/s
    k = w/c;                                        %����ϵ��k,���ڹ���������,�������������
    mic_distance = '';                              %������˷���
%% ��ʼ����  %%
    botm = exp(phase*k*mic_distance)-exp(-phase*k*mic_distance) ;
    p_plus = (pressure_1*exp(phase*k*mic_distance)-pressure_2)/botm;        %������������
    p_minus = (pressure_2-pressure_1*exp(-phase*k*mic_distance))/botm ;     %���巴������
