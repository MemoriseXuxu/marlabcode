%%计算自相关函数
function [x,y] = findcorr(data,name)

data_length = length(data);
data_demean =  data - mean(data) ;%减掉均值
[c,lags] = xcorr(data_demean) ;
d = c ./ c(data_length) ;%归一化
x = lags(data_length:end);
y = d(data_length:end);
figure(1);
plot(x,y) ;%取中点n为起始的后面n个序列
title(name) ;
