
% %% Linear Regression Y on X
x = [1 2 3 4 5 6];
y = [2 4 6 7 8 12];
x2 = x.*x;
y2 = y.*y;
xy = x.*y;
n = length(x);

%% Correlation coff
r = (n*sum(xy)-sum(x)*sum(y))/(sqrt(n*sum(x2)-(sum(x))^2)*sqrt(n*sum(y2)-(sum(y))^2));
byx = r*(sqrt(sum(y2)/n-(sum(y)/n)^2))/(sqrt(sum(x2)/n-(sum(x)/n)^2));
ynew = byx*(x-(sum(x)/n))+(sum(y)/n);



plot(x,y,'ro')
hold on
plot(x,ynew,'k*-')
grid minor
xlabel('X-Axis')
ylabel('Y-Axis')
title('Linear Regression')
legend('Y\_real','Y\_cal')
