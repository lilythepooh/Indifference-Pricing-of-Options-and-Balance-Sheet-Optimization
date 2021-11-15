function [c]=CalculateRSF( )
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Inputs=xlsread('Inputs.xls');
alpha=Inputs(3,:);
beta=Inputs(4,:);
gamma=Inputs(5,:);
lambda=Inputs(6,:);
mu=Inputs(7,:);
nu=Inputs(8,:);
c=zeros(1,na);
c(1,:)=0.1*alpha(1,:)+0.45*beta(1,:)+0.9*gamma(1,:)+0.05*lambda(1,:)+...
    0.15*mu(1,:)+0.5*nu(1,:);
c(1,1)=0;
end