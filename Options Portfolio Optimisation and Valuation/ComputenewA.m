function [newa]=ComputenewA(P,DigitalPayoff)
data=ImportData();
Sb0(:,1)=data(:,2);
Sa0(:,1)=data(:,3);
Sa0new=[Sa0(2:396,1)];
Sb0new=[Sb0(2:396,1),0];
ao=(-2/100000)*[P,-P,-DigitalPayoff];
E=eye(396,396);
aq=zeros(793);
aq(2:396,2:396)=E(1:395,1:395);
aq(398:793,398:793)=E(1:396,1:396);
ac=[1,Sa0new.',1,Sb0new.';aq];
newa=[ao;ac];
end