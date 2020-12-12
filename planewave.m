%本程序是声学系数测量试验,共N个子程序,该为2/3.程序根据平面波理论实现正反方向声波.
%   物理量单位说话明:秒(s).声压单位为帕(Pa).采样率(Hz).长度(m)
%   通过FFT之后,保留实部和虚部数据,供后续计算使用.
%   这里需要填写

%   程序写于2020年2月15日

%   西安科技大学徐斯源

function [p_plus,p_minus] = planewave(pressure_1,pressure_2,frequency,phase)
%% 定义基础系数 %% 
    w = 2*pi*frequency;                             %定义角频率w
    c = 340;                                        %定义声速340m/s
    k = w/c;                                        %定义系数k,由于管内无流动,故无马赫数修正
    mic_distance = '';                              %定义麦克风间距
%% 开始计算  %%
    botm = exp(phase*k*mic_distance)-exp(-phase*k*mic_distance) ;
    p_plus = (pressure_1*exp(phase*k*mic_distance)-pressure_2)/botm;        %定义正向声波
    p_minus = (pressure_2-pressure_1*exp(-phase*k*mic_distance))/botm ;     %定义反向声波
