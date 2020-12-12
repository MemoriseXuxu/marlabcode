function [frequency,result]= cpsd_xu (Fs,data_A,data_B,p)
% Calculate the PSD result using CPSD function
% 
% [frequency , cpsd_result] = cpsd_xu (fs, data_A,data_B , 'p')
%
% Description:
% 
%
% inputs:
%   (1) data_A data_B : the files that needs to be analysised
%   (2) Fs : sample frequency ,like 1000Hz,65536Hz
%   (3) 'p': this is an optional choice.When it is set to 'p', graph is
%   showned in frequency domain
%
% outputs:
%   (1) frequency: the result is in frequency domain form
%   (2) cpsd_result : the amplitude of cross power spectrum density
%   (3) 'p' : the graph is optional

if nargin < 3
    error('输入数据不够')
elseif nargin == 3
    data_A = data_A - mean(data_A);
    data_B = data_B - mean(data_B);  
    disp('不输出结果图像，开始运行计算');     
    [result,frequency] = cpsd(data_A,data_B,[],[],[],Fs) ;
elseif nargin ==4 
    data_A = data_A - mean(data_A);
    data_B = data_B - mean(data_B);  
    disp('显示结果图像，开始运行计算');
    [result,frequency] = cpsd(data_A,data_B,[],[],[],Fs) ;
    plot(frequency,result);
elseif nargin >5 
    error('输入这么都参数干嘛，我都懵了')
end
