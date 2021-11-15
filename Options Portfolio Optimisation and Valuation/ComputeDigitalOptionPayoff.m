function [DigitalPayoff]=ComputeDigitalOptionPayoff(S,K,positivePay)
DigitalPayoff=zeros(100000,1);
if S(:,1)>K
DigitalPayoff(:,1)=positivePay;
else
DigitalPayoff(:,1)=0;
end
end