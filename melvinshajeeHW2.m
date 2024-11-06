%% HW 2            
% Melvin Shajee    
% BME210-002       
% Due:02/03/23
% rectangular to polar
inputvector = input("Input a 2 x 1 rectangular vector:");
x = inputvector(1);
y = inputvector(2);
r = sqrt((x^2)+(y^2));
theta = asin(y./r);
outputvector = [r, theta];
disp (outputvector)

% polar to rectangular
inputvector1 = input("Input a 2 x 1 polar vector:");
r1 = inputvector1(1);
theta1 = inputvector1(2);
x1 = r1*cos(theta);
x2 = r1*sin(theta);
outputvector1 = [x1, x2];
disp(outputvector1)

% plot for assignment 2
figure
x = linspace(0.01,10,100);
y = exp(-0.5.*x).*sin(2.*x);
z = exp(-0.5.*x).*cos(2.*x);
semilogx(x,y)
hold on
semilogx(x,z,"--r")
xlabel("x")
ylabel("y(x)")
legend("Function 1","Function 2")

% plot for assignment 3
figure
x = linspace(-2,8,200);
y = ((x.^2)-(6.*x)+5)./(x-3);
plot(x,y)
ylim([-10 10]);
title("Plot of function")
xlabel("x")
ylabel("y")