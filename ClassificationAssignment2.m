% Classification problem with African and Asian Elephants(RGB2GRAY
% Conversion)
clear all
clc
fprintf('\nTraining set 1 is for African Elephants while Training set 2 is for Asian Elepants and the following process is for the conversion of RGB images to grayscale!\n');
[train1 m1] = process_datargb2gray( "C:\Users\pande\Desktop\cats-20220213T115851Z-001\African",64, 64);
[train2 m2] = process_datargb2gray( "C:\Users\pande\Desktop\dogs-20220213T115853Z-001\Asian",64, 64);
%Adding cross- validation dataset
[traincv1 k1] = process_datargb2gray("C:\Users\pande\Desktop\cats-20220213T115851Z-001\AfricanCv",64, 64);
[traincv2 k2] = process_datargb2gray("C:\Users\pande\Desktop\dogs-20220213T115853Z-001\Asiancv",64, 64);
[m n] = size(train1)
[u v] = size(train2)
pause
y1 = ones(m1,1);
y2= zeros(m2,1);
y3 = ones(k1,1);
y4 = zeros(k2,1);
  
% Dataset merged 
train = [ train1 ; train2];
traincv = [ traincv1 ; traincv2];
[ a b] = size(train);
y = [ y1; y2];
ycv = [ y3; y4];
X = train;
x = traincv;

[k l] = size(X);
[d e] = size(x);
fprintf('\n\nThe dimensions of training dataset are %d & %d', k , l);
fprintf('\n\nThe dimensions of cross validation dataset are %d & %d', d , e);
X = [ ones(k,1) X ];
x = [ones(d,1) x];
thetain = zeros((l +1), 1);
[ J_Reg grad] = gradLog(thetain, X, y);
fprintf('\nError using cost function is .... %d', J_Reg);
options = optimset('GradObj', 'on' , 'MaxIter' , 10);
lambda = 0 : 0.5 : 10;
g = length(lambda);
Jcv = zeros(g, 1);
theta = zeros(l + 1, g);
for i = 1 : 1 : g 
[theta(:,i), J ] = fminunc(@(t)(gradLogReg(theta(:,i), X, y, lambda(i))), theta(:,i), options);
 Jcv(i) = costFunctionL(theta(:, i), x, ycv);
end 
[Jcvfinal count] = min(Jcv);
lambdafinal = 0.5 * ( count - 1);
thetafinal = theta(:, count);
Jcv 
pause;
fprintf('Final lambda for the model is: %d', lambdafinal);
fprintf('Final Theta found by fminunc and regularisation: %f\n');
thetafinal 
fprintf('Cost at theta found by fminunc:   %f\n', Jcvfinal);

% Inserting the test dataset and calculating the confusion matrix for the
% same
[test1 u1] = process_datargb2gray("C:\Users\pande\Desktop\cats-20220213T115851Z-001\Africantest\African" ,64, 64);
[test2 u2] = process_datargb2gray("C:\Users\pande\Desktop\dogs-20220213T115853Z-001\AsianTest\Asian",64, 64);
xtest = [test1; test2 ];
[z1 v1] = size(test1);
[z2 v2] = size(test2);

xtest1 = [ ones(z1,1) test1];
xtest2 = [ ones(z2,1) test2];
ytest1 = ones(u1, 1);
ytest2 = zeros(u2, 1);
ytestnet = [ ytest1; ytest2];
ytestpred1 = predictLog(theta, xtest1); % Predicting for first data set
ytestpred2 = predictLog(theta, xtest2); % Predicting for second data set
ytestpred = [ ytestpred1 ; ytestpred2];

[ C Acc p r F1] = confusionMat( ytestnet ,ytestpred);
fprintf('The confusion matrix is : \n');
    C
    fprintf('The accuracy is : \n');
    Acc
    fprintf('The precision is : \n');
    p
    fprintf('The recall is : \n');
    r
    fprintf('The F1 score : \n');
    F1
   fprintf('The end of second part of the code! \n');
    
    


