cc
clear ;
work_dir = pwd ;
split = strsplit(work_dir,'\') ;
save_name = char(split(1,6))
tmp1 = importdata('089655_1.wav');
channel1 = tmp1.data  ;
tmp2 = importdata('089655_2.wav');
channel2 = tmp2.data;
tmp3 = importdata('089655_3.wav');
channel3 = tmp3.data ;
tmp4 = importdata('089655_4.wav');
channel4 = tmp4.data ;
tmp5 = importdata('089655_5.wav');
channel5 = tmp5.data ;
tmp6 = importdata('089655_6.wav');
channel6 = tmp6.data ;
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 split

% Specify the name of File.
save(save_name);  

delete('089655_7.wav');
delete('089655_8.wav');
% 
% f1 = 2910
% f2 = 2912
% f_rate = f1 /f2 ;
% double_frequency
% calculationTL
% pai_frequency_plot