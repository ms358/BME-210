%% HW 4            
% Melvin Shajee    
% BME210-002       
% Due:02/17/23

%% in class assignment 1
ires = 0;
for index = -18:18
    ires = ires +1;
end
% ires = 37
% 37 loops
ires = 0;
for index = 14:-2:5
    if index == 10
        continue
    end
    ires = ires + index;
end
%ires = 40
% 5 loops
ires = 0;
for index = 14:-2:5
    if index == 10
        break
    end
    ires = ires + index
end
    % ires = 26
% 3 loops
ires = 0;
for index1 = 14:-2:5
    for index2 = 6:2:index1
        if index2 == 10
            break
        end
        index1;
        index2;
        ires = ires + index2;
    end
end
% ires = 62
% 5 and 12 loops

%% in class example 3
% Write a program that allows you to specify the name of an input data set 
% and the number of samples to average in the filter and then performs a 
% running average filter on the data. The program should plot both the 
% original data and the smoothed curve after the running average filter.
load noisyecg.mat
n = input("Enter the amount of numbers to average by:");

% plot data
plot (1:2000,noisyECG_withTrend)

% plot averaged data
i = 0;
for i = 1:2000-n
    ECGMovingMeanN(1,i) = mean(noisyECG_withTrend(i:(i+n)));
    i = i + 1;
end
figure
plot(noisyECG_withTrend((1:2000-n),1),ECGMovingMeanN,"r*")

%% in class example 4
% Write a program that allows you to specify the name of an input data set, 
% type of filter (average or median) and the number of samples to use in 
% the filter and then performs a median filter on the data. The program 
% should plot both the original data and the smoothed curve after the 
% median filter.
load noisyECG.mat
filtermethod = input("Do you want to do a median or average filter? (Type 'median' for median or 'average' for average):","s");
disp(filtermethod)
if lower(filtermethod) == 'median'
    window = input("Moving median of how many numbers?");
    halfwin = floor(window/2);
        for i = 1:length(s)
            if i-halfwin <= 0
               movingmedave(i)=median(s(1:i+halfwin)); 
            elseif i+halfwin > length(s)
                movingmedave(i)=median(s(i-halfwin:end));
            else
            movingmedave(i)=median(s(i-halfwin:i+halfwin));
            end
        end
        figure
        plot(s)
        hold on
        plot(movingmedave)
        hold off
elseif lower(choice) == 'average'
            window = input("Moving average of how many numbers?");
        halfwin = floor(window/2);
        for i = 1:length(s)  
            if i-halfwin <= 0  
               movingmedave(i)=mean(s(1:i+halfwin)); 
            elseif i+halfwin > length(s)
                movingmedave(i)=mean(s(i-halfwin:end));
            else
            movingmedave(i)=mean(s(i-halfwin:i+halfwin)); 
            end 
        end
        figure
        plot(s)
        hold on
        plot(movingmedave)
        hold off
else 
    disp("Please type 'median' for median or 'average' for average.")
end 

%% in class example 5
% Modify the traffic light program developed in this 
% example to create a table of traffic light colors in 
% each direction as a function of time at 1 
% second intervals for time 0 ≤ t < 120 s.
%  Script file: traffic_light.m
%
%  Purpose: 
%    This program calculates the color of traffic
%    lights as a function of time. 
%
%  Record of revisions:
%      Date       Programmer          Description of change
%      ====       ==========          =====================
%    01/18/18    S. J. Chapman        Original code 
%
% Define variables:
%   time      -- Time in seconds

% Prompt the user for the time.
time = input('Enter the time in seconds: ');
 
% Calculate thet status of the lights and tell the user
for index = 1:121
    time = index - 1;
    if time < 0 
        disp(['ERROR: time out of bounds!']);
    elseif time <= 56
        disp(['East-West road light is Green']);
        disp(['North-South road light is Red']);
    elseif time <= 60
        disp(['East-West road light is Yellow']);
        disp(['North-South road light is Red']);
    elseif time <= 116
        disp(['East-West road light is Red']);
        disp(['North-South road light is Green']);
    elseif time <= 120
        disp(['East-West road light is Red']);
        disp(['North-South road light is Yellow']);
    else
        disp(['ERROR: time out of bounds!']);
    end    
end

%% in class example 6
% Write a program that calculates and 
% plots the area of the rectangle as its width is varied 
% from the smallest possible value to the largest 
% possible value. 
totalperimeter = 30;
for width = 0:1:totalperimeter/2;
    for height = 0:1:totalperimeter/2;
        if 2*width + 2*height <= totalperimeter && width * height ~= 0
            area = width * height;
            plot(width,area,'b*')
            hold on
        end
    end
end
