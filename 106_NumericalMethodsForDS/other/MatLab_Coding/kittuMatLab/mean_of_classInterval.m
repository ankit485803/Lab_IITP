% To find the mean of a class interval

##class_interval=[0 10;10 20;20 30;30 40;40 50;50 60];
##midpoints=Mean(class_interval, 2);
##midpoints=midpoints'
##midpoint=[5,15,25,35,45];
##frequencies=[7 8 7 9 5 8];
##Sum=sum(midpoints.*frequencies);
##freq_sum=sum(frequencies);

##Mean=Sum/freq_sum;

##fprintf('Mean: %.2f\n',Mean)
##clc
##clear all
##clc

###To find the mean of a class interval
clear all
clc


class_interval=[0 10;10 20;20 30;30 40;40 50;50 60];
midpoints=Mean(class_interval, 2);
midpoint=[5,15,25,35,45];
frequencies=[7 8 7 9 5 8];
Sum=sum(midpoints.*frequencies);
freq_sum=sum(frequencies);
Mean=Sum/freq_sum;
fprint('Mean: %.2f\n ,Mean')

