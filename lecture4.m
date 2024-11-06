% in class assignment 1
ires = 0;
for index = -18:18
    ires = ires +1;
end
% ires = 37
% 37 loops
ires = 0;
for index = 14:-2:5
end

% in class example 3
load noisyecg.mat
n = input("Enter the amount of numbers to average by:");

%plot the original data
plot (1:2000,noisyECG_withTrend)

%plot the averaged data
i = 0;
for i = 1:2000-n
    ECGMovingMeanN(1,i) = mean(noisyECG_withTrend(i:(i+n)));
    i = i + 1;
end
figure
plot(noisyECG_withTrend((1:5),1),ECGMovingMeanN,"r*")

%in class example 4
asubind = [n - halfwin, n + halfwin];
if asubind(1) <= 0 % Beginning condition
asub = raw(1:asubind(2)); %Ignores the beginning       
%part of the window and defaults to 1
filtered(n) = median(asub);
elseif asubind(2) >= length(raw) % End condition
asub = raw(asubind(1):end); %Ignores the end part 
of the window and defaults to last index value
filtered(n) = median(asub);
else % Middle condition
asub = raw(asubind(1):asubind(2));
filtered(n) = median(asub);
end

%in class example 5
for index = 1:121
    time = index - 1;
    if time <= 56
        disp(['East-West road light is Green']);
        disp(['North-South road light is Red']);
        Data(index).time = time;
        Data(index).EastWest = 'Green';
        Data(index).NorthSouth = 'Red';
    elseif time <= 60
        disp(['East-West road light is Yellow']);
        disp(['North-South road light is Red']);
        Data(index).time = time;
        Data(index).EastWest = 'Yellow';
        Data(index).NorthSouth = 'Red';
    elseif time <= 116
        disp(['East-West road light is Red']);
        disp(['North-South road light is Green']);
        Data(index).time = time;
        Data(index).EastWest = 'Red';
        Data(index).NorthSouth = 'Green';
    elseif time <= 120
        disp(['East-West road light is Red']);
        disp(['North-South road light is Yellow']);
        Data(index).time = time;
        Data(index).EastWest = 'Red';
        Data(index).NorthSouth = 'Yellow';
    end   
end
% in class assignment 6
perimeterlimit = 30;
for width = 0:1:perimeterlimit/2;
    for height = 0:1:perimeterlimit/2;
        if 2*width + 2*height <= perimeterlimit && width * height ~= 0
            area = width * height;
            plot(width,area,'r*')
            hold on
        end
    end
end