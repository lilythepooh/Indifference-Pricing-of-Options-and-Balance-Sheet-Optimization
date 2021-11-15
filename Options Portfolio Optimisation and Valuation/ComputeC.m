function [c]=ComputeC( )
data=ImportData();
qb(:,1)=data(:,6)./100;
qa(:,1)=data(:,7)./100;
w=zeros(100000,1);
w(:,1)=1/10;
c=[w;1/exp(1);1./exp(qa);1./exp(qb)];
if c(:,1)<=0
    disp('error');
end
end