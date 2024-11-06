%% Lab 5
% BME210
% Bryan Xavier
%% Question 1 
% (a)
clc; clear; close all
f = 100;
T = 1/f;
t = linspace(0,3*T,1000);
x = cos(200*pi*t);
figure
plot(t,x,'k')
title('t vs x')
xlabel('Time(s)')
ylabel('Amplitude')
hold on
% Plots 3 periods of desired sinosuidal signal
% (b)
Ts = 0.002;
t = 0:Ts:3*T;
Fo = 100;
xn = cos(2*pi*Fo*t);
stem(t, xn,'bl');
% Samples the sinosuidal signal at a sampling period of 0.002 using stem
% plots
% (c)
Ts = 0.009;
t = 0:Ts:3*T;
Fo = 100;
xn = cos(2*pi*Fo*t);
stem(t, xn,'r');
% Samples the sinosuidal signal at a sampling period of 0.009 using stem
% plots
legend('Original Signal','Sampling Period = 0.002', 'Sampling period = 0.009')
%% Question 2
clc; clear; close all
fmax = 100;
T = 1/fmax;
Ts1 = 0.009;
Ts2 = 0.002;
t = linspace(0,3*T,1000);
%(a)
t1 = 0:Ts2:3*T;
xn = cos(2*pi*fmax*t1);
stem(t1, xn,'bl');
hold on
t2 = 0:Ts1:3*T;
xn = cos(2*pi*fmax*t2);
stem(t2, xn,'r');
title('Sample back to original')
xlabel('Time(s)')
ylabel('Amplitude')
%plots the two sampled sinosuidal waves using stem plots
%(b)
w1 = 2*100;
fs1 = 1/Ts1;
wp1 = w1/fs1;
wp1 = -pi*(wp1-2);
w1 = wp1*fs1;
x1 = cos(w1*t);
plot(t,x1)
%Recontructed sinosudial wave using 0.009 sampling period
%(c)
w2 = 2*100;
fs2 = 1/Ts2;
wp2 = w2/fs2;
w2 = wp2*pi*fs2;
x2 = cos(w2*t);
plot(t,x2)
%Recontructed sinosudial wave using 0.002 sampling period
legend('Ts = 0.009','Ts = 0.002', 'Reconstructed signal using Ts = 0.009','Reconstructed signal using Ts = 0.002')
%(d)
%Undersampling causes a signal that has som of the points on the orginal function 
% but the signal sampling isn't happening fast enough to recreate the
% signal, your undersampled signal will then have different peaks and
% periods and not fit the curve
%% Question 3
clc; clear; close all;
%(a)
load ECG1.mat
%(b)
Fs=1000;
Ecg = fft(ecg(:,2));
n = length(Ecg);
f = (0:n-1)*(Fs/n);
power = abs(Ecg).^2/n;
plot(f,power)
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum of Original ECG Signal');
%Creates power spectrum of Ecg signal
%(c)
t = (0:1/Fs:1);
t = t(:,1:950)';
noise1 = 2*cos(2*pi*300*t);
noise2 = 2*cos(2*pi*2.5*t);
ecg_noise = ecg(:,2) + noise1 + noise2;
%Adds noise to the sample
% (d)
figure
plot(t, ecg(:,2))
hold on
plot(t, ecg_noise)
title("Ecg vs Noisy Ecg")
xlabel('Time(s)')
ylabel('Amplitude')
legend('Orginial Ecg', 'Noisy Ecg')
hold off
%Plots ecg signal ontop of ecg signal with noise for comparison 
%(e)
Ecg_noise = fft(ecg_noise);
n_noise = length(Ecg_noise);
f_noise = (0:n_noise-1)*(Fs/n);
power_noise = abs(Ecg_noise).^2/n_noise;
figure
subplot(2,1,1)
plot(f,power)
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum of Original ECG');

subplot(2,1,2)
plot(f_noise,power_noise,'r')
xlabel('Frequency (Hz)');
ylabel('Power');
title('Power Spectrum of Noisy ECG Signals');
% Plots both power spectrum of ecg signal and ecg signal with noise 
%(f)
Wn = 0.4;
N = 300;
a = fir1(N,Wn);
filteredsignal = filtfilt(a,1,ecg_noise);
%Filters ecg signal with noise through a low pass filter
%(g)
figure
plot(t,filteredsignal)
xlabel('Time(s)')
ylabel('Amplitude')
title('Noisy Ecg signal after low-pass filter')
%Plots ecg signal after being put through a low pass filter
%(h)
Wn2 = 0.015;
N2 = 300;
a2 = fir1(N2,Wn2,'high');
filteredsignal2 = filtfilt(a2,1,filteredsignal);
%Filters ecg signal with noise(after being put through a low pass filter) through a high pass filter
%(i)
figure
plot(t,filteredsignal2)
xlabel('Time(s)')
ylabel('Amplitude')
title('Noisy Ecg signal after low-pass filter and high-pass filter')
hold on
plot(t, ecg(:,2))
legend('Filtered signal','Original signal')
%Plots ecg signal after being put through a low pass filter and high pass
%filter