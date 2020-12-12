%���ڼ��㸵��Ҷ�任�͹����ס������ݵ�ǰ����ֻ��ȥֱ�����ѡ�

function [x_cut_1,fft_result_output_1] = sfft22(workingcondition,sheet1,FileNameLocation,fx,fy,fz,fs,sample1,sample2,sample3,sample4,sample5,sample6,ax_1,ay_1,az_1,ax_2,ay_2,az_2,ax_3,ay_3,az_3) 

%fsΪ����Ƶ��,��λHz;
%sampleΪ�������źţ�������������Ϊż��������Ҳ���ǲ����Թ�����;
%�汾Beta1������Xuxu;
%2019��12��16�� �����д;
    cutime = cputime ; %��¼����ʱ��

%%        ��������ѹ������    %%
%%        ����Sample 1     %%
    sample1 = sample1 - mean(sample1) ; %ȥֱ����Ҳ�ǽ����һ��
    N = length(sample1);  %�������ݳ���
    fft_cal_1 = fft(sample1)/N ;          %���ٸ���eҶ�任����
    f = 0:fs/(N-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_1 = f(1:length(f)/2);    %ֻ��������Ƶ������
    fft_cal_1 = fft_cal_1.^	2 ;
    fft_result_output_1 = abs((fft_cal_1(1:length(f)/2))); %FFT��ֵ���
    plot(x_cut_1,fft_result_output_1,'k');
    title(['P1 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; xlabel('Ƶ��','FontWeight','bold');     ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p1','-djpeg');
    
    %%               ��ʼ����Sample 2-����һģһ��               %%
    sample2 = sample2 - mean(sample2) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_2 = length(sample2);  %�������ݳ���
    fft_cal_2 = fft(sample2)/sample_lenght_2 ;          %���ٸ���Ҷ�任����
    f_x_2 = 0:fs/(sample_lenght_2-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_2 = f_x_2(1:length(f_x_2)/2);    %ֻ��������Ƶ������
    fft_cal_2 = fft_cal_2.^2/sample_lenght_2 ;
    fft_result_output_2 = abs((fft_cal_2(1:length(f_x_2)/2))); %FFT��ֵ���
    plot(x_cut_2,fft_result_output_2,'k');
    title(['P2 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; 
    xlabel('Ƶ��','FontWeight','bold');
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p2','-djpeg');

    %%               ����Sample3               %%
    sample3 = sample3 - mean(sample3) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_3 = length(sample3);  %�������ݳ���
    fft_cal_3 = fft(sample3) / sample_lenght_3 ;          %���ٸ���Ҷ�任����
    f_x_3 = 0:fs/(sample_lenght_3-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_3 = f_x_3(1:length(f_x_3)/2);    %ֻ��������Ƶ������
    fft_cal_3 = fft_cal_3.^2/sample_lenght_3 ;
    fft_result_output_3 = abs((fft_cal_3(1:length(f_x_3)/2))); %FFT��ֵ���
    plot(x_cut_3,fft_result_output_3,'k');
    title(['P3 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; 
    xlabel('Ƶ��','FontWeight','bold');
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p3','-djpeg');
    %%               ����Sample4               %%
    sample4 = sample4 - mean(sample4) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_4 = length(sample4);  %�������ݳ���
    fft_cal_4 = fft(sample4) /sample_lenght_4 ;          %���ٸ���Ҷ�任����
    f_x_4 = 0:fs/(sample_lenght_4-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_4 = f_x_4(1:length(f_x_4)/2);    %ֻ��������Ƶ������
    fft_cal_4 = fft_cal_4.^2/sample_lenght_4 ;
    fft_result_output_4 = abs((fft_cal_4(1:length(f_x_4)/2))); %FFT��ֵ���
    plot(x_cut_4,fft_result_output_4,'k');
    title(['P4 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; 
    xlabel('Ƶ��','FontWeight','bold');
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p4','-djpeg');
    
    %%               ����Sample5               %%
      
    sample5 = sample5 - mean(sample5) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_5 = length(sample5);  %�������ݳ���
    fft_cal_5 = fft(sample5) / sample_lenght_5 ;          %���ٸ���Ҷ�任����
    f_x_5 = 0:fs/(sample_lenght_5-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_5 = f_x_5(1:length(f_x_5)/2);    %ֻ��������Ƶ������
    fft_cal_5 = fft_cal_5.^2/sample_lenght_5 ;
    fft_result_output_5 = abs((fft_cal_5(1:length(f_x_5)/2))); %FFT��ֵ���
    plot(x_cut_5,fft_result_output_5,'k');
    title(['P5 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; 
    xlabel('Ƶ��','FontWeight','bold');
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p5','-djpeg');
    
    %%              ����Sample6              %%
    sample6 = sample6 - mean(sample6) ; %ȥֱ����Ҳ�ǽ����һ��
    sample_lenght_6 = length(sample6);  %�������ݳ���
    fft_cal_6 = fft(sample6) / sample_lenght_6 ;          %���ٸ���Ҷ�任����
    f_x_6 = 0:fs/(sample_lenght_6-1):fs ;            %����Ҷ�任��Ƶ��
    x_cut_6 = f_x_6(1:length(f_x_6)/2);    %ֻ��������Ƶ������
    fft_cal_6 = fft_cal_6.^2/sample_lenght_6 ;
    fft_result_output_6 = abs((fft_cal_6(1:length(f_x_6)/2))); %FFT��ֵ���
    plot(x_cut_6,fft_result_output_6,'k');
    title(['P6 ������',blanks(1),num2str(workingcondition)]);
    axis normal ; 
    xlabel('Ƶ��','FontWeight','bold');
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('p6','-djpeg');

    %%                   ����ѹ����������                %%
    fr_name = {'Ƶ��'} ;
    ampltidu_unit = {'��ֵ'};
%     psd_unit = {'������'};
    p1_label = {'P1'};
    p2_label = {'P2'};
    p3_label = {'P3'};
    p4_label = {'P4'};
    p5_label = {'P5'};
    p6_label = {'P6'};
%   long_unit = {'DataLength'};

    progressss = "�������������ݣ���ʼд�����ݵ�Excel" 
tic
    %%               д��Excel�ļ���             %%
    tic ;
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
toc
    
    progressss = "�������������ݣ���ʼ������ٶ�����" 

    %%                  ��ʼ������ٶ�����                     &&
    %%                  ����ax_1                             &&
    ax_1 = ax_1 - mean(ax_1) ; %ȥֱ����Ҳ�ǽ����һ��
    ax_lenght_1 = length(ax_1);  %�������ݳ���
    fft_ax_1 = fft(ax_1);          %���ٸ���Ҷ�任����
    f_ax_1 = 0:fs/(ax_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    ax_cut_1 = f_ax_1(1:length(f_ax_1)/2);    %ֻ��������Ƶ������
    fft_ax_1 = fft_ax_1.^2/ax_lenght_1 ;
    fft_result_output_ax1 = abs((fft_ax_1(1:length(f_ax_1)/2))) ;%FFT��ֵ���
    plot(ax_cut_1,fft_result_output_ax1,'k');
    title(['��1 �񶯹�����',blanks(2),'x����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    
    
    print('ax1','-djpeg');
     %%                  ����ax_2                             &&
    ax_2 = ax_2 - mean(ax_2) ; %ȥֱ����Ҳ�ǽ����һ��
    ax_lenght_2 = length(ax_2);  %�������ݳ���
    fft_ax_2 = fft(ax_2);          %���ٸ���Ҷ�任����
    f_ax_2 = 0:fs/(ax_lenght_2-1):fs ;            %����Ҷ�任��Ƶ��
    ax_cut_2 = f_ax_2(1:length(f_ax_2)/2);    %ֻ��������Ƶ������
    fft_ax_2 = fft_ax_2.^2/ax_lenght_2 ;
    fft_result_output_ax2 = abs((fft_ax_2(1:length(f_ax_2)/2))) ;%FFT��ֵ���
    plot(ax_cut_2,fft_result_output_ax2,'k');
    title(['��2 �񶯹�����',blanks(2),'x����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('ax2','-djpeg');

 %%                  ����ax_3                             &&
    ax_3 = ax_3 - mean(ax_3) ; %ȥֱ����Ҳ�ǽ����һ��
    ax_lenght_3 = length(ax_3);  %�������ݳ���
    fft_ax_3 = fft(ax_3);          %���ٸ���Ҷ�任����
    f_ax_3 = 0:fs/(ax_lenght_3-1):fs ;            %����Ҷ�任��Ƶ��
    ax_cut_3 = f_ax_3(1:length(f_ax_3)/2);    %ֻ��������Ƶ������
    fft_ax_3 = fft_ax_3.^2/ax_lenght_3 ;
    fft_result_output_ax3 = abs((fft_ax_3(1:length(f_ax_3)/2))) ;%FFT��ֵ���
    plot(ax_cut_3,fft_result_output_ax3,'k');
    title(['��3 �񶯹�����',blanks(2),'x����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('ax3','-djpeg');
    %%                  ����ay_1                             &&
    ay_1 = ay_1 - mean(ay_1) ; %ȥֱ����Ҳ�ǽ����һ��
    ay_lenght_1 = length(ay_1);  %�������ݳ���
    fft_ay_1 = fft(ay_1);          %���ٸ���Ҷ�任����
    f_ay_1 = 0:fs/(ay_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    ay_cut_1 = f_ay_1(1:length(f_ay_1)/2);    %ֻ��������Ƶ������
    fft_ay_1 = fft_ay_1.^2/ay_lenght_1 ;
    fft_result_output_ay1 = abs((fft_ay_1(1:length(f_ay_1)/2))) ;%FFT��ֵ���
    plot(ay_cut_1,fft_result_output_ay1,'k');
    title(['��1 �񶯹�����',blanks(2),'y����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('ay1','-djpeg');
 
   %%                  ����ay_2                             &&
    
    ay_2 = ay_2 - mean(ay_2) ; %ȥֱ����Ҳ�ǽ����һ��
    ay_lenght_2 = length(ay_2);  %�������ݳ���
    fft_ay_2 = fft(ay_2);          %���ٸ���Ҷ�任����
    f_ay_2 = 0:fs/(ay_lenght_2-1):fs ;            %����Ҷ�任��Ƶ��
    ay_cut_2 = f_ay_2(1:length(f_ay_2)/2);    %ֻ��������Ƶ������
    fft_ay_2 = fft_ay_2.^2/ay_lenght_2 ;
    fft_result_output_ay2 = abs((fft_ay_2(1:length(f_ay_2)/2))) ;%FFT��ֵ���
    plot(ay_cut_2,fft_result_output_ay2,'k');
    title(['��2 �񶯹�����',blanks(2),'y����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('ay2','-djpeg');
    
      %%                  ����ay_3                             &&
    
    ay_3 = ay_3 - mean(ay_3) ; %ȥֱ����Ҳ�ǽ����һ��
    ay_lenght_3 = length(ay_3);  %�������ݳ���
    fft_ay_3 = fft(ay_3);          %���ٸ���Ҷ�任����
    f_ay_3 = 0:fs/(ay_lenght_3-1):fs ;            %����Ҷ�任��Ƶ��
    ay_cut_3 = f_ay_3(1:length(f_ay_3)/2);    %ֻ��������Ƶ������
    fft_ay_3 = fft_ay_3.^2/ay_lenght_3 ;
    fft_result_output_ay3 = abs((fft_ay_3(1:length(f_ay_3)/2))) ;%FFT��ֵ���
    plot(ay_cut_3,fft_result_output_ay3,'k');
    title(['��3 �񶯹�����',blanks(2),'y����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('ay3','-djpeg');
    
    %% az1              %%
    az_1 = az_1 - mean(az_1) ; %ȥֱ����Ҳ�ǽ����һ��
    az_lenght_1 = length(az_1);  %�������ݳ���
    fft_az_1 = fft(az_1);          %���ٸ���Ҷ�任����
    f_az_1 = 0:fs/(az_lenght_1-1):fs ;            %����Ҷ�任��Ƶ��
    az_cut_1 = f_az_1(1:length(f_az_1)/2);    %ֻ��������Ƶ������
    fft_az_1 = fft_az_1.^2/az_lenght_1 ;
    fft_result_output_az1 = abs((fft_az_1(1:length(f_az_1)/2))) ;%FFT��ֵ���
    plot(az_cut_1,fft_result_output_az1,'k');
    title(['��1 �񶯹�����',blanks(2),'z����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('az1','-djpeg');
    
    %% az2              %%
	az_2 = az_2 - mean(az_2) ; %ȥֱ����Ҳ�ǽ����һ��
    az_lenght_2 = length(az_2);  %�������ݳ���
    fft_az_2 = fft(az_2);          %���ٸ���Ҷ�任����
    f_az_2 = 0:fs/(az_lenght_2-1):fs ;            %����Ҷ�任��Ƶ��
    az_cut_2 = f_az_2(1:length(f_az_2)/2);    %ֻ��������Ƶ������
    fft_az_2 = fft_az_2.^2/az_lenght_2 ;
    fft_result_output_az2 = abs((fft_az_2(1:length(f_az_2)/2))) ;%FFT��ֵ���
    plot(az_cut_2,fft_result_output_az2,'k');
    title(['��2 �񶯹�����',blanks(2),'z����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('az2','-djpeg');    
    
    
    %% az3              %%
    az_3 = az_3 - mean(az_3) ; %ȥֱ����Ҳ�ǽ����һ��
    az_lenght_3 = length(az_3);  %�������ݳ���
    fft_az_3 = fft(az_3);          %���ٸ���Ҷ�任����
    f_az_3 = 0:fs/(az_lenght_3-1):fs ;            %����Ҷ�任��Ƶ��
    az_cut_3 = f_az_3(1:length(f_az_3)/2);    %ֻ��������Ƶ������
    fft_az_3 = fft_az_3.^2/az_lenght_3 ;
    fft_result_output_az3 = abs((fft_az_3(1:length(f_az_3)/2))) ;%FFT��ֵ���
    plot(az_cut_3,fft_result_output_az3,'k');
    title(['��3 �񶯹�����',blanks(2),'z����',blanks(2),num2str(workingcondition)]);
    axis normal ;   
    xlabel('Ƶ��','FontWeight','bold');     
    ylabel('��ֵ','FontWeight','bold');
    grid on
    print('az3','-djpeg');    
    
    
    
    progressss = "��������ٶ����ݣ���ʼд��Excel���"    
    
tic ;
 
    %%              д�뵥λ              %%
    ax1_label = {'X1'};
    ay1_label = {'Y1'};
    az1_label = {'Z1'};
    
    ax2_label = {'X2'};
    ay2_label = {'Y2'};
    az2_label = {'Z2'};
    
    ax3_label = {'X3'};
    ay3_label = {'Y3'};
    az3_label = {'Z3'};    
%   accel_unit = {'m*s^(-2)'} ;
    
    %��ʼдƵ��
    xlswrite(FileNameLocation,fr_name,sheet1,'M1');
    xlswrite(FileNameLocation,fr_name,sheet1,'O1');
    xlswrite(FileNameLocation,fr_name,sheet1,'Q1');
    xlswrite(FileNameLocation,fr_name,sheet1,'S1');
    xlswrite(FileNameLocation,fr_name,sheet1,'U1');
    xlswrite(FileNameLocation,fr_name,sheet1,'W1');
    xlswrite(FileNameLocation,fr_name,sheet1,'Y1');
    xlswrite(FileNameLocation,fr_name,sheet1,'AA1');
    xlswrite(FileNameLocation,fr_name,sheet1,'AC1');
  
    %��ʼд��λ
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'M2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'O2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'Q2');
    
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'S2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'U2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'W2');   
    
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'Y2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'AA2');
    xlswrite(FileNameLocation,frequencyUnit,sheet1,'AC2');
    
    %��ʼдZi
    xlswrite(FileNameLocation,ax1_label,sheet1,'N3');      
    xlswrite(FileNameLocation,ay1_label,sheet1,'P3');       
    xlswrite(FileNameLocation,az1_label,sheet1,'R3');    
    
    xlswrite(FileNameLocation,ax2_label,sheet1,'S3');      
    xlswrite(FileNameLocation,ay2_label,sheet1,'U3');       
    xlswrite(FileNameLocation,az2_label,sheet1,'W3');    
    
    xlswrite(FileNameLocation,ax3_label,sheet1,'Y3');      
    xlswrite(FileNameLocation,ay3_label,sheet1,'AA3');       
    xlswrite(FileNameLocation,az3_label,sheet1,'AC3');       
    
    %��ʼд��ֵ
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'N1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'P1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'R1');
    
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'T1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'V1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'X1');   
    
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'Z1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'AB1');
    xlswrite(FileNameLocation,ampltidu_unit,sheet1,'AD1');    
    %��ʼд����ٶȼ�����
    xlswrite(FileNameLocation,ax_cut_1',sheet1,'M4:M32800'); 
    xlswrite(FileNameLocation,fft_result_output_ax1,sheet1,'N4:N32800');    
    xlswrite(FileNameLocation,ay_cut_1',sheet1,'O4:O32800'); 
    xlswrite(FileNameLocation,fft_result_output_ay1,sheet1,'P4:P32800'); 
    xlswrite(FileNameLocation,az_cut_1',sheet1,'Q4:Q32800');   
    xlswrite(FileNameLocation,fft_result_output_az1,sheet1,'R4:R32800'); 
    
    xlswrite(FileNameLocation,ax_cut_2',sheet1,'S4:S32800'); 
    xlswrite(FileNameLocation,fft_result_output_ax2,sheet1,'T4:T32800');    
    xlswrite(FileNameLocation,ay_cut_2',sheet1,'U4:U32800'); 
    xlswrite(FileNameLocation,fft_result_output_ay2,sheet1,'V4:V32800'); 
    xlswrite(FileNameLocation,az_cut_2',sheet1,'W4:W32800');   
    xlswrite(FileNameLocation,fft_result_output_az2,sheet1,'X4:X32800'); 
    
    xlswrite(FileNameLocation,ax_cut_3',sheet1,'Y4:Y32800'); 
    xlswrite(FileNameLocation,fft_result_output_ax3,sheet1,'Z4:Z32800');    
    xlswrite(FileNameLocation,ay_cut_3',sheet1,'AA4:AA32800'); 
    xlswrite(FileNameLocation,fft_result_output_ay3,sheet1,'AB4:AB32800'); 
    xlswrite(FileNameLocation,az_cut_3',sheet1,'AC4:AC32800');   
    xlswrite(FileNameLocation,fft_result_output_az3,sheet1,'AD4:AD32800');     
    
toc
    
    Progress = '���' ;
    last_time = cputime - cutime;
    last_time = num2str(last_time);
    prgresstime = (['��ɣ�����ʱ��:',last_time,'��',blanks(4),'�������',datestr(now)])



