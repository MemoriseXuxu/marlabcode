%用于计算傅里叶变换和功率谱。对数据的前处理只有去直流而已。

function [x_cut_1,fft_result_output_1] = sfft(workingcondition,sheet1,sheet2,FileNameLocation,photo_location_p,photo_location_a,fs,sample1,sample2,sample3,sample4,sample5,sample6,ax_1,ay_1,az_1)

%fs为采样频率,单位Hz;
%sample为待处理信号，尽量保持数据为偶数，奇数也不是不可以哈哈哈;
%版本Beta1，作者Xuxu;
%2019年12月16日 程序编写;

%%        处理脉动压力数据    %%
%%        处理Sample 1     %%
    sample1 = sample1 - mean(sample1) ; %去直流，也是降噪的一种
    sample_lenght_1 = length(sample1);  %计算数据长度
    fft_cal_1 = fft(sample1) ;          %快速傅里叶变换计算
    f_x_1 = 0:fs/(sample_lenght_1-1):fs ;            %傅里叶变换的频率
    x_cut_1 = f_x_1(1:round(length(f_x_1)/2));    %只保留正轴频率数据
    fft_result_output_1 = abs((fft_cal_1(1:round(length(f_x_1)/2)))/(sample_lenght_1)); %FFT幅值结果
    
    figure(1);
    subplot(611);
    plot(x_cut_1,fft_result_output_1);
    title(['p1 FFT 工况：',blanks(4),num2str(workingcondition),blanks(4),num2str(fs)])
    xlim([0 1500]); axis normal ; xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on
    
    %%               开始处理Sample 2-方法一模一样               %%
    
    sample2 = sample2 - mean(sample2) ;
    sample_lenght_2 = length(sample2); 
    fft_cal_2 = fft(sample2) ;  
    f_x_2 = 0:fs/(sample_lenght_2-1):fs ;           
    x_cut_2 = f_x_2(1:round(length(f_x_2)/2));   
    fft_result_output_2 = abs((fft_cal_2(1:round(length(f_x_2)/2)))/(sample_lenght_2)); 
    figure(1);
    subplot(612);
    plot(x_cut_2,fft_result_output_2); 
    xlim([0 1500]); axis normal ;   xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    title('p2 FFT');
    grid on

    %%               处理Sample3               %%
    sample3 = sample3 - mean(sample3) ;
    sample_lenght_3 = length(sample3); 
    fft_cal_3 = fft(sample3) ;  
    f_x_3 = 0:fs/(sample_lenght_3-1):fs ;           
    x_cut_3 = f_x_3(1:round(length(f_x_3)/2));   
    fft_result_output_3 = abs((fft_cal_3(1:round(length(f_x_3)/2)))/(sample_lenght_3)); 
    figure(1);
    subplot(613);
    plot(x_cut_3,fft_result_output_3);     xlim([0 1500]); axis normal ;    xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on 
    title('p3 FFT');
    
    
    %%               处理Sample4               %%
    sample4 = sample4 - mean(sample4) ;
    sample_lenght_4 = length(sample4); 
    fft_cal_4 = fft(sample4) ;  
    f_x_4 = 0:fs/(sample_lenght_4-1):fs ;           
    x_cut_4 = f_x_4(1:round(length(f_x_4)/2));   
    fft_result_output_4 = abs((fft_cal_4(1:round(length(f_x_4)/2)))/(sample_lenght_4)); 
    figure(1);
    subplot(614);
    plot(x_cut_4,fft_result_output_4);     xlim([0 1500]);  axis normal ;   xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on 
    title('p4 FFT');

    
    
    %%               处理Sample5               %%
      
    sample5 = sample5 - mean(sample5) ;
    sample_lenght_5 = length(sample5); 
    fft_cal_5 = fft(sample5) ;  
    f_x_5 = 0:fs/(sample_lenght_5-1):fs ;           
    x_cut_5 = f_x_5(1:round(length(f_x_5)/2));   
    fft_result_output_5 = abs((fft_cal_5(1:round(length(f_x_5)/2)))/(sample_lenght_5)); 
    figure(1);
    subplot(615);
    plot(x_cut_5,fft_result_output_5);     xlim([0 1500]); axis normal ;    xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on 
    title('p5 FFT');

    
    %%              处理Sample6              %%
    sample6 = sample6 - mean(sample6) ;
    sample_lenght_6 = length(sample6); 
    fft_cal_6 = fft(sample6) ;  
    f_x_6 = 0:fs/(sample_lenght_6-1):fs ;           
    x_cut_6 = f_x_6(1:round(length(f_x_6)/2));   
    fft_result_output_6 = abs((fft_cal_6(1:round(length(f_x_6)/2)))/(sample_lenght_6)); 
    figure(1);
    subplot(616);
    plot(x_cut_6,fft_result_output_6);     xlim([0 1500]); axis normal ;    xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on 
    title('p6 FFT');
  
    %%              保存图片              %%
   
    print(photo_location_p,'-dpdf','-fillpage');

    %%                   脉动压力标题设置                %%
    fr_name = {'频率'} ;
    ampltidu_unit = {'幅值'};
    psd_unit = {'功率谱'};
    p1_label = {'P1'};
    p2_label = {'P2'};
    p3_label = {'P3'};
    p4_label = {'P4'};
    p5_label = {'P5'};
    p6_label = {'P6'};
    long_unit = {'DataLength'};
    %%               写入Excel文件中             %%
    
    %开始写测定位置和工作表1
    %写入到工作表1
    xlswrite(FileNameLocation,p1_label,sheet1,'B3');       %写Pi标题
    xlswrite(FileNameLocation,p2_label,sheet1,'D3');       %写Pi标题
    xlswrite(FileNameLocation,p3_label,sheet1,'F3');       %写Pi标题
    xlswrite(FileNameLocation,p4_label,sheet1,'H3');       %写Pi标题
    xlswrite(FileNameLocation,p5_label,sheet1,'J3');       %写Pi标题
    xlswrite(FileNameLocation,p6_label,sheet1,'L3');       %写Pi标题

   
    %开始写频率
    xlswrite(FileNameLocation,fr_name,sheet1,'A1');
    xlswrite(FileNameLocation,fr_name,sheet1,'C1');
    xlswrite(FileNameLocation,fr_name,sheet1,'E1');
    xlswrite(FileNameLocation,fr_name,sheet1,'G1');
    xlswrite(FileNameLocation,fr_name,sheet1,'I1');
    xlswrite(FileNameLocation,fr_name,sheet1,'K1');
    
    %开始写幅值
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'B1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'D1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'F1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'H1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'J1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'L1');
    
    %开始写单位
    frequencyUnit = {'Hz'};
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'A2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'C2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'E2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'G2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'I2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'K2');
    
    %写入结果--频率
    xlswrite(FileNameLocation,x_cut_1',sheet1,'A4:A32800');               %写入P1结果
    xlswrite(FileNameLocation,fft_result_output_1,sheet1,'B4:B32800');
    xlswrite(FileNameLocation,x_cut_2',sheet1,'C4:C32800');               %写入P2结果
    xlswrite(FileNameLocation,fft_result_output_2,sheet1,'D4:D32800');  
    xlswrite(FileNameLocation,x_cut_3',sheet1,'E4:E32800');               %写入P3结果
    xlswrite(FileNameLocation,fft_result_output_3,sheet1,'F4:F32800');
    xlswrite(FileNameLocation,x_cut_4',sheet1,'G4:G32800');               %写入P4结果
    xlswrite(FileNameLocation,fft_result_output_4,sheet1,'H4:H32800');   
    xlswrite(FileNameLocation,x_cut_5',sheet1,'I4:I32800');               %写入P5结果
    xlswrite(FileNameLocation,fft_result_output_5,sheet1,'J4:J32800');
    xlswrite(FileNameLocation,x_cut_6',sheet1,'K4:K32800');               %写入P6结果
    xlswrite(FileNameLocation,fft_result_output_6,sheet1,'L4:L32800');
  
    
    %%                  开始处理加速度数据                     &&
    %%                  处理ax_1                             &&
    ax_1 = ax_1 - mean(ax_1) ; %去直流，也是降噪的一种
    ax_lenght_1 = length(ax_1);  %计算数据长度
    fft_ax_1 = fft(ax_1) ;          %快速傅里叶变换计算
    f_ax_1 = 0:fs/(ax_lenght_1-1):fs ;            %傅里叶变换的频率
    ax_cut_1 = f_ax_1(1:round(length(f_ax_1)/2));    %只保留正轴频率数据
    fft_result_output_ax1 = abs((fft_ax_1(1:round(length(f_ax_1)/2)))/(ax_lenght_1)); %FFT幅值结果
    figure(2);
    subplot(311);
    plot(ax_cut_1,fft_result_output_ax1);
    title(['ax1 FFT',num2str(workingcondition)])
    xlim([0 1500]); axis normal ;   xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on
    
    %%                  处理ay_1                             &&
    
    ay_1 = ay_1 - mean(ay_1) ; %去直流，也是降噪的一种
    ay_lenght_1 = length(ay_1);  %计算数据长度
    fft_ay_1 = fft(ay_1) ;          %快速傅里叶变换计算
    f_ay_1 = 0:fs/(ay_lenght_1-1):fs ;            %傅里叶变换的频率
    ay_cut_1 = f_ay_1(1:round(length(f_ay_1)/2));    %只保留正轴频率数据
    fft_result_output_ay1 = abs((fft_ay_1(1:round(length(f_ay_1)/2)))/(ay_lenght_1)); %FFT幅值结果
    figure(2);
    subplot(312);
    plot(ay_cut_1,fft_result_output_ay1);
    title(['ay1 FFT 工况：',blanks(4),num2str(workingcondition),blanks(4),num2str(fs)]);
    xlim([0 1500]); axis normal ;   xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on
 
    %%                  处理az_1                             &&
    az_1 = az_1 - mean(az_1) ; %去直流，也是降噪的一种
    az_lenght_1 = length(az_1);  %计算数据长度
    fft_az_1 = fft(az_1) ;          %快速傅里叶变换计算
    f_az_1 = 0:fs/(az_lenght_1-1):fs ;            %傅里叶变换的频率
    az_cut_1 = f_az_1(1:round(length(f_az_1)/2));    %只保留正轴频率数据
    fft_result_output_az1 = abs((fft_az_1(1:round(length(f_az_1)/2)))/(az_lenght_1)); %FFT幅值结果
    figure(2);
    subplot(313);
    plot(az_cut_1,fft_result_output_az1);
    title('az1 FFT')
    xlim([0 500]); axis normal ; xlabel('频率','FontWeight','bold');     ylabel('幅值','FontWeight','bold');
    grid on
    %%              保存图片              %%
    print(photo_location_a,'-dpdf','-fillpage');
    %%              写入单位              %%
    ax1_label = {'X1'};
    ay1_label = {'Y1'};
    az1_label = {'Z1'};
    accel_unit = {'m*s^(-2)'} ;
    
    %开始写频率
    xlswrite(FileNameLocation,fr_name,sheet1,'M1');
    xlswrite(FileNameLocation,fr_name,sheet1,'O1');
    xlswrite(FileNameLocation,fr_name,sheet1,'Q1');

    %开始写单位
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'M2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'O2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'Q2');
    
    xlswrite(FileNameLocation,ax1_label,sheet1,'N3');       %写ai标题
    xlswrite(FileNameLocation,ay1_label,sheet1,'P3');       %写ai标题
    xlswrite(FileNameLocation,az1_label,sheet1,'R3');       %写ai标题
    
    %开始写幅值
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'N1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'P1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'R1');
    
    %开始写入加速度计算结果
    xlswrite(FileNameLocation,ax_cut_1',sheet1,'M4:M32800'); 
    xlswrite(FileNameLocation,fft_result_output_ax1,sheet1,'N4:N32800');    
    xlswrite(FileNameLocation,ay_cut_1',sheet1,'O4:O32800'); 
    xlswrite(FileNameLocation,fft_result_output_ay1,sheet1,'P4:P32800'); 
    xlswrite(FileNameLocation,az_cut_1',sheet1,'Q4:Q32800');   
    xlswrite(FileNameLocation,fft_result_output_az1,sheet1,'R4:R32800'); 
