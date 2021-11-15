function [ST]=GenerateBlackScholesIndex(S0,T,mu,sigma,size)
epsilon=randn(1,size);
logST=log(S0)+(mu-0.5*sigma^2)*T+sigma*epsilon;
ST(1,:)=exp(logST(1,:));
histogram(logST);
end
