%���ڼ��㸵��Ҷ�任�͹����ס������ݵ�ǰ����ֻ��ȥֱ�����ѡ�

function [x_cut_1,fft_result_output_1] = sfft(workingcondition,sheet1,sheet2,FileNameLocation,photo_location_p,photo_location_a,fs,sample1,sample2,sample3,sample4,sample5,sample6,ax_1,ay_1,az_1)

%fsΪ����Ƶ��,��λHz;
%sampleΪ�������źţ�������������Ϊż��������Ҳ���ǲ����Թ�����;
%�汾Beta1������Xuxu;
%2019��12��16�� �����д;

%%        ��������ѹ������    %%
%%        ����Sample 1     %%
    sample1 = sample1 - mean(sample1) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_1 = length(sample1);  %�������ݳ���
    fft_cal_1 = fft(sample1) ;          %���ٸ���Ҷ�任����
    f_x_1 = 0:fs/(sample_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_1 = f_x_1(1:round(length(f_x_1)/2));    %ֻ��������Ƶ������
    fft_result_output_1 = abs((fft_cal_1(1:round(length(f_x_1)/2)))/(sample_lenght_1)); %FFT��ֵ���
    
    figure(1);
    subplot(611);
    plot(x_cut_1,fft_result_output_1);
    title(['p1 FFT ������',blanks(4),num2str(workingcondition),blanks(4),num2str(fs)])
    xlim([0 1500]); axis normal ; xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on
    
    %%               ��ʼ����Sample 2-����һģһ��               %%
    
    sample2 = sample2 - mean(sample2) ;
    sample_lenght_2 = length(sample2); 
    fft_cal_2 = fft(sample2) ;  
    f_x_2 = 0:fs/(sample_lenght_2-1):fs ;           
    x_cut_2 = f_x_2(1:round(length(f_x_2)/2));   
    fft_result_output_2 = abs((fft_cal_2(1:round(length(f_x_2)/2)))/(sample_lenght_2)); 
    figure(1);
    subplot(612);
    plot(x_cut_2,fft_result_output_2); 
    xlim([0 1500]); axis normal ;   xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    title('p2 FFT');
    grid on

    %%               ����Sample3               %%
    sample3 = sample3 - mean(sample3) ;
    sample_lenght_3 = length(sample3); 
    fft_cal_3 = fft(sample3) ;  
    f_x_3 = 0:fs/(sample_lenght_3-1):fs ;           
    x_cut_3 = f_x_3(1:round(length(f_x_3)/2));   
    fft_result_output_3 = abs((fft_cal_3(1:round(length(f_x_3)/2)))/(sample_lenght_3)); 
    figure(1);
    subplot(613);
    plot(x_cut_3,fft_result_output_3);     xlim([0 1500]); axis normal ;    xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on 
    title('p3 FFT');
    
    
    %%               ����Sample4               %%
    sample4 = sample4 - mean(sample4) ;
    sample_lenght_4 = length(sample4); 
    fft_cal_4 = fft(sample4) ;  
    f_x_4 = 0:fs/(sample_lenght_4-1):fs ;           
    x_cut_4 = f_x_4(1:round(length(f_x_4)/2));   
    fft_result_output_4 = abs((fft_cal_4(1:round(length(f_x_4)/2)))/(sample_lenght_4)); 
    figure(1);
    subplot(614);
    plot(x_cut_4,fft_result_output_4);     xlim([0 1500]);  axis normal ;   xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on 
    title('p4 FFT');

    
    
    %%               ����Sample5               %%
      
    sample5 = sample5 - mean(sample5) ;
    sample_lenght_5 = length(sample5); 
    fft_cal_5 = fft(sample5) ;  
    f_x_5 = 0:fs/(sample_lenght_5-1):fs ;           
    x_cut_5 = f_x_5(1:round(length(f_x_5)/2));   
    fft_result_output_5 = abs((fft_cal_5(1:round(length(f_x_5)/2)))/(sample_lenght_5)); 
    figure(1);
    subplot(615);
    plot(x_cut_5,fft_result_output_5);     xlim([0 1500]); axis normal ;    xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on 
    title('p5 FFT');

    
    %%              ����Sample6              %%
    sample6 = sample6 - mean(sample6) ;
    sample_lenght_6 = length(sample6); 
    fft_cal_6 = fft(sample6) ;  
    f_x_6 = 0:fs/(sample_lenght_6-1):fs ;           
    x_cut_6 = f_x_6(1:round(length(f_x_6)/2));   
    fft_result_output_6 = abs((fft_cal_6(1:round(length(f_x_6)/2)))/(sample_lenght_6)); 
    figure(1);
    subplot(616);
    plot(x_cut_6,fft_result_output_6);     xlim([0 1500]); axis normal ;    xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on 
    title('p6 FFT');
  
    %%              ����ͼƬ              %%
   
    print(photo_location_p,'-dpdf','-fillpage');

    %%                   ����ѹ����������                %%
    fr_name = {'Ƶ��'} ;
    ampltidu_unit = {'��ֵ'};
    psd_unit = {'������'};
    p1_label = {'P1'};
    p2_label = {'P2'};
    p3_label = {'P3'};
    p4_label = {'P4'};
    p5_label = {'P5'};
    p6_label = {'P6'};
    long_unit = {'DataLength'};
    %%               д��Excel�ļ���             %%
    
    %��ʼд�ⶨλ�ú͹�����1
    %д�뵽������1
    xlswrite(FileNameLocation,p1_label,sheet1,'B3');       %дPi����
    xlswrite(FileNameLocation,p2_label,sheet1,'D3');       %дPi����
    xlswrite(FileNameLocation,p3_label,sheet1,'F3');       %дPi����
    xlswrite(FileNameLocation,p4_label,sheet1,'H3');       %дPi����
    xlswrite(FileNameLocation,p5_label,sheet1,'J3');       %дPi����
    xlswrite(FileNameLocation,p6_label,sheet1,'L3');       %дPi����

   
    %��ʼдƵ��
    xlswrite(FileNameLocation,fr_name,sheet1,'A1');
    xlswrite(FileNameLocation,fr_name,sheet1,'C1');
    xlswrite(FileNameLocation,fr_name,sheet1,'E1');
    xlswrite(FileNameLocation,fr_name,sheet1,'G1');
    xlswrite(FileNameLocation,fr_name,sheet1,'I1');
    xlswrite(FileNameLocation,fr_name,sheet1,'K1');
    
    %��ʼд��ֵ
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'B1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'D1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'F1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'H1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'J1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'L1');
    
    %��ʼд��λ
    frequencyUnit = {'Hz'};
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'A2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'C2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'E2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'G2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'I2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'K2');
    
    %д����--Ƶ��
    xlswrite(FileNameLocation,x_cut_1',sheet1,'A4:A32800');               %д��P1���
    xlswrite(FileNameLocation,fft_result_output_1,sheet1,'B4:B32800');
    xlswrite(FileNameLocation,x_cut_2',sheet1,'C4:C32800');               %д��P2���
    xlswrite(FileNameLocation,fft_result_output_2,sheet1,'D4:D32800');  
    xlswrite(FileNameLocation,x_cut_3',sheet1,'E4:E32800');               %д��P3���
    xlswrite(FileNameLocation,fft_result_output_3,sheet1,'F4:F32800');
    xlswrite(FileNameLocation,x_cut_4',sheet1,'G4:G32800');               %д��P4���
    xlswrite(FileNameLocation,fft_result_output_4,sheet1,'H4:H32800');   
    xlswrite(FileNameLocation,x_cut_5',sheet1,'I4:I32800');               %д��P5���
    xlswrite(FileNameLocation,fft_result_output_5,sheet1,'J4:J32800');
    xlswrite(FileNameLocation,x_cut_6',sheet1,'K4:K32800');               %д��P6���
    xlswrite(FileNameLocation,fft_result_output_6,sheet1,'L4:L32800');
  
    
    %%                  ��ʼ������ٶ�����                     &&
    %%                  ����ax_1                             &&
    ax_1 = ax_1 - mean(ax_1) ; %ȥֱ����Ҳ�ǽ����һ��
    ax_lenght_1 = length(ax_1);  %�������ݳ���
    fft_ax_1 = fft(ax_1) ;          %���ٸ���Ҷ�任����
    f_ax_1 = 0:fs/(ax_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    ax_cut_1 = f_ax_1(1:round(length(f_ax_1)/2));    %ֻ��������Ƶ������
    fft_result_output_ax1 = abs((fft_ax_1(1:round(length(f_ax_1)/2)))/(ax_lenght_1)); %FFT��ֵ���
    figure(2);
    subplot(311);
    plot(ax_cut_1,fft_result_output_ax1);
    title(['ax1 FFT',num2str(workingcondition)])
    xlim([0 1500]); axis normal ;   xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on
    
    %%                  ����ay_1                             &&
    
    ay_1 = ay_1 - mean(ay_1) ; %ȥֱ����Ҳ�ǽ����һ��
    ay_lenght_1 = length(ay_1);  %�������ݳ���
    fft_ay_1 = fft(ay_1) ;          %���ٸ���Ҷ�任����
    f_ay_1 = 0:fs/(ay_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    ay_cut_1 = f_ay_1(1:round(length(f_ay_1)/2));    %ֻ��������Ƶ������
    fft_result_output_ay1 = abs((fft_ay_1(1:round(length(f_ay_1)/2)))/(ay_lenght_1)); %FFT��ֵ���
    figure(2);
    subplot(312);
    plot(ay_cut_1,fft_result_output_ay1);
    title(['ay1 FFT ������',blanks(4),num2str(workingcondition),blanks(4),num2str(fs)]);
    xlim([0 1500]); axis normal ;   xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on
 
    %%                  ����az_1                             &&
    az_1 = az_1 - mean(az_1) ; %ȥֱ����Ҳ�ǽ����һ��
    az_lenght_1 = length(az_1);  %�������ݳ���
    fft_az_1 = fft(az_1) ;          %���ٸ���Ҷ�任����
    f_az_1 = 0:fs/(az_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    az_cut_1 = f_az_1(1:round(length(f_az_1)/2));    %ֻ��������Ƶ������
    fft_result_output_az1 = abs((fft_az_1(1:round(length(f_az_1)/2)))/(az_lenght_1)); %FFT��ֵ���
    figure(2);
    subplot(313);
    plot(az_cut_1,fft_result_output_az1);
    title('az1 FFT')
    xlim([0 500]); axis normal ; xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on
    %%              ����ͼƬ              %%
    print(photo_location_a,'-dpdf','-fillpage');
    %%              д�뵥λ              %%
    ax1_label = {'X1'};
    ay1_label = {'Y1'};
    az1_label = {'Z1'};
    accel_unit = {'m*s^(-2)'} ;
    
    %��ʼдƵ��
    xlswrite(FileNameLocation,fr_name,sheet1,'M1');
    xlswrite(FileNameLocation,fr_name,sheet1,'O1');
    xlswrite(FileNameLocation,fr_name,sheet1,'Q1');

    %��ʼд��λ
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'M2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'O2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'Q2');
    
    xlswrite(FileNameLocation,ax1_label,sheet1,'N3');       %дai����
    xlswrite(FileNameLocation,ay1_label,sheet1,'P3');       %дai����
    xlswrite(FileNameLocation,az1_label,sheet1,'R3');       %дai����
    
    %��ʼд��ֵ
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'N1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'P1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'R1');
    
    %��ʼд����ٶȼ�����
    xlswrite(FileNameLocation,ax_cut_1',sheet1,'M4:M32800'); 
    xlswrite(FileNameLocation,fft_result_output_ax1,sheet1,'N4:N32800');    
    xlswrite(FileNameLocation,ay_cut_1',sheet1,'O4:O32800'); 
    xlswrite(FileNameLocation,fft_result_output_ay1,sheet1,'P4:P32800'); 
    xlswrite(FileNameLocation,az_cut_1',sheet1,'Q4:Q32800');   
    xlswrite(FileNameLocation,fft_result_output_az1,sheet1,'R4:R32800'); 
