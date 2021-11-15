function [optimumValue]=SolveALM(c,a,map)
addpath 'c:\Program Files\mosek\8\toolbox\r2014a'
[res] = mskgpopt(c,a,map);
%the solution
v = c.*exp(a*res.sol.itr.xx);
% Add appropriate terms together.
f = sparse(map+1,1:100793,ones(size(map)))*v;
optimumValue=log(f(1));
end