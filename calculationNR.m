% Mic就是Channel 不用改变，只需要改变最后NR计算公式就可以了，切记！！！还有起始频率和终止频率
fs = 48000 ;
start_number = round(48000 * 0.8);
end_number = start_number + round(1* 65 * 48000)  ;

mic_1_time = channel1(start_number:end_number);
mic_2_time = channel2(start_number:end_number);
mic_3_time = channel3(start_number:end_number);
mic_4_time = channel4(start_number:end_number);
mic_5_time = channel5(start_number:end_number);
mic_6_time = channel6(start_number:end_number);

mic_1_time = mic_1_time - mean(mic_1_time);
mic_2_time = mic_2_time - mean(mic_2_time);
mic_3_time = mic_3_time - mean(mic_3_time);
mic_4_time = mic_4_time - mean(mic_4_time);
mic_5_time = mic_5_time - mean(mic_5_time);
mic_6_time = mic_6_time - mean(mic_6_time);

delta_f = 24000/(length(mic_1_time)/2) ;
f_begin =round( 4000 / delta_f)+1 ;
f_end =  round( 4500 / delta_f)+1 ;

[f,mic1] = calfft(fs,mic_1_time) ;
[f,mic2] = calfft(fs,mic_2_time) ;
[f,mic3] = calfft(fs,mic_3_time) ;
[f,mic4] = calfft(fs,mic_4_time) ;
[f,mic5] = calfft(fs,mic_5_time) ;
[f,mic6] = calfft(fs,mic_6_time) ;

f = f(f_begin:f_end) ;
mic1 = mic1(f_begin:f_end);
mic2 = mic2(f_begin:f_end);
mic3 = mic3(f_begin:f_end);
mic4 = mic4(f_begin:f_end);
mic5 = mic5(f_begin:f_end);
mic6 = mic6(f_begin:f_end);
save('frf','mic1','mic2','mic3','mic4','mic5','mic6','f')
NR14 = 20*log10(abs( mic3 ./ mic2)) ;    % C to A
NR16 = 20*log10(abs( mic3 ./ mic6)) ;    % C to B   


%% 用于平滑NR

% 
% a2 = movmean(Sheet1_C,5000);
% a4 = movmean(Sheet1_E,5000);
% a5 = movmean(Sheet1_F,5000);
% 
% 
% % plot(Sheet1_A,a3);hold on;
% % plot(Sheet1_A,a6);hold off;
% 
% NR14 = 20*log10(abs( a5 ./ a2)) ;    % B to A 
% NR16 = 20*log10(abs( a5 ./ a4)) ;    % B to C 
% 
% figure(2)
% plot(Sheet1_A,NR14);hold on;
% plot(Sheet1_A,NR16);hold off;
% % xlim([50 500])
