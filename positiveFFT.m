
function [freq,X]=positiveFFT(x,Fs,p)

    N=length(x); %get the number of points
    k=0:N-1;     %create a vector from 0 to N-1
    T=N/Fs;      %get the frequency interval
    freq=k/T;    %create the frequency range
    X=fft(x)/(N/2); % normalize the data

    %only want the first half of the FFT, since it is redundant
    cutOff = ceil(N/2);

    %take only the first half of the spectrum
    X = X(1:cutOff);
    freq = freq(1:cutOff);
if nargin <3 
    disp('不输出图片结果')
elseif nargin == 3
    plot(freq,abs(X)) ;
    xlabel('Freq (Hz)')
    ylabel('Amplitude')
    title('Using positiveFFT function')
    grid    
end 