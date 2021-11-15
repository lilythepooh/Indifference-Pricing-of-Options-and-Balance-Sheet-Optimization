function [newmap]=ComputeNewMap( )
newmap=zeros(100794,1);
newmap(100001,1)=1;
for i=100001:100793
    newmap(i+1,1)=newmap(i,1)+1;
end