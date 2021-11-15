function [mdl]=ModeleconomicFactorsAndBSGrowthRate( )
Asset=xlsread('Asset.xls');
[year,~]=size(Asset);
Data=zeros(year,1);
for i=1:year
Data(i,1)=sum(Asset(i,:));
end
ret=zeros(year-1,1);
for i=1:year-1
ret(i,1)=100*(Data(i+1,1)-Data(i,1))/Data(i,1);
end
EconomicFactors=xlsread('EconomicFactorsUK.xls');
x1=EconomicFactors(1:year-1,1);
x2=EconomicFactors(1:year-1,2);
x3=EconomicFactors(1:year-1,3);
X = [x1,x2,x3];
y = ret;
modelfun = @(b,x)b(1) + b(2)*x(:,1)+b(3)*x(:,2)+b(4)*x(:,3);
beta0 = [0.1 -3 3 0];
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
mdl = nlinfit(X,y,modelfun,beta0,opts);
end