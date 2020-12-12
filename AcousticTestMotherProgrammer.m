%本程序是声学系数测量试验母程序,共1个母程序,3个子程序.
%   符号单位说明:秒(s).声压单位为帕(Pa).采样率(Hz).
%   
%   

%   程序写于2020年2月16日

%   西安科技大学徐斯源

%% 定义外部数据
    time = '' ; 
    P1data = '';
    P2data = '';
    P3data = '';
    P4data = '';
    P5data = '';
    P6data = '';

%%  定义保存文件名     %%
    P1name = 'P1幅值';
    P2name = 'P2幅值';
    P3name = 'P3幅值';
    P4name = 'P4幅值';
    P5name = 'P5幅值';
    P6name = 'P6幅值';
%%  定义基础计算系数  %%
    fs = 1000:                                                  %定义采样率

%%  时域声压转频域声压  %%
    [frequency,P1,P1imag] =t2f(time,fs,P1data,P1name);      %A组传声器
    [frequency,P2,P2imag] =t2f(time,fs,P2data,P2name);

    [frequency,P3,P3imag] =t2f(time,fs,P3data,P3name);      %B组传声器
    [frequency,P4,P4imag] =t2f(time,fs,P4data,P4name);

    [frequency,P5,P5imag] =t2f(time,fs,P5data,P5name);      %C组传声器
    [frequency,P6,P6imag] =t2f(time,fs,P6data,P6name);
    
%%  分离频域声压的正负方  %%
    [P1_plus,P1_minus] = planewave(P1,P2,frequency,P1imag); %以传声器1相位为基础相位
    [P3_plus,P4_minus] = planewave(P3,P4,frequency,P3imag); %以传声器3相位为基础相位
    [P5_plus,P6_minus] = planewave(P5,P6,frequency,P5imag); %以传声器5相位为基础相位

%%  计算反射系数和透射系数
