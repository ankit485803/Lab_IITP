
x = [5 4 3 2 1];
y = [9 8 10 11 12];
n = length(x);
##%%% equation of line: y = a*x + b
syms a b
eqn1 = sum(y) == a*sum(x) + n*b;
eqn2 = sum(x.*y) == a*sum(x.^2) + b*sum(x);
sol = solve([eqn1,eqn2],[a,b]);
a = sol.a
b = sol.b
%fprintf('The best fit line is:(y=%0.3f * x + %0.3f )\n', [a,b])






##clear all
##clc
##
##X = [1 2 3 4];
##Y = [1 3 4 6];
##n = length(X);
##%%% equation of quadratic curve: y = a + b*x + c*x^2
##syms a b c
##eqn1 = sum(Y) ==  n*a + b*sum(X) + c*sum(X.^2);
##eqn2 = sum(Y.*X) == a*sum(X) + b*sum(X.^2) + c*sum(X.^3);
##eqn3 = sum(Y.*X.^2) == a*sum(X.^2) + b*sum(X.^3) + c*sum(X.^4);
##sol = solve([eqn1,eqn2,eqn3],[a,b,c]);
##a = sol.a
##b = sol.b
##c = sol.c
##%fprintf('The best fit line is:(y=%0.3f * x + %0.3f )\n', [a,b])


##clear all
##clc
######## To fit into a power curve
x = [6 2 10 5 8];
y = [9 11 12 8 7];
n = length(x);
%%% equation of line: y = a*x^b
#       log10(y) = A + b*log10(x);   A = log10(a)
syms a b
eqn1 = sum(log10(y)) == A*sum(log10(x)) + n*b;
eqn2 = sum(log10(y).*log10(x) == A*sum(log10(x) + b*sum(log10(x)^2);
sol = solve([eqn1,eqn2],[a,b]);
A = sol.A;
b = sol.b
a = 10^A


###### To fit into a exponential curve
x = [2 4 6 8 10];
y = [1 3 6 12 24];
n = length(x);
%%% equation of curve: y = a*b^x
#       log10(y) = A + x*B;   A = log10(a); B = log10(b);
syms A B
%eqn1 = sum(log10(y)) == A*n + B*sum(log10(x);
##eqn1 = sum(log10(y)) == A*sum(x) + n*b;
##eqn2 = sum(x.*log10(y)) == A*sum(x.^2) + B*sum(x);
##sol = solve([eqn1,eqn2],[A,B]);
##A = sol.A;
##B = sol.B;
##a = 10^A
##b = 10^B
