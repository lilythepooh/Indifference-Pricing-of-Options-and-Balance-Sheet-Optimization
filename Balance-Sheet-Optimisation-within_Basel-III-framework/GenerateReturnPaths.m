function [Return]=GenerateReturnPaths( )
HistoricReturn=CalculateHistoricReturn( );
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
Return=zeros(10000,na+nl+ne);
rng default
for i=1:na+nl+ne
m=HistoricReturn(:,i);
Return(:,i)=GenerateARMA(m);
end
xlswrite('Return.xls',Return);
end