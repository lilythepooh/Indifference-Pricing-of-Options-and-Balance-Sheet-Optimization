%Produce the new balance sheet in Excel
function NewBalanceSheet( )
dx=OptimiseBalanceSheet( );
wt=generateBalanceSheetGrowthRate( );
%NewAsset
AssetProp=CalculateHistoricAssetProportionOfLastYear();
Asset=xlsread('Asset.xls');
[year,na]=size(Asset);
TotalAsset=sum(Asset(year,:));
a=AssetProp'+dx(1:na,1);
A=(1+wt)*TotalAsset*a;
xlswrite('NewBalanceSheetProportion.xls',a,'Asset');
xlswrite('NewBalanceSheet.xls',A,'Asset')
%newLiabilityProportion
LiabilityProp=CalculateHistoricLiabilityProportionOfLastYear();
Liability=xlsread('Liability.xls');
Equity=xlsread('Equity.xls');
[~,nl]=size(Liability);
[~,ne]=size(Equity);
LiabilityEquity=[Liability,Equity];
TotalLiabilityEquity=sum(LiabilityEquity(year,:));
l=LiabilityProp'+dx(na+1:na+nl,1);
L=(1+wt)*TotalLiabilityEquity*l;
xlswrite('NewBalanceSheetProportion.xls',l,'Liability');
xlswrite('NewBalanceSheet.xls',L,'Liability')
%newEquityProportion
EquityProp=CalculateHistoricEquityProportionOfLastYear();
e=EquityProp'+dx(na+nl+1:na+nl+ne,1);
E=(1+wt)*TotalLiabilityEquity*e;
xlswrite('NewBalanceSheetProportion.xls',e,'Equity');
xlswrite('NewBalanceSheet.xls',E,'Equity')
disp('Optimization Complete: Open the Excel document now');
end