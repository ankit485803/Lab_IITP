

%% Moments
%X = [0 1 2 3 4 5 6 7 8];
X = [5 10 15 20 25 30 35];
F = [4 10 20 36 16 12 2];
%F = [1 8 28 56 70 56 28 8 1];
N = sum(F);
X_bar = (sum(F.*X))/N;
a=0;
D = X-0;
r = 4;
Mu = zeros(1,r);
for i = 1:r
  Mu(i) = (sum(F.*D.^i))/N;
end



fprintf('The first %d moments are:',r)
Mu
%plot(X,F)

Beta1 = (Mu(3)^2)/(Mu(2)^3)
Beta2 = Mu(4)/(Mu(2)^2)
