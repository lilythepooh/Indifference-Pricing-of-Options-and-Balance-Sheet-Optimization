function [difference]=ComputeDifferenceOfOptimumValue(c1,c2,a1,a2,map1,map2)
V1=SolveALM(c1,a1,map1);
V2=SolveALM(c2,a2,map2);
difference=V1-V2;
end