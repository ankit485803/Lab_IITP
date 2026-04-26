



##x=[-1 0 2]
##y=[0 -1 3]
##p2=polyfit(x,y,2)


### polyfit can be used to determine the slope and y-intercept
##x=[10 20 30 40 50 60 70 80]
##y=[25 70 380 550  610 1220 830 1450]
##
##a=polyfit(x,y,1)
##
### polyval can be used to compute a value using the coefficients
##y=polyval(a,45)


% up mai bakwas hai hame saj mai nahi aya hai #, ##, ### ka meaning h

# second degree
x = -3:0.1:3;
y = randn(1,61)*2-2+3*x+1.5*x.^2;
plot(x,y,'.')
p = polyfit(x,y,2)

hold on
plot(x,polyval(p,x),'r')
plot(x,-2+3*x+1.5*x.^2,'g')



