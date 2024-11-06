% Lab 2
% Melvin Shajee
% BME210-002
% Due: 02/10/23
clear all
load ECG1.mat
ecgraw = ecg(:,2);
Run_Ave_Length = 5;
% disp(ecgraw(1:5)). The values are 0.0502, 0.0446, 0.0395, 0.0373, 0.0380
% help mean
ecgMean = mean(ecgraw(1:5)); % The mean is 0.0419

for i = 1:5
    ECGMovingMean5(1,i) = mean(ecgraw(i:(i+4)));
    i = i + 1;
end
figure
plot(ecgraw((1:5),1),ECGMovingMean5,"r*")
ylim([0 1]);

for i = 5:944
    ECGMovingMean5(1,i) = mean(ecgraw(i:(i+5)));
    i = i + 1;
end
figure
plot(1:944,ECGMovingMean5,"r-",1:944,ecgraw(1:944),"b-")
hold on
% The peaks got shorter because they were averaged

for i = 1:925
    ECGMovingMean5(1,i) = mean(ecgraw(i:(i+Run_Ave_Length)));
    i = i + 1;
end
Run_Ave_Length = 25;
for i = 1:925
ECGMovingMean25(1,i) = mean(ecgraw(i:i+25));
end
plot(1:925,ECGMovingMean25,"g")
hold off
% The peaks got even shorter because it was being averaged over more
% values.
i = 1;
while i <= 945
    ECGWhileMean(1,i) = mean(ecgraw(i:(i+5)));
    i = i + 1;
end
figure
plot(ecgraw(1:945,1),ECGWhileMean)