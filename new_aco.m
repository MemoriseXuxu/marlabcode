%%  这个是新的计算程序，程序基于频域下幅值噪声进行声波分离。

% 基于平面波假设声传播计算声学系数，包括反射系数、透射系数和吸声系数
%   利用双传声器法分离正方向声波，求得声学相关系数。
%   使用方法：
%   1>定义传声器间距mm  采样频率Hz  声速m/s  密度kg/m3 管道面积m2
%   2>选择合适的管道面积用于计算声强大小
%   3>获得结果
%
%   Xuxu Compiled

%  READ DATA FROM EXTERNAL FILES!!!
  frequency = Frequency;
  fre = frequency ;
  mic_1 = P1 ;
  mic_2 = P2;
  mic_3 = P3;
  mic_4 = P4;
  mic_5 = P5;
  mic_6 = P6;

%  Define Basic parameters
  s =  20/1000 ;     %the distance between mic /mm
% fs = 48000 ;       %the sample frequency like 10000Hz,65536Hz
  c = 346 ;          %the speed of sound m/s
  density = 1.225 ;  %the density of Air in standard temperature
  area_a = 0.252;    %the pipe named 出口管A
  area_b = 0.252;    %the pipe named 出口管B
  area_c = 0.488;    %the pipe named 进口管C
  L = 1 ;
  
%  Begin calculation  
%  [frequency.G12] = cpsd_xu(fs,mic_1,mic_2) ;     %the cross PSD between mic1 and mic2
%  [frequency,G11] = cpsd_xu(fs,mic_1,mic_1) ;     %the self PSFD from mic1
  
  k = 2*pi.*frequency./c  ;   %the specific number k
  fenmu = exp(1j*k*s)-exp(-1j*k*s) ;
  P12_plus = (mic_1 .*exp(1j*k*s)- mic_2) ./ (fenmu) ;    %forward acoustic wave
  P12_minus = (mic_2 - mic_1 .*exp(-1j*k*s)) ./ (fenmu) ; %backward acoustic wave
  W12_plus = 0.5.*((abs(P12_plus)).^2).*area_c./(c*density);               %foeward wave power intensity
  W12_minus = 0.5.*((abs(P12_minus)).^2).*area_c./(c*density);             %backward wave power intensity
  r12 = abs( W12_minus ./ W12_plus)  ;    %the reflection coefficient in real form ---result_1
%  r12 = abs( P12_minus ./ P12_plus) ;    %the reflection coefficient in real form ---result_1

    
%   [frequency,G34] = cpsd_xu(fs,mic_3,mic_4) ;     %the cross PSD between mic3 and mic4
%   [frequency,G33] = cpsd_xu(fs,mic_3,mic_3) ;     %the self PSFD from mic3
  
  P34_plus = (mic_3 .*exp(1j*k*s)- mic_4) ./ (exp(1j*k*s)-exp(-1j*k*s)) ;    %forward acoustic wave
  P34_minus = (mic_4 - mic_3 .*exp(-1j*k*s)) ./ (exp(1j*k*s)-exp(-1j*k*s)) ;    %backward acoustic wave
  W34_plus = 0.5.*((abs(P34_plus)).^2).*area_a./(c*density);               %foeward wave power intensity
  W34_minus = 0.5.*((abs(P34_minus)).^2).*area_a./(c*density);             %backward wave power intensity
  r34 = abs( W34_minus ./ W34_plus) ;    %the reflection coefficient in real form ---result_2

%   [frequency,G56] = cpsd_xu(fs,mic_5,mic_6) ;     %the cross PSD between mic5 and mic6
%   [frequency,G55] = cpsd_xu(fs,mic_5,mic_5) ;     %the self PSFD from mic5  
  
  P56_plus = (mic_5 .*exp(1j*k*s)- mic_6 ) ./ (exp(1j*k*s)-exp(-1j*k*s)) ;    %forward acoustic wave
  P56_minus = (mic_6 - mic_5 .*exp(-1j*k*s) ) ./ (exp(1j*k*s)-exp(-1j*k*s)) ;    %backward acoustic wave
  W56_plus = 0.5.*((abs(P56_plus)).^2).*area_b./(c*density);               %foeward wave power intensity
  W56_minus = 0.5.*((abs(P56_minus)).^2).*area_b./(c*density);             %backward wave power intensity
  r56 = abs( W56_minus ./ W56_plus) ;    %the reflection coefficient in real form ---result_3
  
  t13 = abs( W34_plus ./ W12_plus) ;    %the transmission coefficent in real form between 1&3
  t15 = abs( W56_plus ./ W12_plus) ;    %the transmission coefficent in real form between 1&5
  
  
  
  plot(frequency,r34); xlim ([0 500]); 
  ylim ([0 1]);