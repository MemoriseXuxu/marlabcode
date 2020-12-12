%****************��ʼ**** 
clear
clc
close ;
%**************���Ľ��****
paper_x = readmatrix('I:\paper_reflection_coe.xlsx','Range','A:A') ;
paper_r_coef = readmatrix('I:\paper_reflection_coe.xlsx','Range','B:B');
%**************��ȡ��������****
real_workbook = 'real.xls' ;
img_workbook = 'img.xls' ;
freq = readmatrix(real_workbook,'Range','A:A') ;
P1_real = readmatrix(real_workbook,'Range','F:F');
P2_real = readmatrix(real_workbook,'Range','H:H'); 
P1_img = readmatrix(img_workbook,'Range','F:F');
P2_img = readmatrix(img_workbook,'Range','H:H');
P1 = complex(P1_real,P1_img);
P2 = complex(P2_real,P2_img);
k = 2*pi*freq./340;             %����
s = 0.01;                      %����������
L = 0.44 ;                      %�����������������    
%*************��ʼ����****
H12 = P2./P1 ;
Hi = exp(-1j*k*s) ;
Hr = exp(1j*k*s)  ;
surface_phase = exp(j*2*k*L) ;
r = (H12-Hi)./(Hr-H12).*surface_phase ;         %����ϵ����������ʽ
r_real = real(r) ;
r_img = imag(r) ;
r_amp = real(r).^2+imag(r).^2 ;

%************��ʾ���****
freq_x = freq.*0.1./340 ;
plot(freq_x,r_amp,'k','DisplayName','r��ֵ');

hold on
% plot(freq_x,r_real,'Color','r','DisplayName','rʵ��');
plot(paper_x,paper_r_coef,'m','DisplayName','r����');
xlabel('Ƶ��','FontWeight','bold');
ylabel('��ѧϵ��','FontWeight','bold');
set(gca,'XLim',[0 0.4])                         %����x�᷶Χ
hold off
grid on
legend