


% 10 points (sampled from the true model, a 1D sine wave)
x = linspace(0, 4*pi, 10);
y = sin(x);

% fit a 7th degree polynomial
p = polyfit(x, y, 7);

% evaluate poly on a 100 equally spaced points 
xx = linspace(0, 4*pi, 100);
yy = polyval(p, xx);

% plot
plot(x,y,'o', xx,yy,'-')
legend({'input points', 'evaluated poly'})