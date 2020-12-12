  start_number = 48000 *11;
%   s_time = start_number/48000;
  end_number = start_number + 7.2* 48000 + 1  ;
%   end_time = end_number / 48000 ;
  mic_1_time = channel3(start_number:end_number);
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
% 28.985235                                      Space
  s = 30 / 1000 ;     %the distance between mic /mm
  fs = 48000 ;       %the sample frequency like 10000Hz,65536Hz
  c = 347.98 ;          %the speed of sound m/s
  density = 1.225 ;  %the density of Air in standard temperature
  area_a = 0.252;    %the pipe named 出口�?1
  area_b = 0.252;    %the pipe named 出口�?2
  area_c = 0.488;    %the pipe named 进口�?
   
  L = length(mic_1_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_1_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_1 = P1  ;
  clear P1 P2 ;
  
    clear P1 P2 ;  
  L = length(mic_2_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_2_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_2 = P1  ;
  
  clear P1 P2 ;  
  L = length(mic_3_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_3_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_3 = P1  ;
  
  clear P1 P2 ;  
   L = length(mic_4_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_4_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_4 = P1 ;
  
  clear P1 P2 ;  
  L = length(mic_5_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_5_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_5 = P1 ;
  
  clear P1 P2 ;  
  L = length(mic_6_time) ;
  frequency = fs * (0:1:(L/2))/L ;
  Y = mic_6_time(1:L) ;
  S = fft(Y,L)./(L/2) ;
  P2 = S ;
  P1 = P2(1:L/2+1) ;
  P1(2:end-1) = 2 * P1(2:end-1);
  mic_6 = P1 ;
    
%  Begin calculation  
  K_L = 500/1000 ;
  k = (2*pi*frequency/c)'   ; %the specific number k
  
  S12 = mic_1 .* conj(mic_2) ;
  S11 = mic_1 .* conj(mic_1) ;    
  S21 = mic_2 .* conj(mic_1) ;
  S22 = mic_2 .* conj(mic_2) ;
  
  H12 = sqrt((S12./S11) .* (S22./S21)) ;
% H12 = (S22./S21) ;
  Hr = exp(1j*k*s) ;
  Hi = exp(-1j*k*s) ;
  r = (H12-Hi) ./ (Hr-H12) ;
  plot(frequency,abs(r));
  xlim( [0 500]); ylim( [0 1]) ;