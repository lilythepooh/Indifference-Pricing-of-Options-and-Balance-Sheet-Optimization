function [price]=riskneutralPricing(r,positivePay,K,S0,T,mu,sigma,size)
ST=GenerateBlackScholesIndex(S0,T,mu,sigma,size);
payoff=zeros(100000,length(K));
price=zeros(length(K),1);
for i=1;length(K)
payoff(:,i)=ComputeDigitalOptionPayoff(ST,K(i,1),positivePay);
price(i,1)=exp(-r*T)*mean(payoff(:,i));
end
plot(K,price);
end