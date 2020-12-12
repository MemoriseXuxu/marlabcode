clear ;

v1 = 0.0044412 ;
v2 = 0.0045446 ;
v3 = 0.0050992 ;
v4 = 0.0047863 ;
v5 = 0.0047315 ;
v6 = 0.0043152 ;

tmp1 = importdata('089655_1.wav');
channel1 = tmp1.data ./v1 ;
tmp2 = importdata('089655_2.wav');
channel2 = tmp2.data ./v2;
tmp3 = importdata('089655_3.wav');
channel3 = tmp3.data ./v3 ;
tmp4 = importdata('089655_4.wav');
channel4 = tmp4.data ./v4;
tmp5 = importdata('089655_5.wav');
channel5 = tmp5.data ./v5;
tmp6 = importdata('089655_6.wav');
channel6 = tmp6.data ./v6;
clear tmp1 tmp2 tmp3 tmp4 tmp5 tmp6

% Specify the name of File.
% save_name = 's6_2';   %格式要求：日期-声源类型-频率范围-是否重复工况 
save_name = '0n_0902-扫频-20-550-A015-T10';   %格式要求：日期-声源类型-频率范围-是否重复工况 
% save_name = '12_0826-单频502100';   %格式要求：日期-声源类型-频率范围-是否重复工况 
save(save_name);  