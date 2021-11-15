function [wbar]=generateBalanceSheetGrowthRate1( )
filename2='EconomicFactorsUK.xls';
Xnew=xlsread(filename2,'A8:C8');
modelfun = @(b,x)b(1) + b(2)*x(:,1)+b(3)*x(:,2)+b(4)*x(:,3);
b=ModeleconomicFactorsAndBSGrowthRate1( );
yp=modelfun(b,Xnew);
wbar=yp/100;
end