function J = costFunction(theta, X, Y)

[m , n] = size(X); 
J = 0;
c = length(theta);
temp1 = 0;
temp2 = 0;
for i  = 1 : 1 : m 
    h(i) = sigmoid(X(i , :) * theta);
    temp1 = - ( Y(i) * log(h(i)) + ( 1- Y(i)) * log( 1 -h(i))) + temp1;
end 
temp2 = sum(theta(2:c).^2)/ 2;
J = (temp1 + temp2)/ m;
end 
 