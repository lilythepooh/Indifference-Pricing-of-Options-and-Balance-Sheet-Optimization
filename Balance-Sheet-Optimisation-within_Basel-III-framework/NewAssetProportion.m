%Calculate the optimum asset proportion
function NewAssetProportion( )
dx=OptimiseBalanceSheet4( );
AssetProp=CalculateHistoricAssetProportionOfLastYear();
Asset=xlsread('Asset.xls');
[year,na]=size(Asset);
TotalAsset=sum(Asset(year,:));
wt=generateBalanceSheetGrowthRate( );
a=AssetProp'+dx(1:na,1);
A=(1+wt)*TotalAsset*a;
xlswrite('NewBalanceSheetProportion.xls',a,'Asset');
xlswrite('NewBalanceSheet.xls',A,'Asset')
end
