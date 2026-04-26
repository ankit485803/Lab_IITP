
X=[8 9 10 7 10]
%% Simple Pi_Chart
%pie(X)

%% To get space between each value of X
Y=[1 1 1 1 1]
pie(X,Y)

% 3D Pi chart
pie3(X,Y)

% To label a Pi_Chart
label={'Maths' 'Phy' 'Che' 'Hindi' 'Eng'}
pie3(X,Y)
title('Pi Chart')
lgd=legend(label)