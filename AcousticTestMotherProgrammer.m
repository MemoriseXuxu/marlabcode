%����������ѧϵ����������ĸ����,��1��ĸ����,3���ӳ���.
%   ���ŵ�λ˵��:��(s).��ѹ��λΪ��(Pa).������(Hz).
%   
%   

%   ����д��2020��2��16��

%   �����Ƽ���ѧ��˹Դ

%% �����ⲿ����
    time = '' ; 
    P1data = '';
    P2data = '';
    P3data = '';
    P4data = '';
    P5data = '';
    P6data = '';

%%  ���屣���ļ���     %%
    P1name = 'P1��ֵ';
    P2name = 'P2��ֵ';
    P3name = 'P3��ֵ';
    P4name = 'P4��ֵ';
    P5name = 'P5��ֵ';
    P6name = 'P6��ֵ';
%%  �����������ϵ��  %%
    fs = 1000:                                                  %���������

%%  ʱ����ѹתƵ����ѹ  %%
    [frequency,P1,P1imag] =t2f(time,fs,P1data,P1name);      %A�鴫����
    [frequency,P2,P2imag] =t2f(time,fs,P2data,P2name);

    [frequency,P3,P3imag] =t2f(time,fs,P3data,P3name);      %B�鴫����
    [frequency,P4,P4imag] =t2f(time,fs,P4data,P4name);

    [frequency,P5,P5imag] =t2f(time,fs,P5data,P5name);      %C�鴫����
    [frequency,P6,P6imag] =t2f(time,fs,P6data,P6name);
    
%%  ����Ƶ����ѹ��������  %%
    [P1_plus,P1_minus] = planewave(P1,P2,frequency,P1imag); %�Դ�����1��λΪ������λ
    [P3_plus,P4_minus] = planewave(P3,P4,frequency,P3imag); %�Դ�����3��λΪ������λ
    [P5_plus,P6_minus] = planewave(P5,P6,frequency,P5imag); %�Դ�����5��λΪ������λ

%%  ���㷴��ϵ����͸��ϵ��
