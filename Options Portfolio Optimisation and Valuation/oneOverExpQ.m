function [l]=oneOverExpQ( )
data=ImportData();
qb(:,1)=data(:,6)./100;
qa(:,1)=data(:,7)./100;
l=[1./exp(qa),1./exp(qb)];
end
