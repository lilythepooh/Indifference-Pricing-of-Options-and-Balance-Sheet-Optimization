function [infSellingPrice]=ComputeInfSellingPrice(K)
P=Computepayoff( );
a1=ComputeA(P);
c1=ComputeC( );
map1=Computemap( );
S=GenerateIndex( );
positivePay=1000;
DigitalPayoff=ComputeDigitalOptionPayoff(S,K,positivePay);
a2=ComputeNewA(P,DigitalPayoff);
c2=ComputeNewC(wbar);
map2=ComputeNewMap( );
difference=ComputeDifferenceOfOptimumValue(c1,c2,a1,a2,map1,map2);
infSellingPrice=fzero(difference,300);
end
