%calculate the optimum liability proportion
function newLiabilityProportion( )
dx=OptimiseBalanceSheet4( );
wt=generateBalanceSheetGrowthRate1( );
LiabilityProp=CalculateHistoricLiabilityProportionOfLastYear();
filename='SantanderBalanceSheet.xls';
LiabilityEquity=xlsread(filename,'R2:AI8');
TotalLiabilityEquity=sum(LiabilityEquity(7,:));
l=LiabilityProp'+dx(18:30,1);
L=(1+wt)*TotalLiabilityEquity*l;
xlswrite('NewBalanceSheetProportion.xls',l,'B1');
xlswrite('NewBalanceSheet.xls',L,'B1')
end
