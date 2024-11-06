%in class assignment 1
5 >= 4.6;
46 < 46;
xor(17 - pi < 12, pi < 3);
true < false;
~~(17/31) == (17/31);
(7 <= 8) == (3/2==1);
17.5 && (3.3 > 2.);
%in class assignment 2
% there is an overlap in the values of the if statement.

%in class assigment 3
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
%in class assignment 4
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

%in class assignment 5
n1 = input('Enter Index of Refraction for Region 1: ');
n2 = input('Enter Index of Refraction for Region 2: ');
angle1 = input('Enter angle (degrees) of Incidence for Region 1: ');
 
angle2 = asind((n1/n2)*sind(angle1));
 
if isreal(angle2)
    fprintf('The Angle of Incidence for Region 2 is: %.2f\n', angle2);
else
    fprintf('All the light is reflected back\n');
end
%in class assignment 6

%in class assignment 7

%in class assignment 8

%in class assignment 9

%in class assignment 10
