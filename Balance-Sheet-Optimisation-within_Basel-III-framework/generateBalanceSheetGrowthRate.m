%Simulate the expected balance sheet growth rate of next year
function [wbar]=generateBalanceSheetGrowthRate( )
X=xlsread('EconomicFactorsUK.xls');%read economic factors data until this year
[year,~]=size(X);
Xnew=X(year,:);%the economic factors of this year
modelfun = @(b,x)b(1) + b(2)*x(:,1)+b(3)*x(:,2)+b(4)*x(:,3);
b=ModeleconomicFactorsAndBSGrowthRate( );
yp=modelfun(b,Xnew);
wbar=yp/100;%scale the result to a percentage
end