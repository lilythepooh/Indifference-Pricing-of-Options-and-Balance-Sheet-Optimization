function [price]=riskneutralPricing1(r,positivePay,K,S0,T,mu,sigma,size)
ST=GenerateBlackScholesIndex(S0,T,mu,sigma,size);
payoff=ComputeDigitalOptionPayoff(ST,K,positivePay);
price=exp(-r*T)*mean(payoff);
end