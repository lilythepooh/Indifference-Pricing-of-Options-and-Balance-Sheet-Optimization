function [HistoricReturn]=CalculateHistoricReturn( )
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[year,ne]=size(Equity);
Amount=[Asset,Liability,Equity];
AssetGainLoss=xlsread('AssetGainLoss.xls');
LiabilityGainLoss=xlsread('LiabilityGainLoss.xls');
EquityGainLoss=xlsread('EquityGainLoss.xls');
GainLoss=[AssetGainLoss,LiabilityGainLoss,EquityGainLoss];
HistoricReturn=zeros(year,na+nl+ne);
for i=1:year
    HistoricReturn(i,:)=GainLoss(i,:)./Amount(i,:);
end
end

