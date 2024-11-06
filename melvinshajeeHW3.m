%% HW 3            
% Melvin Shajee    
% BME210-002       
% Due:02/10/23
% 1
5 >= 4.6; % 1
46 < 46; % 0
xor(17 - pi < 12, pi < 3); % 0
true < false; % 0
~~(17/31) == (17/31); % 0
(7 <= 8) == (3/2==1); % 0
17.5 && (3.3>2.); % 1

% 2
if temp < 97.5
    disp("Temperature below normal");
elseif temp >= 97.5 && temp < 99.5
    disp("Temp is normal");
elseif temp > 103.0
    disp("Temperature is dangerously high");
end

% 3
n = input('Enter a Subject to Enroll: ','s');
 
switch lower(n)
    case 'english'
        disp('You have Selected English');
    case 'history'
        disp('You have Selected History');
    case 'astronomy'
        disp('You have Selected Astronomy');
    case 'literature'
        disp('You have Selected Literature');
    otherwise
        disp('Please only select one these following options: English, History, Astronomy, & Literature');
end

% 4
income = input('Enter an income: $');
 %Tax for 2009
if income <= 6000
    tax2009 = 0;
elseif income > 6000 && income <= 34000
    tax2009 = 0.15 * (income - 6000);
elseif income > 34000 && income <= 80000
    tax2009 = 0.30 * (income - 34000) + 4200;
elseif income > 80000 && income <= 180000
    tax2009 = 0.40 * (income - 80000) + 18000;
elseif income > 180000
    tax2009 = 0.45 * (income - 180000) + 58000;
end
 % Medicare Levy 2009
tax2009 = tax2009 + (0.015 * income);
 
%Tax for 2002
if income <= 6000
    tax2002 = 0;
elseif income > 6000 && income <= 20000
    tax2002 = 0.17 * (income - 6000);
elseif income > 20000 && income <= 50000
    tax2002 = 0.30 * (income - 20000) + 2380;
elseif income > 50000 && income <= 60000
    tax2002 = 0.42 * (income - 50000) + 11380;
elseif income > 60000
    tax2002 = 0.47 * (income - 60000) + 15580;
end
 
% Medicare Levy 2002
tax2002 = tax2002 + (0.015 * income);
 
% Tax Difference
tax_diff = tax2002 - tax2009;
 
fprintf('The tax difference is: %.2f\n', tax_diff);

% 5
n1 = input('Enter Index of Refraction for Region 1: ');
n2 = input('Enter Index of Refraction for Region 2: ');
angle1 = input('Enter angle (degrees) of Incidence for Region 1: ');
 
angle2 = asind((n1/n2)*sind(angle1));
 
if isreal(angle2)
    fprintf('The Angle of Incidence for Region 2 is: %.2f\n', angle2);
else
    fprintf('All the light is reflected back\n');
end

% 6
p = [1 -4 -6 20 -75 0 0]
r = roots(p)

% 7
ires = 1;
while mod(ires,17) ~= 0
ires = ires + 1;
end
% ires = 17, repeats 16

ires = 6;
while ires <= 100
ires = ires^2;
end
% ires = 1296, repeats 2

ires = 6;
while ires > 100
ires = ires^2;
end
% ires = 6, repeats 0

% 8
t = -9:.5:9;
y = zeros(size(t));
 
for i = 1:length(t)
    if t >= 0
        y(i) = -3*t(i)^2 - 4;
    else
        y(i) = 3*t(i)^2 - 4;
    end
end

% 9
for i = 1:41
    x(i) = (i-11)/10;
    y(i) = x(i)^2 - 4*x(i) + 5;
end

x = -1:.1:3;
y = x.^2 - 4*x + 5;
 
plot(x,y,'r--','LineWidth', 3)

% 10
n = input('Enter a positive integer to calculate its factorial: ');
if n < 0
    disp('n must be a positive integer');
elseif round(n) ~= n
    disp('n must be an integer');
else
    if n == 0
        factorial = 1;
    else
        factorial = 1;
        for i = 1:n
            factorial = factorial * i;
        end
    end
end
fprintf('The value is %.0f\n', factorial);