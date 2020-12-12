cc;

delta_frequency = frequency(1,2) - frequency(1,1) ;
per = 1 / delta_frequency;
disp(per);

f1 = 10 ; 
f2 = 550 ; 
begin_position =  round(f1 / delta_frequency) ;
end_position =  round(f2 / delta_frequency) ;
frequency_select  = (frequency(1,begin_position:1:end_position))';
r12_select = r12(begin_position:1:end_position,1);
t13_select = t13(begin_position:1:end_position,1);
t15_select = t15(begin_position:1:end_position,1);

% figure(1) ;
%   r12_mov = movmean(r12_select,[800 1800]);
%   plot(frequency_select,r12_mov); xlim([50 500]) ;ylim([0 1]) ; hold on
%   plot(Sheet1_A,Sheet1_B,'LineWidth',2.5) ; xlim([50 500]) ;ylim([0 1]) ;hold off
%   ylabel('反射系数');
%   title(save_name);
%   grid on
% 
% figure(2)
% t13_mov = movmean(t13_select,[720 720]) ;
% plot(frequency_select,t13_mov) ;
% title('t13-Select') ;xlim([50 500]) ;ylim([0 1]) ; 
% hold on
% plot(Sheet1_A,Sheet1_C,'LineWidth',2.5) ; xlim([50 500]) ; ylim([0 1]) ; 
% grid on
% hold off

figure(3)
t15_mov = movmean(t15_select,10) ;
  plot(frequency_select,(t15_mov)); xlim([50 500]) ;ylim([0 1]) ; 
  ylabel('透射系数-mic-15');
  grid on
  hold on
      plot(Sheet1_A,Sheet1_D,'LineWidth',2.5) ; xlim([50 500]) ; ylim([0 1]) ; 
 grid on
 hold off

%  distFig