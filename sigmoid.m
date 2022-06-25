function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.

% You need to return the following variables correctly 
g = zeros(size(z));
[a,b]=size(z);
for j = 1 : 1 : a
    for i = 1: 1 : b 
        g(j , i ) = 1 / ( 1 + exp( -z(j, i))) ;
    end 
end 

end
