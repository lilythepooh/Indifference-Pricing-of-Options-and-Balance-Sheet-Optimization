function [du]=Disutility(x)
Return=xlsread('Return.xls');
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
meanReturn=zeros(1,na+nl+ne);
for i=1:na+nl+ne
    meanReturn(1,i)=mean(Return(:,i));
end
Inputs=xlsread('Inputs.xls');
zp=Inputs(1,:);
zn=Inputs(2,:);
alpha=Inputs(3,:);
beta=Inputs(4,:);
gamma=Inputs(5,:);
expectedLossCoef=zeros(1,2*(na+nl+ne));
expectedLossCoef(1,1:na)=-meanReturn(1,1:na)+zp(1,1:na);
expectedLossCoef(1,na+1:na+nl+ne)=meanReturn(1,na+1:na+nl+ne)+...
    zp(1,na+1:na+nl+ne);
expectedLossCoef(1,na+nl+ne+1:2*(na+nl+ne))=meanReturn(1,1:na+nl+ne)+...
    zn(1,1:na+nl+ne);
ExpectedLoss=expectedLossCoef*x;
LossCoef=zeros(10000,2*(na+nl+ne));
for i=1:10000
    LossCoef(i,1:na)=-Return(i,1:na)+zp(1,1:na);
    LossCoef(i,na+1:na+nl+ne)=Return(i,na+1:na+nl+ne)+zp(1,na+1:na+nl+ne);
    LossCoef(i,na+nl+ne+1:2*(na+nl+ne))=Return(i,1:na+nl+ne)+...
        zn(1,1:na+nl+ne);
end
Loss=LossCoef*x;
VaR=prctile(Loss,99);
Shortfall=Loss<VaR;
ES=mean(sparse(Shortfall'*Loss));
IRcoef=0.2*alpha(1,:)+0.5*beta(1,:)+0.8*gamma(1,:);
IR=[IRcoef,zeros(1,ne),-IRcoef,zeros(1,ne)]*x;
du=ExpectedLoss+VaR+ES+IR;
end