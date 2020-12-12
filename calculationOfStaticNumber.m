% Version 1 

FileNameLocation = 'CT2_2019_12_03_2_RMS' ; %Specify the experiment condition and use it as the Export File's Name

% Calculation of root mean square
sheet = 1 ;
rmsSection = {'均方根RMS'};
ll = {'时间段长度'};
time = CT2_2019_12_03_2_B ;
l = length(time);
X1_rms = rms(CT2_2019_12_03_2_C) ;
Y1_rms = rms(CT2_2019_12_03_2_D)  ;
Z1_rms =  rms(CT2_2019_12_03_2_E)  ;
P1_rms = rms(CT2_2019_12_03_2_F)  ;
P2_rms = rms(CT2_2019_12_03_2_G) ;
P3_rms =  rms(CT2_2019_12_03_2_H) ;
P4_rms =  rms(CT2_2019_12_03_2_I) ;
P5_rms =  rms(CT2_2019_12_03_2_J) ;
P6_rms =  rms(CT2_2019_12_03_2_K) ;
xlswrite(FileNameLocation,rmsSection,sheet,'K3');
xlswrite(FileNameLocation,ll,sheet,'J1');
xlswrite(FileNameLocation,l,sheet,'J3');
xlswrite(FileNameLocation,X1_rms,sheet,'A3');
xlswrite(FileNameLocation,Y1_rms,sheet,'B3');
xlswrite(FileNameLocation,Z1_rms,sheet,'C3');
xlswrite(FileNameLocation,P1_rms,sheet,'D3');
xlswrite(FileNameLocation,P2_rms,sheet,'E3');
xlswrite(FileNameLocation,P3_rms,sheet,'F3');
xlswrite(FileNameLocation,P4_rms,sheet,'G3');
xlswrite(FileNameLocation,P5_rms,sheet,'H3');
xlswrite(FileNameLocation,P6_rms,sheet,'I3');


%Spectify the name and location of the files saved.ATTENTION, user should
%have the permission of the folder.


% Description of the section and its unit.
x1_label ={'X1'};
y1_label = {'Y1'};
z1_label = {'Z1'};
p1_label = {'P1'};
p2_label = {'P2'};
p3_label = {'P3'};
p4_label = {'P4'};
p5_label = {'P5'};
p6_label = {'P6'};

xlswrite(FileNameLocation,x1_label,sheet,'A1');
xlswrite(FileNameLocation,y1_label,sheet,'B1');
xlswrite(FileNameLocation,z1_label,sheet,'C1');
xlswrite(FileNameLocation,p1_label,sheet,'D1');
xlswrite(FileNameLocation,p2_label,sheet,'E1');
xlswrite(FileNameLocation,p3_label,sheet,'F1');
xlswrite(FileNameLocation,p4_label,sheet,'G1');
xlswrite(FileNameLocation,p5_label,sheet,'H1');
xlswrite(FileNameLocation,p6_label,sheet,'I1');
pressureUnit = {'Pa'};
accelerateUnit = {'m*s-2'};
xlswrite(FileNameLocation,accelerateUnit,sheet,'A2');
xlswrite(FileNameLocation,accelerateUnit,sheet,'B2');
xlswrite(FileNameLocation,accelerateUnit,sheet,'C2');
xlswrite(FileNameLocation,pressureUnit,sheet,'D2');
xlswrite(FileNameLocation,pressureUnit,sheet,'E2');
xlswrite(FileNameLocation,pressureUnit,sheet,'F2');
xlswrite(FileNameLocation,pressureUnit,sheet,'G2');
xlswrite(FileNameLocation,pressureUnit,sheet,'H2');
xlswrite(FileNameLocation,pressureUnit,sheet,'I2');


clear;


