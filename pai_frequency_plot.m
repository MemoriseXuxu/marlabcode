fs =48000 ;
total_time = length(channel1) ./ fs ;
begin_time = 1 ;
begin_position = round(begin_time * 48000 );
end_position = round((begin_time+4) * 48000 );

time_result = (begin_time:1/48000:begin_time+4)';

r1 = channel1(begin_position:1:end_position) ;
r2 = channel2(begin_position:1:end_position)  ;
r3 = channel3(begin_position:1:end_position) ;
r4 = channel4(begin_position:1:end_position) ;
r5 = channel5(begin_position:1:end_position) ;
r6 = channel6(begin_position:1:end_position) ;
e_r1 = envelope(r1,1200,'peak');
e_r2 = envelope(r2,1205,'peak');
e_r3 = envelope(r3,1200,'peak');
e_r4 = envelope(r4,1200,'peak');
e_r5 = envelope(r5,1200,'peak');
e_r6 = envelope(r6,1205,'peak');

r1_min = min(e_r1); r1_max = max(e_r1);   y1 = (r1_max-0.5*(r1_max + r1_min)) / (0.5*(r1_max + r1_min));
r2_min = min(e_r2); r2_max = max(e_r2);   y2 =  (r2_max-0.5*(r2_max + r2_min)) / (0.5*(r2_max + r2_min));
r3_min = min(e_r3); r3_max = max(e_r3);   y3 =  (r3_max-0.5*(r3_max + r3_min)) / (0.5*(r3_max + r3_min));
r4_min = min(e_r4); r4_max = max(e_r4);   y4 =  (r4_max-0.5*(r4_max + r4_min)) / (0.5*(r4_max + r4_min)) ;
r5_min = min(e_r5); r5_max = max(e_r5);   y5 =  (r5_max-0.5*(r5_max + r5_min)) / (0.5*(r5_max + r5_min)) ;
r6_min = min(e_r6); r6_max = max(e_r6);   y6 = (r6_max-0.5*(r6_max + r6_min)) / (0.5*(r6_max + r6_min)) ;
t1 = (((log((1+f_rate)/(1-f_rate)))-log(2)) )* 2*y1 /(1+y1) ;
t2 = ((log((1+f_rate)/(1-f_rate)))-log(2)) * 2*y2 /(1+y2) ;
t3 = ((log((1+f_rate)/(1-f_rate)))-log(2)) * 2*y3 /(1+y3) ;
t4 = ((log((1+f_rate)/(1-f_rate)))-log(2)) * 2*y4 /(1+y4) ;
t5 = ((log((1+f_rate)/(1-f_rate)))-log(2)) * 2*y5 /(1+y5) ;
t6 = ((log((1+f_rate)/(1-f_rate)))-log(2)) * 2*y6 /(1+y6) ;
cell_result = {'F1' , f1 ; 'F2' , f2 ; 'T1',t1 ; 'T2',t2 ;'T3',t3 ;'T4',t4; 'T5',t5; 'T6',t6} 
f1_name = num2str(f1);
f2_name = num2str(f2);
mat_file_name = [save_name,'-',f1_name,'-',f2_name] ;
filename = [mat_file_name,'.xlsx'] ;
writecell (cell_result,filename,'Sheet',1,'Range','A1:B8')
%% Plot Pic  %%
figure(1)
plot(time_result,r1);hold on;plot(time_result,e_r1,'LineWidth',2.5);hold off
title('Mic-1')
print('Mic-1','-djpeg','-r500')

figure(2)
plot(time_result,r2);;hold on;plot(time_result,e_r2,'LineWidth',2.5);hold off
title('Mic-2')
print('Mic-2','-djpeg','-r500')

figure(3)
plot(time_result,r3);;hold on;plot(time_result,e_r3,'LineWidth',2.5);hold off
title('Mic-3')
print('Mic-3','-djpeg','-r500')

figure(4)
plot(time_result,r4);;hold on;plot(time_result,e_r4,'LineWidth',2.5);hold off
title('Mic-4')
print('Mic-4','-djpeg','-r500')

figure(5)
plot(time_result,r5);;hold on;plot(time_result,e_r5,'LineWidth',2.5);hold off
title('Mic-5')
print('Mic-5','-djpeg','-r500')

figure(6)
plot(time_result,r6);;hold on;plot(time_result,e_r6,'LineWidth',2.5);hold off
title('Mic-6')
print('Mic-6','-djpeg','-r500')

distFig
f1_name = num2str(f1);
f2_name = num2str(f2);
mat_file_name = [save_name,'-',f1_name,'-',f2_name] ;
save(mat_file_name,'time_result','r1','r2','r3','r4','r5','r6') ;