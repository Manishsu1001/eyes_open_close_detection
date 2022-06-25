function lambda = LambdaDet( x, y, a , b , theta, iter, alpha)
Jtr = zeros(100, 1);
Jcv = zeros(100, 1);
for i = 1: 1 : 100
    lambda = log10(i);
for k = 1: iter
    [theta, J_Mod] = gradModify(x , y , theta, lambda, alpha);
end 
Jtr(i) = costFunctionM(x, y, theta);
Jcv(i)= costFunctionM(a, b, theta);
end
figure;
plot(1:(numel(Jcv)) , Jcv , 'r')
xlabel('iteration count, lambda = log10(iter)');
ylabel('Error in Jcv and Jtr');

[A B] = min(Jcv);
lambda = log10(B);

end 