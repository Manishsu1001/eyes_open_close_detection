function [ C Acc p r F1] = confusionMat(Ytest, Ypredtest)
a =0;
b = 0;
c = 0;
d = 0;
C = zeros( 2 ,2);
for i = 1 : 1 : length(Ytest)
    if (Ytest(i) == Ypredtest(i) && Ytest(i) == 1)
        a = a + 1;
    elseif (Ytest(i) == Ypredtest(i) && Ytest(i) == 0)
            d = d + 1;
    elseif ( Ytest(i) ~= Ypredtest(i) && Ytest(i) == 1)
                c = c +1;
    elseif ( Ytest(i) ~= Ypredtest(i) && Ytest(i) == 0)
                b = b +1;
    end 
    
end 
    C = [a b; c d];
    Acc = ( a + d)/( a + b + c + d);
    p = a/( a + b);
    r = a/ ( a + c);
    F1 = 2 * ( p * r)/( p + r);
end 
    
                