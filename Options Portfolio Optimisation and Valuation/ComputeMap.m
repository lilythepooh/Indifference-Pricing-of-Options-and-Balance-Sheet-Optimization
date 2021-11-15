function [map]=ComputeMap( )
map=zeros(100793,1);
map(100001,1)=1;
for i=100001:100792
    map(i+1,1)=map(i,1)+1;
end