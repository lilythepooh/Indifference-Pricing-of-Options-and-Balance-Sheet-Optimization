function [EquityProp]=CalculateHistoricEquityProportionOfLastYear()
Liability=xlsread('Liability.xls');
Equity=xlsread('Equity.xls');
[year,~]=size(Equity);
LiabilityEquity=[Liability,Equity];
TotalLiabilityEquity=sum(LiabilityEquity(year,:));
EquityProp=Equity(year,:)/TotalLiabilityEquity;
end