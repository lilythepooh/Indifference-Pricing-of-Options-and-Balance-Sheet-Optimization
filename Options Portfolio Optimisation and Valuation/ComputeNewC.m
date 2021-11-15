function [newc]=ComputeNewC(wbar)
%Compute the c for mosek to solve ALM problem with the digital option in
%consideration
data=ImportData();
qb(:,1)=data(:,6);
qa(:,1)=data(:,7);
qbnew=[qb,1];
qanew=qa;
w=zeros(100000,1);
w(:,1)=1/100000;
newc=[w;1/exp(1000+wbar);1./exp(qanew);1./exp(qbnew)];
end