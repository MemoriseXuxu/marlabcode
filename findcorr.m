%%��������غ���
function [x,y] = findcorr(data,name)

data_length = length(data);
data_demean =  data - mean(data) ;%������ֵ
[c,lags] = xcorr(data_demean) ;
d = c ./ c(data_length) ;%��һ��
x = lags(data_length:end);
y = d(data_length:end);
figure(1);
plot(x,y) ;%ȡ�е�nΪ��ʼ�ĺ���n������
title(name) ;
