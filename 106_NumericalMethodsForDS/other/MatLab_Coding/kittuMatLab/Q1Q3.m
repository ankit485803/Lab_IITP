% Q1 and Q3
clear
clc
class_intervals =[0 20;20 40;40 60;60 80;80 100]
freq = [5 15 30 8 12];
m = length(freq);
cf = zeros(m,1);
cf(1) = freq(1);
for i = 2:m
  cf(i) = cf(i-1)+ freq(i);
end
N = sum(freq);
for i = 1:m
  if(3*N/4) <= cf(i)
   L = class_intervals(i);
   F = freq(i);
   C = cf(i-1);
   break
 endif
end
h = class_intervals(1,2)- class_intervals(1,1);
Q3 = L + (((3*N/4)-C)/F)*h;
fprintf('Q3: %0.f \n',Q3)


% Q1 and Q3
clear
clc
class_intervals =[0 20;20 40;40 60;60 80;80 100]
freq = [5 15 30 8 12];
m = length(freq);
cf = zeros(m,1);
cf(1) = freq(1);
for i = 2:m
  cf(i) = cf(i-1)+ freq(i);
end
N = sum(freq);
for i = 1:m
  if(1*N/4) <= cf(i)
   L = class_intervals(i);
   F = freq(i);
   C = cf(i-1);
   break
 endif
end
h = class_intervals(1,2)- class_intervals(1,1);
Q1 = L + (((1*N/4)-C)/F)*h;
fprintf('Q1: %0.f \n',Q1)



% D and D3
clear
clc
class_intervals =[0 20;20 40;40 60;60 80;80 100]
freq = [5 15 30 8 12];
m = length(freq);
cf = zeros(m,1);

for i = 2:m
  cf(i) = cf(i-1)+ freq(i);
end
N = sum(freq);
for i = 1:m
  if(1*N/10) <= cf(i)
   L = class_intervals(i);
   F = freq(i);
   C = cf(i-1);
   break
 endif
end
h = class_intervals(1,2)- class_intervals(1,1);
D3 = L + (((1*N/10)-C)/F)*h;
fprintf('D3: %0.f \n',D3)


 % P and P3
clear
clc
class_intervals =[0 20;20 40;40 60;60 80;80 100]
freq = [5 15 30 8 12];
m = length(freq);
cf = zeros(m,1);
cf(1) = freq(1);
for i = 2:m
  cf(i) = cf(i-1)+ freq(i);
end
N = sum(freq);
for i = 1:m
  if(20*N/100) <= cf(i)
   L = class_intervals(i);
   F = freq(i);
   C = cf(i-1);
   break
 endif
end
h = class_intervals(1,2)- class_intervals(1,1);
P3 = L + (((26*N/100)-C)/F)*h;
fprintf('P3: %0.f \n',P3)


