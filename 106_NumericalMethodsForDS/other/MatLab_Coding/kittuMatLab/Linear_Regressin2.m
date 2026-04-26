

x=[1 2 3 4 5 6];
y=[2 4 7 9 12 14];
x2=x.*x;
y2=y.*y;
xy=x.*y;
n=length(x);
r=(n*sum(xy)-sum(x)*sum(y))/(sqrt(n*sum(x2)-(sum(x))^2)*sqrt(n*sum(y2)-(sum(y))^2));
byx=(r*sqrt(n*sum(y2)-(sum(y))^2))/(sqrt(n*sum(x2)-(sum(x))^2));


syms xnew
ynew(xnew)=byx*(xnew)-byx*sum(x)/n+sum(y)/n;

xnew=input('Enter the new value of xnew')
double(ynew(xnew))

##z=ynew(x);
##z=double(z);
##plot(x,y,'ro')
##hold on
##plot(x,z,'k.-')
##grid minor
##xlabel('X-Axis')
##ylabel('Y-Axis')
##title('Linear Regression Relation Between X and Y')
