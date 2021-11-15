function [P]=Computepayoff()
data=ImportData();
K(:,1)=data(:,1);
Put(:,1)=data(:,4);
Index=GenerateIndex( );
P=zeros(100000,396);
for i=1:396
P(:,i)=P(:,i)+Put(i,1).*(K(i,1)-Index(:,1));
P(:,i)=P(:,i)+(1-Put(i,1)).*(Index(:,1)-K(i,1));
end
P=100.*P;
P(1,:)=exp(0.043);
end