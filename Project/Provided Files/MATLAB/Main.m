clc;
% data loading
M = csvread('mnist_train.csv');
T = csvread('mnist_test.csv');
DVec = zeros(10,60000);
IVec = zeros(785,60000);

% Training
k=0;
for i=1:60000
   DVec(:,i) = num2TempratureVec(M(i,1));
   IVec(:,i) = [ M(i,2:end)'; 1]; 
end 
IVecInv = pinv(IVec);
WVec = DVec*IVecInv;

% Testing
k = 0;j=0;
 for i=1:10000
   TestImage = [T(i,2:end)';1];% provision for the BIAS in testing as well
   TestResult = Hardware(WVec,TestImage);
   ActualNumber = T(i,1);
    if  TestResult == ActualNumber
       k = k+1;
    else
      j = j+1;
    end
 end 
 fprintf('Success Rate %d %% \n',100 - round(100*j/(j+k)));


