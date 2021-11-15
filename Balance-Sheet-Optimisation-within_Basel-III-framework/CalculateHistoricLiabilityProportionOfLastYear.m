function [LiabilityProp]=CalculateHistoricLiabilityProportionOfLastYear()
Liability=xlsread('Liability.xls');
Equity=xlsread('Equity.xls');
[year,~]=size(Liability);
LiabilityEquity=[Liability,Equity];
TotalLiabilityEquity=sum(LiabilityEquity(year,:));
LiabilityProp=Liability(year,:)./TotalLiabilityEquity;
end