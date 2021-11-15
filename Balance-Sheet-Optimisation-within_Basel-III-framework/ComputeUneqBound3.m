function [b]=ComputeUneqBound3( )
b=zeros(11,1);
AssetProp=CalculateHistoricAssetProportionOfLastYear();
LiabilityProp=CalculateHistoricLiabilityProportionOfLastYear();
EquityProp=CalculateHistoricEquityProportionOfLastYear();
Inputs=xlsread('Inputs.xls');
xi=Inputs(9,:);
zeta=Inputs(10,:);
eta=Inputs(11,:);
y=Inputs(12,:);
f=Inputs(13,:);
lambda=Inputs(6,:);
mu=Inputs(7,:);
nu=Inputs(8,:);
sigma=Inputs(15,:);
delta=Inputs(14,:);
c=CalculateRSF( );
s=CalculateASF( );
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
b(1,1)=xi(1,1:na)*AssetProp'+xi(1,na+1:na+nl)*LiabilityProp'+...
    +xi(1,na+nl+1:na+nl+ne)*EquityProp'-0.045*y(1,1:na)*AssetProp';
b(2,1)=(xi(1,1:na)+zeta(1,1:na))*AssetProp'+...
    +(xi(1,na+1:na+nl)+zeta(1,na+1:na+nl))*LiabilityProp'+...
    (xi(1,na+nl+1:na+nl+ne)+zeta(1,na+nl+1:na+nl+ne))*EquityProp'-...
    0.06*y(1,1:na)*AssetProp';
b(3,1)=(xi(1,1:na)+zeta(1,1:na)+eta(1,1:na))*AssetProp'+...
    (xi(1,na+1:na+nl)+zeta(1,na+1:na+nl)+...
    eta(1,na+1:na+nl))*LiabilityProp'+(xi(1,na+nl+1:na+nl+ne)+...
    zeta(1,na+nl+1:na+nl+ne)+eta(1,na+nl+1:na+nl+ne))*EquityProp'...
    -0.08*y(1,1:na)*AssetProp';
b(4,1)=xi(1,1:na)*AssetProp'+xi(1,na+1:na+nl)*LiabilityProp'+...
    +xi(1,na+nl+1:na+nl+ne)*EquityProp'-0.13*y(1,1:na)*AssetProp';
fbar=zeros(1,na);
for i=1:na
    fbar(1,i)=(f(1,i)-0.15)*xi(1,i);
end
b(5,1)=0.15*(xi(1,1:na)*AssetProp'+xi(1,na+1:na+nl)*LiabilityProp'+...
    +xi(1,na+nl+1:na+nl+ne)*EquityProp'-fbar*AssetProp');
wt=generateBalanceSheetGrowthRate1( );
b(6,1)=xi(1,1:na)*AssetProp'+xi(1,na+1:na+nl)*LiabilityProp'+...
    +xi(1,na+nl+1:na+nl+ne)*EquityProp'-0.03*(1+wt);
b(7,1)=(0.4*lambda(1,1:na)-0.6*mu(1,1:na)-0.6*nu(1,1:na))*AssetProp';
b(8,1)=(0.15*lambda(1,1:na)+0.15*mu(1,1:na)-0.85*nu(1,1:na))*AssetProp';
b(9,1)=s(1,1:nl)*LiabilityProp'+s(1,nl+1:nl+ne)*EquityProp'-...
    c(1,1:na)*AssetProp';
b(10,1)=(delta(1,1:na)+mu(1,1:na)+nu(1,1:na)+lambda(1,1:na))*AssetProp'-...
    sigma(1,na+1:na+nl)*LiabilityProp'-...
    sigma(1,na+nl+1:na+nl+ne)*EquityProp';
b(11,1)=(mu(1,1:na)+nu(1,1:na)+lambda(1,1:na))*AssetProp'-...
    0.25*sigma(1,na+1:na+nl)*LiabilityProp'-...
    0.25*sigma(1,na+nl+1:na+nl+ne)*EquityProp';
end