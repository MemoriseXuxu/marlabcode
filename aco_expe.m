% 注意参数的输入：面积、传感器间距，注意不同工况下的对应关系
clear
clc
close ;                             %清楚无关信息和无关变量
%% **************读取计算数据**** %%
real_workbook = 'real.xls' ;
img_workbook = 'img.xls' ;
freq = readmatrix(real_workbook,'Range','A:A') ;
P1_real = readmatrix(real_workbook,'Range','C:C');
P2_real = readmatrix(real_workbook,'Range','D:D'); 
P3_real = readmatrix(real_workbook,'Range','F:F'); 
P4_real = readmatrix(real_workbook,'Range','H:H'); 

P1_img = readmatrix(img_workbook,'Range','C:C');
P2_img = readmatrix(img_workbook,'Range','D:D');
P3_img = readmatrix(img_workbook,'Range','F:F');
P4_img = readmatrix(img_workbook,'Range','H:H');    

P1 = complex(P1_real,P1_img);
P2 = complex(P2_real,P2_img);
P3 = complex(P3_real,P3_img);
P4 = complex(P4_real,P4_img);
k = 2*pi*freq./340;             %波数
s = 0.05 ;                       %传声器间间距
L = 0 ;                      %传声器到试验件距离
area_mid = 0.1087 ;                 %进口管截面面积
area_side = 0.0625;                 %出口管截面面积
%% *************开始计算**** %%
fenmu = exp(1j*k*s)-exp(-1j*k*s) ;
p_a_plus = (P1.*exp(1j*k*s)-P2)./(fenmu) ;
p_a_minus = (P2-P1.*exp(-1j*k*s))./(fenmu) ;
w_a_plus = 0.5.*((abs(p_a_plus)).^2).*area_side./(340*1.225);     %上游正向声波
w_a_minus = 0.5.*((abs(p_a_minus)).^2).*area_side./(340*1.225);   %上游反向声波
surface_phase = exp(1j*2*k*L) ;


w_b = 0.5.*((abs(P3)).^2).*area_side./(340*1.225);
w_c = 0.5.*((abs(P4)).^2).*area_mid./(340*1.225);

r = w_a_minus./w_a_plus ;                   %reflection反射系数幅值
r_a = abs(r) ;

transmission_12 = abs( (w_b./w_a_plus).*exp(1j*2*k*L) ) ;                     %transmission透射系数幅值
transmission_13 = abs( (w_c./w_a_plus).*exp(1j*2*k*L) ) ;                     %transmission透射系数幅值

% absor = (w_up_plus+w_down_minus-w_up_minus-w_down_plus)./(w_up_plus+w_down_minus) ;    %a吸声系数，这里不确定需不需要绝对值
%% ************显示结果**** %%
figure(1)
plot(freq,r_a,'k','DisplayName','反射系数');                    hold on 
plot(freq,transmission_12,'b','DisplayName','A2B透射系数');
plot(freq,transmission_13,'DisplayName','A2C透射系数');

xlabel('频率','FontWeight','bold');
ylabel('声学系数','FontWeight','bold');
set(gca,'YLim',[0 1])                         %设置Y轴范围
hold off
grid on
legend