% n = 100 ;
% mp3 = smooth(p3,n,'moving');

fs = 65536 ;
T = 1/fs ;
L = length(time);
t= time ; 

re = fft(p3);

re2 = abs(re/L);
re1 = re2(1:L/2+1);
re1(2:end-1) = 2*re1(2:end-1) ;

f1 = fs*(0:(L/2))/L ;

power = re1.^2;


figure(1);
subplot(311);
plot(t,p3);
xlabel('����ʱ�䣨s��');
ylabel('ѹ����Pa��');
title('ʱ������');
grid;

subplot(312);
plot(f1,re1);
xlabel('Ƶ�ʣ�Hz��');
ylabel('��ֵ');
title('FFT���');
grid;

subplot(313);
plot(f1,power);
xlabel('Ƶ�ʣ�Hz��');
ylabel('��ֵ');
title('������');
grid;



