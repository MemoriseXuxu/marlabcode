clear
fs = 48000;
t = 0:1/fs:5 ;
A1 = 10;
A2 = 15;
f1 = 100 ;
f2 = 130;
degree_1 = deg2rad(0) ;
degree_2 = deg2rad(0) ;
sign_1 = A1*sin(2*pi*f1*t+degree_1) ;
sign_2 = A2*sin(2*pi*f2*t+degree_2) ;
sign_3 = sign_1 + sign_2 ;
sign_pai = envelope(sign_3) ;
disp(max(abs(sign_3)));
disp(min(abs(sign_3)));

figure(1)
subplot(3,1,1)
plot(t,sign_1);
subplot(3,1,2)
plot(t,sign_2);
subplot(3,1,3)
plot(t,sign_3);
hold on
% plot(t,sign_pai);
hold off

figure(2)
[f,fft_3] = calfft(fs,sign_3) ;
[f,fft_pai] = calfft(fs,sign_pai);
f = f' ;
subplot(2,1,1)
plot(f,fft_3);
xlim([0 2000]);
subplot(2,1,2)
plot(f,fft_pai);
xlim([0 2000]);