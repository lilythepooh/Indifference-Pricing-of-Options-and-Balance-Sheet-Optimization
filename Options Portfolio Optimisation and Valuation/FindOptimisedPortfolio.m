function FindOptimisedPortfolio( )
P=Computepayoff( );
a=ComputeA(P);
c=ComputeC();
map=ComputeMap();
SolveALM(a,c,map);
end