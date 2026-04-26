

x=[1 2 3 4 5];
y=[3 4 1 2 6];
%% Simple bar graph
%bar(x,y)

%% To change it's width
%bar(x,y,0.5)
barh(x,y,0.5)
%% To change it's color
%bar(x,y,'c')

y=[8 9 10; 9 9 9; 10 9 8; 10 10 10; 7 7 7];
% Bar graph for grouped data
bar(x,y)

% Bar graph for grouped data using stacked
bar(x,y,'stacked')
xlabel('x-axis')
ylabel('y-axis')
title('Bar graph')
legend('Maths','phy', 'che')