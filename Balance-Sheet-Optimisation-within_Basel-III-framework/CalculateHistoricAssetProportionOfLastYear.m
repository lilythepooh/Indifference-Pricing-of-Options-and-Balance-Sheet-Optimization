function [AssetProp]=CalculateHistoricAssetProportionOfLastYear()
Asset=xlsread('Asset.xls');
[year,~]=size(Asset);
TotalAsset=sum(Asset(year,:));
AssetProp=Asset(year,:)/TotalAsset;
end