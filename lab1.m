  %% Lab 1
% Melvin Shajee
% BME210-002
% Due: 02/03/23
% load temp.mat

% load ECG1.mat


% variables ecg and temp appear

% ecg variable has 950 rows, 2 columns

% size(ecg)

% size(foobar)

% ecg_signal = ecg(:,2)
% x = linspace(0,950,950)
% plot(x,ecg_signal)

% 5 beats

% 0.1 minutes

% 6 seconds

% time = whatever amount of time

% time = 6

% 13
load temp.mat
load ECG1.mat
ecg_signal = ecg(:,2);
x = linspace(0,6,950);
figure
plot(x,ecg_signal)
ylabel('Magnitude (millivolts)');
xlabel('Time (sec)');
figure
plot(x,ecg_signal,"*b")
ylabel('Magnitude (millivolts)')
xlabel('Time (sec)')
halfECGsignal = ecg_signal/2;
yyaxis right
hold on
plot(x,halfECGsignal,"r")
ylim([0,3])
yyaxis left
xlim([0,7])

