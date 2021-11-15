function [du]=Disutility6(x)
Return=xlsread('Return.xls');
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
meanReturn=zeros(1,35);
for i=1:35
    meanReturn(1,i)=mean(Return(:,i));
end
zp=xlsread('Inputs.xls','B2:AJ2');
zn=xlsread('Inputs.xls','B3:AJ3');
alpha=xlsread('Inputs.xls','B4:AJ4');
beta=xlsread('Inputs.xls','B5:AJ5');
gamma=xlsread('Inputs.xls','B6:AJ6');
expectedLossCoef=zeros(1,70);
expectedLossCoef(1,1:17)=-meanReturn(1,1:17)+zp(1,1:17);
expectedLossCoef(1,18:35)=meanReturn(1,18:35)+zp(1,18:35);
expectedLossCoef(1,36:70)=meanReturn(1,1:35)+zn(1,1:35);
ExpectedLoss=expectedLossCoef*x;
LossCoef=zeros(10000,70);
for i=1:10000
    LossCoef(i,1:17)=-Return(i,1:17)+zp(1,1:17);
    LossCoef(i,18:35)=Return(i,18:35)+zp(1,18:35);
    LossCoef(i,36:70)=Return(i,1:35)+zn(1,1:35);
end
Loss=LossCoef*x;
VaR=prctile(Loss,99);
Shortfall=Loss<VaR;
ES=mean(sparse(Shortfall'*Loss));
IRcoef=0.2*alpha(1,:)+0.5*beta(1,:)+0.8*gamma(1,:);
IR=[IRcoef,zeros(1,5),-IRcoef,zeros(1,5)]*x;
du=ExpectedLoss+VaR+ES+IR;
end