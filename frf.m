  fs = 48000 ;   %the sample frequency like 10000Hz,65536Hz
  f1 = 5000 ; 
  f2 = 5500 ; 
  start_number = round(48000 * 1.49);
%   s_time = start_number/48000;
  end_number = round(start_number + 1* 67.5  * 48000 + 1 ) ;
  c = 347.98 ;          %the speed of sound m/s
  density = 1.225 ;  %the density of Air in standard temperature
  area_a = 0.252;    %the pipe named 出口�?1
  area_b = 0.252;    %the pipe named 出口�?2
  area_c = 0.488;    %the pipe named 进口�?  
%   end_time = end_number / 48000 ;
  mic_1_time = channel1(start_number:end_number);
  mic_2_time = channel2(start_number:end_number);
  mic_3_time = channel4(start_number:end_number);
  mic_4_time = channel3(start_number:end_number);
  mic_5_time = channel6(start_number:end_number);
  mic_6_time = channel5(start_number:end_number);

  mic_1_time = mic_1_time - mean(mic_1_time);
  mic_2_time = mic_2_time - mean(mic_2_time);
  mic_3_time = mic_3_time - mean(mic_3_time);
  mic_4_time = mic_4_time - mean(mic_4_time);
  mic_5_time = mic_5_time - mean(mic_5_time);
  mic_6_time = mic_6_time - mean(mic_6_time);
%  Define Basic parameters  

  L_1 = length(mic_1_time) ;  
  frequency = fs * (0:1:(L_1/2))/L_1 ;
  Y_1 = mic_1_time(1:L_1) ;
  S_1 =fft(Y_1,L_1)./L_1 ;
  P2_1 = S_1 ;
  P1_1 = P2_1(1:L_1/2+1) ;
  P1_1(2:end-1) = 2 * P1_1(2:end-1);
  mic_1 = P1_1  ;
  mic_1_psd = (abs(mic_1)) .^2 ;

  clear P1 P2 ;  
  L_2 = length(mic_2_time) ;
  frequency = fs * (0:1:(L_2/2))/L_2 ;
  Y_2 = mic_2_time(1:L_2) ;
  S_2 =fft(Y_2,L_2)./L_2 ;
  P2_2 = S_2 ;
  P1_2 = P2_2(1:L_2/2+1) ;
  P1_2(2:end-1) = 2 * P1_2(2:end-1);
  mic_2 = P1_2  ;
  mic_2_psd = (abs(mic_2)) .^2 ;
  
  clear P1 P2 ;  
  L_3 = length(mic_3_time) ;
  frequency = fs * (0:1:(L_3/2))/L_3 ;
  Y_3 = mic_3_time(1:L_3) ;
  S_3 =fft(Y_3,L_3)./L_3 ;
  P2_3 = S_3 ;
  P1_3 = P2_3(1:L_3/2+1) ;
  P1_3(2:end-1) = 2 * P1_3(2:end-1);
  mic_3 = P1_3  ;
  mic_3_psd = (abs(mic_3)) .^2 ;
  
  clear P1 P2 ;  
   L_4 = length(mic_4_time) ;
  frequency = fs * (0:1:(L_4/2))/L_4 ;
  Y_4 = mic_4_time(1:L_4) ;
  S_4 =fft(Y_4,L_4)./L_4 ;
  P2_4 = S_4 ;
  P1_4 = P2_4(1:L_4/2+1) ;
  P1_4(2:end-1) = 2 * P1_4(2:end-1);
  mic_4 = P1_4 ;
  mic_4_psd = (abs(mic_4)) .^2 ;
  
  clear P1 P2 ;  
  L_5 = length(mic_5_time) ;
  frequency = fs * (0:1:(L_5/2))/L_5 ;
  Y_5 = mic_5_time(1:L_5) ;
  S_5 =fft(Y_5,L_5)./L_5 ;
  P2_5 = S_5 ;
  P1_5 = P2_5(1:L_5/2+1) ;
  P1_5(2:end-1) = 2 * P1_5(2:end-1);
  mic_5 = P1_5 ;
  mic_5_psd = (abs(mic_5)) .^2 ;
  
  clear P1 P2 ;  
  L_6 = length(mic_6_time) ;
  frequency = fs * (0:1:(L_6/2))/L_6 ;
  Y_6 = mic_6_time(1:L_6) ;
  S_6 =fft(Y_6,L_6)./L_6 ;
  P2_6 = S_6 ;
  P1_6 = P2_6(1:L_6/2+1) ;
  P1_6(2:end-1) = 2 * P1_6(2:end-1);
  mic_6 = P1_6 ;
  clear P1 P2 ;  
  mic_6_psd = (abs(mic_6)) .^2 ;
    frequency = frequency' ;
    delta_frequency = frequency(2,1) - frequency(1,1) ;
    begin_position =  round(f1 / delta_frequency) ;
    end_position =  round(f2 / delta_frequency) ;


  
  f_mic_1 = movmean(abs(mic_1),50) ; 
  f_mic_2 = movmean(abs(mic_2),50) ; 
  f_mic_3 = movmean(abs(mic_3),50) ; 
  f_mic_4 = movmean(abs(mic_4),50) ; 
  f_mic_5 = movmean(abs(mic_5),50) ; 
  f_mic_6 = movmean(abs(mic_6),50) ; 
  
  db_mic_1 = db_translation(f_mic_1) ; 
  db_mic_2 = db_translation(f_mic_2) ; 
  db_mic_3 = db_translation(f_mic_3) ; 
  db_mic_4 = db_translation(f_mic_4) ; 
  db_mic_5 = db_translation(f_mic_5) ; 
  db_mic_6 = db_translation(f_mic_6) ; 
    
  frequency_filter = frequency(begin_position:end_position,1) ; 
  f_mic1_filter = f_mic_1(begin_position:end_position,1) ;
  f_mic2_filter = f_mic_2(begin_position:end_position,1) ;  
  f_mic3_filter = f_mic_3(begin_position:end_position,1) ;  
  f_mic4_filter = f_mic_4(begin_position:end_position,1) ;  
  f_mic5_filter = f_mic_5(begin_position:end_position,1) ;  
  f_mic6_filter = f_mic_6(begin_position:end_position,1) ; 
  
 W1 = 0.5.*((abs(f_mic1_filter)).^2).*area_c./(c*density);   
 W2 = 0.5.*((abs(f_mic2_filter)).^2).*area_c./(c*density);
 
 W3 = 0.5.*((abs(f_mic3_filter)).^2).*area_a./(c*density);   
 W4 = 0.5.*((abs(f_mic4_filter)).^2).*area_a./(c*density);   
 
 W5 = 0.5.*((abs(f_mic5_filter)).^2).*area_b./(c*density);   
 W6 = 0.5.*((abs(f_mic6_filter)).^2).*area_b./(c*density);   
  
  
  db_mic_1 = db_mic_1(begin_position:end_position,1) ; 
    db_mic_2 = db_mic_2(begin_position:end_position,1) ; 
      db_mic_3 = db_mic_3(begin_position:end_position,1) ; 
        db_mic_4 = db_mic_4(begin_position:end_position,1) ; 
          db_mic_5 = db_mic_5(begin_position:end_position,1) ; 
            db_mic_6 = db_mic_6(begin_position:end_position,1) ; 
            
w13 = 10 * log10(W1./W3);
w15 = 10 * log10(W1./W5) ;
plot(frequency_filter,f_mic1_filter);

            