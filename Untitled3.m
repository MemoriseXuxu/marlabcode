% 基于平面波假设声传播计算声学系数，包括反射系数??????射系数和吸声系??
%   利用双传声器法分离正方向声波，求得声学相关系数???
%   使用方法??
%   1>定义传声器间距mm  采样频率Hz  声???m/s  密度kg/m3 管道面积m2
%   2>选择合???的管道面积用于计算声强大小
%   3>获得结果
%
%   Xuxu Compiled

%  READ DATA FROM EXTERNAL FILES!!!
%   mic_1 = readmatrix(workbook);
%   mic_2 = readmatrix(workbook);
%   mic_3 = readmatrix(workbook);
%   mic_4 = readmatrix(workbook);


  start_number = 150000;
%   s_time = start_number/48000;
  end_number = start_number + 3.6 * 48000 + 1  ;
%   end_time = end_number / 48000 ;
  mic_1_time = channel3(start_number:1:end_number);
  mic_2_time = channel4(start_number:end_number);
  mic_3_time = channel2(start_number:end_number);
  mic_4_time = channel1(start_number:end_number);
  mic_5_time = channel6(start_number:end_number);
  mic_6_time = channel5(start_number:end_number);

  mic_1_time = mic_1_time - mean(mic_1_time);
  mic_2_time = mic_2_time - mean(mic_2_time);
  mic_3_time = mic_3_time - mean(mic_3_time);
  mic_4_time = mic_4_time - mean(mic_4_time);
  mic_5_time = mic_5_time - mean(mic_5_time);
  mic_6_time = mic_6_time - mean(mic_6_time);
%  Define Basic parameters
% 28.985235                                              Space
for   i = 0:1:1000
  s = 30.15 / 1000
  fs = 48000 ;       %the sample frequency like 10000Hz,65536Hz
  c = 347.98 ;          %the speed of sound m/s
  density = 1.225 ;  %the density of Air in standard temperature
  area_a = 0.252;    %the pipe named 鍑哄彛绠?1
  area_b = 0.252;    %the pipe named 鍑哄彛绠?2
  area_c = 0.488;    %the pipe named 杩涘彛绠?
  
  L = length(mic_1_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_1_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_1 = P1  ;
  clear P1 P2 ;
  
    clear P1 P2 ;  
  L = length(mic_2_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_2_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_2 = P1  ;
  
  clear P1 P2 ;  
  L = length(mic_3_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_3_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_3 = P1  ;
  
  clear P1 P2 ;  
   L = length(mic_4_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_4_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_4 = P1 ;
  
  clear P1 P2 ;  
  L = length(mic_5_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_5_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_5 = P1 ;
  
  clear P1 P2 ;  
  L = length(mic_6_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_6_time(1:L) ;
  S = fft(Y,L)./L ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_6 = P1 ;
  clear P1 P2 ;  
    
%  Begin calculation  
  K_L = 500/1000 ;
  k = (2*pi*frequency/c)'   ; %the specific number k
  
  fenmu = exp(1j*k*s)-exp(-1j*k*s) ;
  P12_plus = (mic_1 .*exp(1j*k*s)- mic_2) ./ (fenmu) ;    %forward acoustic wave
  P12_minus = (mic_2 - mic_1 .*exp(-1j*k*s)) ./ (fenmu) ; %backward acoustic wave
  W12_plus = 0.5.*((abs(P12_plus)).^2).*area_a./(c*density);               %foeward wave power intensity
  W12_minus = 0.5.*((abs(P12_minus)).^2).*area_a./(c*density);             %backward wave power intensity
  r12 = abs( (W12_minus ./ W12_plus)) ;


  s_2 = (21.74875 +  i * 0.01) /1000 ;                                %mm
  display(i)
  display(s*1000)
  fenmu_2 = exp(1j*k*s_2)-exp(-1j*k*s_2) ;
  P34_plus = (mic_3 .*exp(1j*k*s_2)- mic_4) ./ (fenmu_2) ;    %forward acoustic wave
  P34_minus = (mic_4 - mic_3 .*exp(-1j*k*s_2)) ./ (fenmu_2) ;    %backward acoustic wave
  W34_plus = 0.5.*((abs(P34_plus)).^2).*area_a./(c*density);               %foeward wave power intensity
  W34_minus = 0.5.*((abs(P34_minus)).^2).*area_a./(c*density);             %backward wave power intensity
% r34 = abs(R34) ;    %the reflection coefficient in real form ---result_2
  t13 = abs( W34_plus ./ W12_plus)  ;
  t13(1) = 0 ;                                           %去掉0Hz时数据，为RMS计算铺垫
  root_mean(i+1,1)= s_2;
  root_mean(i+1,2) = rms(t13);
  
  s_3 = 21.74875 / 1000 ;
  fenmu_3 = exp(1j*k*s_3)-exp(-1j*k*s_3) ;
  P56_plus = (mic_5 .*exp(1j*k*s_3)- mic_6 ) ./ (fenmu_3) ;    %forward acoustic wave
  P56_minus = (mic_6 - mic_5 .*exp(-1j*k*s_3) ) ./ (fenmu_3) ;    %backward acoustic wave
  W56_plus = 0.5.*((abs(P56_plus)).^2).*area_a./(c*density);               %foeward wave power intensity
  W56_minus = 0.5.*((abs(P56_minus)).^2).*area_a./(c*density);             %backward wave power intensity
% r56 = abs(R56) ;    %the reflection coefficient in real form ---result_3
t15 = abs( W56_plus ./ W12_plus) ;
  plot(frequency,((r12))); 
  xlim([0 500]) ;
  ylim([0 1]) ;
%   print(num2str(i),'-dpng')
end


