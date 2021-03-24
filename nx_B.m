% % 注意参数的输入：面积、传感器间距，注意不同工况下的对应关系
% clear
% clc
% close ;                             %清楚无关信息和无关变量
%% 这个版本是计算声源在B，AC做吸声处理。
%% **************读取计算数据**** %%
freq = sheet_A ;
P1 = complex(sheet_F,sheet_G);
P2 = complex(sheet_H,sheet_I);

P3 = complex(sheet_D,sheet_E);
P4 = complex(sheet_B,sheet_C);

P5 = complex(sheet_J,sheet_K);
P6 = complex(sheet_L,sheet_M);
% 
% P7 = complex(sheet_N,sheet_O);
% P8 = complex(sheet_P,sheet_Q);

k = 2*pi*freq./340;             %波数
s_A = 10.012049084 / 1000;                      %传声器间间距
s_B = 10/1000 ;
s_C = 8.0092/ 1000 ;
L = 0 ;                      %传声器到试验件距离
area_C = 0.1193 ;                 %进口管截面面积 旧的0.1087
area_A = 0.0620;                 %出口管截面面积 旧的0.0625
area_B = 0.0620;
%% *************开始计算**** %%
%% 计算管道B，P1和P2
fenmu_B = exp(1j*k*s_B)-exp(-1j*k*s_B) ;

p_a_plus = (P1.*exp(1j*k*s_B)-P2)./(fenmu_B) ;
p_a_minus = (P2-P1.*exp(-1j*k*s_B))./(fenmu_B) ;
w_a_plus = 0.5.*((abs(p_a_plus)).^2).*area_B./(340*1.225);     %上游正向声波
w_a_minus = 0.5.*((abs(p_a_minus)).^2).*area_B./(340*1.225);   %上游反向声波
surface_phase = exp(1j*2*k*L) ;

%% 计算管道A，P3和P4
fenmu_A = exp(1j*k*s_A)-exp(-1j*k*s_A) ;
p_b_plus = (P3.*exp(1j*k*s_A)-P4)./(fenmu_A) ;
p_b_minus = (P4-P3.*exp(-1j*k*s_A))./(fenmu_A) ;
w_b_plus = 0.5.*((abs(p_b_plus)).^2).* area_A ./(340*1.225);     %下游正向声波
w_b_minus = 0.5.*((abs(p_b_minus)).^2).* area_A ./(340*1.225);   %下游反向声波

%% 计算中间管道C，P5和P6
fenmu_C = exp(1j*k*s_C)-exp(-1j*k*s_C) ;
p_c_plus = (P5.*exp(1j*k*s_C)-P6)./(fenmu_C) ;
p_c_minus = (P6-P5.*exp(-1j*k*s_C))./(fenmu_C) ;
w_c_plus = 0.5.*((abs(p_c_plus)).^2).* area_C ./(340*1.225);     %下游正向声波
w_c_minus = 0.5.*((abs(p_c_minus)).^2).* area_C ./(340*1.225);   %下游反向声波

%% 计算小管道出口的，P7和P8
% fenmu_small  = exp(1j*k*s_small)-exp(-1j*k*s_small) ;
% p_d_plus = (P7.*exp(1j*k*s_small)-P8)./(fenmu_small) ;
% p_d_minus = (P8-P7.*exp(-1j*k*s_small))./(fenmu_small) ;
% w_d_plus = 0.5.*((abs(p_d_plus)).^2).* area_small ./(340*1.225);     %下游正向声波
% w_d_minus = 0.5.*((abs(p_d_minus)).^2).* area_small ./(340*1.225);   %下游反向声波


r_a = abs( w_a_minus./w_a_plus) ;                  %reflection反射系数幅值
transmission_12 =  abs(w_b_plus ./ w_a_plus) ;
transmission_13 =  abs(w_c_plus ./ w_a_plus) ;
% tramsmission_14 =  abs(w_d_plus ./ w_a_plus) ;

%% ************显示结果**** %%
figure(2)
plot(freq,r_a,'k','DisplayName','反射系数B'); 
grid on
xlim ([0 500]);
ylim([0 1]) ;
title('反射系数')
figure(3)
plot(freq,transmission_12,'b','DisplayName','B2A透射系数');
grid on;
xlim ([0 500]);
ylim([0 1]) ;
title('透射系数A2B')

figure(4)
plot(freq,transmission_13,'DisplayName','B2C透射系数');
xlim ([0 500]);
ylim([0 1]) ;
grid on;
title('透射系数A2C');

% figure(5)
% plot(freq,tramsmission_14,'DisplayName','A2D透射系数');
% xlim ([0 500]);
% ylim([0 1]) ;
% grid on;
% title('透射系数A2D');


xlabel('频率','FontWeight','bold');
ylabel('声学系数','FontWeight','bold');
xlim ([0 500]);
set(gca,'YLim',[0 1])                         %设置Y轴范围
hold off
grid on
legend