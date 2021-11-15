function [C,Ceq]=NonlinearConstraint(x)
C=[];
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
xbar=x';
Ceq=xbar(1,1:na+nl+ne)*x(na+nl+ne+1:2*(na+nl+ne),1);
end