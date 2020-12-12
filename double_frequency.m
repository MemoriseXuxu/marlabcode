fs = 48000 ;   %the sample frequency like 10000Hz,65536Hz
start_number = round(48000 * 0.52);
end_number = start_number + round(1* 65 * 48000)  ;

mic_1_time = channel1(start_number:end_number);
mic_2_time = channel2(start_number:end_number);
mic_3_time = channel3(start_number:end_number);
mic_4_time = channel4(start_number:end_number);
mic_5_time = channel5(start_number:end_number);
mic_6_time = channel6(start_number:end_number);

mic_1_time = mic_1_time - mean(mic_1_time);
mic_2_time = mic_2_time - mean(mic_2_time);
mic_3_time = mic_3_time - mean(mic_3_time);
mic_4_time = mic_4_time - mean(mic_4_time);
mic_5_time = mic_5_time - mean(mic_5_time);
mic_6_time = mic_6_time - mean(mic_6_time);

mic_1_db = db_translation(abs(mic_1_time));
mic_2_db = db_translation(abs(mic_2_time));
mic_3_db = db_translation(abs(mic_3_time));
mic_4_db = db_translation(abs(mic_4_time));
mic_5_db = db_translation(abs(mic_5_time));
mic_6_db = db_translation(abs(mic_6_time));

mic_1_time_pai = envelope(mic_1_time);
mic_2_time_pai = envelope(mic_2_time);
mic_3_time_pai = envelope(mic_3_time);
mic_4_time_pai = envelope(mic_4_time);
mic_5_time_pai = envelope(mic_5_time);
mic_6_time_pai = envelope(mic_6_time);

L = length(mic_1_time) ;
A_timing = (0:1/fs:(L-1)/fs)' ;
%%
[f,mic_1_psd] =calfft(fs,mic_1_time) ;
[f,mic_2_psd] =calfft(fs,mic_2_time) ;
[f,mic_3_psd] =calfft(fs,mic_3_time) ;
[f,mic_4_psd] =calfft(fs,mic_4_time) ;
[f,mic_5_psd] =calfft(fs,mic_5_time) ;
[f,mic_6_psd] =calfft(fs,mic_6_time) ;

% f = f(1:30000);
% mic_1_psd = mic_1_psd(1:30000);
% mic_2_psd = mic_2_psd(1:30000);
% mic_3_psd = mic_3_psd(1:30000);
% mic_4_psd = mic_4_psd(1:30000);
% mic_5_psd = mic_5_psd(1:30000);
% mic_6_psd = mic_6_psd(1:30000);

%% 保存图片到本地中
% beg = round( 2 * 48000 ) ;
% endd = beg + ( 0.1 * 48000 ) ;
%   figure(1) ;
%   plot(A_timing(beg:1:endd),mic_1_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_1_time_pai(beg:1:endd));hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-1'}) ; ylim([-1 1]) ;
%   print('Mic-1-time','-djpeg','-r500') ;
%
%   figure(2) ;
%   plot(A_timing(beg:1:endd),mic_2_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_2_time_pai(beg:1:endd));hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-2'}) ; ylim([-1 1]) ;
%   print('Mic-2-time','-djpeg','-r500') ;
%
%    figure(3) ;
%   plot(A_timing(beg:1:endd),mic_3_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_3_time_pai(beg:1:endd));hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-3'}) ;ylim([-1 1]) ;
%   print('Mic-3-time','-djpeg','-r500') ;
%
%    figure(4) ;
%   plot(A_timing(beg:1:endd),mic_4_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_4_time_pai(beg:1:endd));hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-4'}) ; ylim([-1 1]) ;
%   print('Mic-4-time','-djpeg','-r500') ;
%
%    figure(5) ;
%   plot(A_timing(beg:1:endd),mic_5_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_5_time_pai(beg:1:endd));hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-5'}) ; ylim([-1 1])
%   print('Mic-5-time','-djpeg','-r500') ;
%
%    figure(6) ;
%   plot(A_timing(beg:1:endd),mic_6_time(beg:1:endd)) ;hold on
%   plot(A_timing(beg:1:endd),mic_6_time_pai(beg:1:endd));
%   hold off
%   xlabel('时间(s)') ; ylabel('声压幅值(Pa)'); title({save_name,'Mic-6'}) ;ylim([-1 1]) ;
%   print('Mic-6-time','-djpeg','-r500') ;
% cc
%%
mat_file_name = [save_name,'-time']
save(mat_file_name,'A_timing','mic_1_time','mic_2_time','mic_3_time','mic_4_time','mic_5_time','mic_6_time') ;
mat_file_name = [save_name,'-fft']
save(mat_file_name,'f','mic_1_psd','mic_2_psd','mic_3_psd','mic_4_psd','mic_5_psd','mic_6_psd')
mat_file_name = [save_name,'-pai']
save(mat_file_name,'A_timing','mic_1_time_pai','mic_2_time_pai','mic_3_time_pai','mic_4_time_pai','mic_5_time_pai','mic_6_time_pai')
mat_file_name = [save_name,'-db']
save(mat_file_name,'A_timing','mic_1_db','mic_2_db','mic_3_db','mic_4_db','mic_5_db','mic_6_db')

