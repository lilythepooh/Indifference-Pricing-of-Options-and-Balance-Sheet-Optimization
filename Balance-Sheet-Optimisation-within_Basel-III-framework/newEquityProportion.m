%calculate the optimum equity proportion
function newEquityProportion( )
dx=OptimiseBalanceSheet4( );
wt=generateBalanceSheetGrowthRate1( );
EquityProp=CalculateHistoricEquityProportionOfLastYear();
filename='SantanderBalanceSheet.xls';
LiabilityEquity=xlsread(filename,'R2:AI8');
TotalLiabilityEquity=sum(LiabilityEquity(7,:));
e=EquityProp'+dx(31:35,1);
E=(1+wt)*TotalLiabilityEquity*e;
xlswrite('NewBalanceSheetProportion.xls',e,'C1');
xlswrite('NewBalanceSheet.xls',E,'C1')
end
