function [s]=CalculateASF( )
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
Inputs=xlsread('Inputs.xls');
alpha=Inputs(3,:);
beta=Inputs(4,:);
gamma=Inputs(5,:);
xi=Inputs(9,:);
zeta=Inputs(10,:);
eta=Inputs(11,:);
s=zeros(1,nl+ne);
%ASF factor for liabilities
s(1,1:nl)=1*(xi(1,na+1:na+nl)+zeta(1,na+1:na+nl)+eta(1,na+1:na+nl))+...
    0.9*alpha(1,na+1:na+nl)+0.5*beta(1,na+1:na+nl)+0*gamma(1,na+1:na+nl);
%ASF factor for equities
s(1,nl+1:nl+ne)=1*(xi(1,na+nl+1:na+nl+ne)+zeta(1,na+nl+1:na+nl+ne)+...
    eta(1,na+nl+1:na+nl+ne))+0.5*(1-(xi(1,na+nl+1:na+nl+ne)+...
    zeta(1,na+nl+1:na+nl+ne)+eta(1,na+nl+1:na+nl+ne)));
end