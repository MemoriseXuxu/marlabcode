%% Frequency Modulation
clear
fs = 48000 ;
t = 0:1/fs:5 ;
m = 0.5 ;
fc = 100;
fss = 2 ;
Vc = 10 ;
Vm = Vc*sin(2*pi*fc*t) - 0.5*m*Vc*cos(2*pi*(fc+fss)*t) + 0.5*m*Vc*cos(2*pi*(fc-fss)*t) ;
figure(1)
plot(t,Vm)
[f,fft_m] = calfft(fs,Vm) ;
figure(2)
plot(f,fft_m)