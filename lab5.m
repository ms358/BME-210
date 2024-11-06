%% Question 1
% a.)cos(200πt)
x = linspace(0,3/100);
fx = cos(200*pi*x);
plot(x,fx,"black")
hold on
% b.)
Ts = 0.002;
fs = 1/Ts;
x2 = 0:Ts:3/fs;
fx2 = cos(200*pi*x2);
stem(x2,fx2,"o blue")
% c.)
Ts2 = 0.009;
fs2 = 1/Ts2;
x3 = 0:Ts2:3/fs2;
fx3 = cos(200*pi*x3);
stem(x3,fx3,"o red")
hold off
%% Question 2
% a.)
figure
hold on
Ts = 0.002;
fs = 1/Ts;
x2 = 0:Ts:3/fs;
fx2 = cos(200*pi*x2);
stem(x2,fx2,"o blue")
Ts2 = 0.009;
fs2 = 1/Ts2;
x3 = 0:Ts2:3/fs2;
fx3 = cos(200*pi*x3);
stem(x3,fx3,"o red")
% b.)
treconstructed = linspace(0,3/100,1000);
y = zeros(size(treconstructed));
fy = fs2/2; %fy = 55.56 Hz
n2 = 0:length(x3)-1;
for n = n2
y = y + x3(n+1)*sin(2*pi*fy*(treconstructed-n*Ts2));
end
plot(treconstructed, y, 'black')
% c.)
treconstructed2 = linspace(0,3/100,1000);
y2 = zeros(size(treconstructed2));
fy2 = 100;
n2 = 0:length(x2)-1;
for n = n2
    y2 = y2 + x2(n+1)*sin(2*pi*fy2*(treconstructed2-n*Ts));
end
plot(treconstructed2, y2, 'magenta')
% d.) The signal can't be reconstructed acurrately because it is under
% sampled.
%% Question 3
% a.)
load ECG1.mat
% b.)
N = length(ecg);
ECG = fft(ecg(:,2))/N;
f = (0:N-1)/N;
P = abs(ECG).^2;
plot(f, P);
% c.)
t = (0:1/1000:1);
t = t(:,1:950)';
noise1 = 2*cos(2*pi*300*t);
noise2 = 2*cos(2*pi*2.5*t);
ECGwithnoise = ecg(:,2) + noise1 + noise2;
% d.)
figure
plot(t, ecg(:,2))
hold on
plot(t, ecg_noise)
legend('ECG', 'Noisy ECG')
hold off
% e.)
ECGwithnoise= fft(ecg_noise);
n_noise = length(ECGwithnoise);
f_noise = (0:n_noise-1)*(Fs/n);
power_noise = abs(ECGwithnoise).^2/n_noise;
figure
subplot(2,1,1)
plot(f,power)
xlabel('Frequency');
ylabel('Power');
title('Original ECG');

subplot(2,1,2)
plot(f_noise,power_noise,'r')
xlabel('Frequency');
ylabel('Power');
title('Noisy ECG'); 
% f.)
Wn = 0.4;
N = 300;
a = fir1(N,Wn);
filteredsignal = filtfilt(a,1,ecg_noise);
% g.)
figure
plot(t,filteredsignal)
xlabel('Time')
ylabel('Amplitude')
title('Noisy ECG after low-pass')
% h.)
Wn2 = 0.015;
N2 = 300;
a2 = fir1(N2,Wn2,'high');
filteredsignal2 = filtfilt(a2,1,filteredsignal);
% i.)
figure
plot(t,filteredsignal2)
xlabel('Time')
ylabel('Amplitude')
title('Noisy ECG after low-pass and high-pass')
hold on
plot(t, ecg(:,2))
legend('Filtered','Original')