% % ע����������룺�������������࣬ע�ⲻͬ�����µĶ�Ӧ��ϵ
% clear
% clc
% close ;                             %����޹���Ϣ���޹ر���
%% **************��ȡ��������**** %%
freq = sheet_A ;
P1 = complex(sheet_F,sheet_G);
P2 = complex(sheet_H,sheet_I);

P3 = complex(sheet_D,sheet_E);
P4 = complex(sheet_B,sheet_C);

P5 = complex(sheet_L,sheet_M);
P6 = complex(sheet_J,sheet_K);
k = 2*pi*freq./340;             %����
s = 10 / 1000;                      %����������
L = 0 ;                      %�����������������
area_mid = 0.1205341 ;                 %���ڹܽ������ �ɵ�0.1087
area_side = 0.0620311;                 %���ڹܽ������ �ɵ�0.0625
%% *************��ʼ����**** %%
fenmu = exp(1j*k*s)-exp(-1j*k*s) ;

p_a_plus = (P1.*exp(1j*k*s)-P2)./(fenmu) ;
p_a_minus = (P2-P1.*exp(-1j*k*s))./(fenmu) ;
w_a_plus = 0.5.*((abs(p_a_plus)).^2).*area_side./(340*1.225);     %������������
w_a_minus = 0.5.*((abs(p_a_minus)).^2).*area_side./(340*1.225);   %���η�������
surface_phase = exp(1j*2*k*L) ;

p_b_plus = (P3.*exp(1j*k*s)-P4)./(fenmu) ;
p_b_minus = (P4-P3.*exp(-1j*k*s))./(fenmu) ;
w_b_plus = 0.5.*((abs(p_b_plus)).^2).* area_side ./(340*1.225);     %������������
w_b_minus = 0.5.*((abs(p_b_minus)).^2).* area_side ./(340*1.225);   %���η�������

p_c_plus = (P5.*exp(1j*k*s)-P6)./(fenmu) ;
p_c_minus = (P6-P5.*exp(-1j*k*s))./(fenmu) ;
w_c_plus = 0.5.*((abs(p_c_plus)).^2).* area_mid ./(340*1.225);     %������������
w_c_minus = 0.5.*((abs(p_c_minus)).^2).* area_mid ./(340*1.225);   %���η�������

% w_b = 0.5.*((abs(P3)).^2).*area_side./(340*1.225);
% w_c = 0.5.*((abs(P4)).^2).*area_side./(340*1.225);

r_a = abs( w_a_minus./w_a_plus) ;                  %reflection����ϵ����ֵ

% transmission_12 = abs( (w_b./w_a_plus) ) ;                     %transmission͸��ϵ����ֵ
% transmission_13 = abs( (w_c./w_a_plus) ) ;                     %transmission͸��ϵ����ֵ

transmission_12 =  abs(w_b_plus./w_a_plus) ;
transmission_13 =  abs(w_c_plus./w_a_plus) ;

% absor = (w_up_plus+w_down_minus-w_up_minus-w_down_plus)./(w_up_plus+w_down_minus) ;    %a����ϵ�������ﲻȷ���Ƿ�Ϊ����ֵ
%% ************��ʾ���**** %%
figure(2)
plot(freq,r_a,'k','DisplayName','����ϵ��'); 
grid on
xlim ([0 500]);
ylim([0 1]) ;
title('����ϵ��')
figure(3)
plot(freq,transmission_12,'b','DisplayName','A2B͸��ϵ��');
grid on;
xlim ([0 500]);
ylim([0 1]) ;
title('͸��ϵ��A2B')

figure(4)
plot(freq,transmission_13,'DisplayName','A2C͸��ϵ��');
xlim ([0 500]);
ylim([0 1]) ;
grid on;
title('͸��ϵ��A2C');

xlabel('Ƶ��','FontWeight','bold');
ylabel('��ѧϵ��','FontWeight','bold');
xlim ([0 500]);
set(gca,'YLim',[0 1])                         %����Y�᷶Χ
hold off
grid on
legend