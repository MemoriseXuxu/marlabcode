%本程序是声学系数测量试验,共N个子程序,该为1/3.程序利用FFT实现声压的时域到频域的计算.
%   时间单位为秒（s）,声压单位为帕（Pa）.通过FFT之后,保留实部和虚部数据,
%   供后续计算使用.
%   传入三个参数,分别为时间/采样率/时域声压大小/保存名字.计算完成后输出频率/声压幅值/复声压虚部

%   程序写于2020年2月14日

%   西安科技大学徐斯源

function [frequency,freqAmp,freqImag] =  t2f(time,fs,timep,freqname)
tic                                      %统计程序运行时间
%%  检测数据长度是否相等,不然无法进行FFT计算	%%
    testA = time(~isnan(time));              %去除空值
    testB = timep(~isnan(timep));            %去除空值

    testA = length(testA);                   %数据长度
    testB = length(testB);                   %数据长度

if testA == testB
    disp('数量一致,可以进行FFT计算')
else
    disp('数量不一致,不能进行FFT变化,请检查')
    pause
end

%%	进行FFT计算	%%
    timep = timep - mean(timep) ;           %去直流,降低底噪
    tlength = length(time);                 %取时间长度为数据长度
    frep = fft(timep);                      %进行FFT计算
% 因为FFT计算后为双边谱,两侧对称,所以只需要取一半即可,频率和声压都需要截取
    x_frequency =  0:fs/(tlength-1):fs ;    %定义正负双向x坐标
    frequency = x_frequency(1:length(x_frequency)/2) ; %d定义单侧频率坐标
    frequency = frequency';                 %转置频率坐标
    frep = frep(1:length(x_frequency)/2);   %取单侧声压大小
    freqAmp = abs(frep);                    %取频域下压力的实部
freqImag = imag(frep);                  %取频域下压力的虚部

%%  将结果写入Excel表格中  %%
    xlswrite(freqname,frequency,'1','A2') ; %将频率写入A2单元格
    xlswrite(freqname,freqAmp,'1','B2') ;   %将声压幅值写入B2单元格

toc                                     %程序运行结束,显示计算时间
