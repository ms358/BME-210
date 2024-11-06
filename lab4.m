%% Question 1
% sampling periods
ts1 = 0.005;
ts2 = 0.0025;
ts3 = 0.0005;

% period of signal
T = 1/30;

% defining time vectors and plotting for 1
t1 = 0:ts1:T*3;
z1 = 20*cos(2*pi*(30)*t1-0.3*pi);
plot(t1,real(z1),"b");
grid on
hold on

% defining time vectors and plotting for 2

t2 = 0:ts2:T*3;
z2 = 20*cos(2*pi*(30)*t2-0.3*pi);
plot(t2,real(z2),"r*");

% defining time vectors and plotting for 3

t3 = 0:ts3:T*3;
z3 = 20*cos(2*pi*(30)*t3-0.3*pi);
plot(t3,real(z3),"g--");
legend("0.005","0.0025","0.0005")
hold off

%% Question 2
% adding sinusoids 𝑥1(𝑡) = 1.7cos (20𝜋𝑡 + 70𝜋/180) and 𝑥2(𝑡) = 1.9cos (20𝜋𝑡 + 200𝜋/180).
t1 = linspace(0,0.3,1000);
x1 = 1.7*cos(20*pi*t1+(70*pi/180));
y1 = real(x1);
figure
subplot(3,1,1)
plot(t1,y1)
title("Signal X1")

t2 = linspace(0,0.3,1000);
x2 = 1.9*cos(20*pi*t2 + 200*pi/180);
y2 = real(x2);
subplot(3,1,2)
plot(t2,y2)
title("Signal X2")

t3 = linspace(0,0.3,1000);
y3 = y1 + y2;
subplot(3,1,3);
plot(t3,y3);
title("Signal X3")

%% Question 3
% Plot spectrum of sinusoids (bar, instead of stem plot please)
tt = -10:0.01:10; %time is in seconds
kk=2;
zz = kk*cos(kk*tt);
kk=4;
zz = zz + kk*cos(kk*tt - pi/3);
kk=6;
zz = zz + real(2*exp(j*pi/4)*exp(j*kk*tt));

% a) Write a formula for z(t) in terms of sinusoids in standard form, that is, z(t)= A0 + ∑k Ak cos(ωkt +φk)
% z(t) = 2*cos(2*pi*t) + 4*cos(4*pi*t - π/3) + 2*cos(6*pi*t + pi/4)

% b
freq=[-6,-4,-2,2,4,6];
signal=[exp(-j*pi/4) 2*exp(j*(pi/3)) 1 1 2*exp(-j*pi/3) exp(j*(pi/4))];
figure
bar(freq,abs(signal),0.03)
labels=["exp(-j*pi/4)" "2*exp(j*(pi/3))" "1" "1" "2*exp(-j*pi/3)" "exp(j*(pi/4))"];
%using for loop to label all the complex amplitudes
for i=1:length(freq)
xpos=freq(i);
ypos=abs(signal(i));
llabels=labels(i);
text(xpos,ypos,llabels)
end
xlabel('Angular frequency w(rad/s)')

%% Question 4

Mag = [8 12.434 10.775 9.121 8.77 10.053 12.066 13.924 15.069 15.143 14.021 11.911 9.361 7.112 5.732 5.121 4.701 4.115 3.3 2.283 1.129 0.555 1.489 2.250 2.540 2.349];
Phase =[0 0.912 1.769 2.513 3.165 3.902 4.80 5.799 0.533 1.593 2.610 3.585 4.489 5.295 6.029 0.531 1.459 2.519 3.670 4.886 6.261 2.713 4.555 5.745 0.545 1.579];
f0 = 1.2;
t0 = 1/f0;
t = linspace(0,3*t0,1000);
DC = Mag(1)/2;
N = [3 10 25];
figure
for i = 1: length(N)
    n = N(i);
    a = DC;
    for k = 1:n
        a = a + Mag(1+k)*cos(2*pi*f0*k*t-Phase(k+1));
    end
    subplot(3,1,i)
    plot(t,a)
    xlabel('Time')
    ylabel('Magnitude')
    title(sprintf('Signal with %d terms',n))
end