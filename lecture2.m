%lecture2
%in class assignment1
grid on
x = 0:20;
y = 2*exp(-2*x) + 0.5*exp(-0.1*x);
figure
plot (x,y)
title('regular plot')
xlabel('x')
ylabel('y')
figure
semilogy (x,y)
title('log plot')
xlabel('x')
ylabel('y')
%in class assignment 2
x = logspace(-2,1,100);
y = exp(-0.5.*x).*sin(2.*x);
z = exp(-0.5.*x).*cos(2.*x);
loglog (x,y)
loglog (x,z)
%in class assignment 3
x = linspace(-2,8,200);
y = ((x.^2)-(6.*x)+5)./(x-3);
plot (x,y)
ylim([-10 10]);
