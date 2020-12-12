figure(11)
t15_mov = movmean(t15,[900 1800]);
    plot(frequency,t15_mov); xlim([50 500]) ;ylim([0 1]) ;   
      ylabel('Í¸ÉäÏµÊý-mic-13');
      grid on
      hold on
    plot(Sheet1_A,Sheet1_C,'LineWidth',1.5) ; xlim([50 500]) ;ylim([0 1]) ;
      hold off

A  = frequency(1,begin_position:end_position)      ;
B = t13(begin_position:end_position,1) ; 
      