function [A]=CalculateUneqCoeff3( )
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
A1=zeros(11,na+nl+ne);
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
A1(1,1:na)=0.045*y(1,1:na)-xi(1,1:na);
A1(1,na+1:na+nl)=-xi(1,na+1:na+nl);
A1(1,na+nl+1:na+nl+ne)=-xi(1,na+nl+1:na+nl+ne);
A1(2,1:na)=0.06*y(1,1:na)-(xi(1,1:na)+zeta(1,1:na));
A1(2,na+1:na+nl)=-(xi(1,na+1:na+nl)+zeta(1,na+1:na+nl));
A1(2,na+nl+1:na+nl+ne)=-(xi(1,na+nl+1:na+nl+ne)+zeta(1,na+nl+1:na+nl+ne));
A1(3,1:na)=0.08*y(1,1:na)-(xi(1,1:na)+zeta(1,1:na)+eta(1,1:na));
A1(3,na+1:na+nl)=-(xi(1,na+1:na+nl)+zeta(1,na+nl+1:na+nl)+eta(1,na+nl+1:na+nl));
A1(3,na+nl+1:na+nl+ne)=-(xi(1,na+nl+1:na+nl+ne)+zeta(1,na+nl+1:na+nl+ne)+eta(1,na+nl+1:na+nl+ne));
A1(4,1:na)=0.13*y(1,1:na)-xi(1,1:na);
A1(4,na+1:na+nl)=-xi(1,na+1:na+nl);
A1(4,na+nl+1:na+nl+ne)=-xi(1,na+nl+1:na+nl+ne);
fbar=zeros(1,na);
for i=1:na
    fbar(1,i)=(f(1,i)-0.15)*xi(1,i);
end
A1(5,1:na)=fbar(1,1:na);
A1(5,na+1:na+nl)=-xi(1,na+1:na+nl);
A1(5,na+nl+1:na+nl+ne)=-xi(1,na+nl+1:na+nl+ne);
A1(6,1:na)=-xi(1,1:na);
A1(6,na+1:na+nl)=-xi(1,na+1:na+nl);
A1(6,na+nl+1:na+nl+ne)=-xi(1,na+nl+1:na+nl+ne);
A1(7,1:na)=0.6*mu(1,1:na)+0.6*nu(1,1:na)-0.4*lambda(1,1:na);
A1(8,1:na)=0.85*nu(1,1:na)-0.15*lambda(1,1:na)-0.15*mu(1,1:na);
A1(9,1:na)=c;
A1(9,na+1:na+nl+ne)=-s;
A1(10,1:na)=-(delta(1,1:na)+mu(1,1:na)+nu(1,1:na)+lambda(1,1:na));
A1(10,na+1:na+nl+ne)=sigma(1,na+1:na+nl+ne);
A1(11,1:na)=-(mu(1,1:na)+nu(1,1:na)+lambda(1,1:na));
A1(11,na+1:na+nl+ne)=0.25*sigma(1,na+1:na+nl+ne);
A=[A1,-A1];
end