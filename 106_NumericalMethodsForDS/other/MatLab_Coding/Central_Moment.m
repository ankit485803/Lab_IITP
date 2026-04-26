


%% Moments
%X = [0 1 2 3 4 5 6 7 8];
X = [5 10 15 20 25 30 35];
F = [4 10 20 36 16 12 2];
%F = [1 8 28 56 70 56 28 8 1];
N = sum(F);
X_bar = (sum(F.*X))/N;
D = X-X_bar;
r = 4;
Mu = zeros(1,r);
for i = 1:r
  Mu(i) = (sum(F.*D.^i))/N;
end



fprintf('The first r moments are: %0.4f',r)
Mu
plot(X,F)

%Beta1 = (Mu3^2)/(Mu2^3)
%Beta2 = Mu4/(Mu2^2)
