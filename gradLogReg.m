function [ J_Reg, grad] = gradLogReg(theta, X, Y, lambda )
m = length(Y);
k = length(theta);
grad = zeros(k,1);
h=sigmoid(X*theta);
r = length(h);
s = length(Y);
o = size(X);
z = size(theta);
const = 0;
for e = 1 : 1 : m
const = const + ( h(e) - Y(e)) * X(e, 1);
end 
grad(1) = const;
for i = 2 : k
    grad(i) = sum((h- Y).*X(:,i))+(lambda * theta(i))/ m ;
end

J_Reg = costFunctionLReg( theta, X, Y, lambda);
end 

    