%optimise balance sheet subject to all the constraint
function [dx]=OptimiseBalanceSheet( )
A=CalculateUneqCoeff( );
b=ComputeUneqBound( );
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[~,ne]=size(Equity);
%equality constraint coefficient matrix of positive change
Aeqp=zeros(2,na+nl+ne);
Aeqp(1,1:na)=1;
Aeqp(2,na+1:na+nl+ne)=1;
%equality constraint coefficient matrix of all change
Aeq=[Aeqp,-Aeqp];
wt=generateBalanceSheetGrowthRate( );
beq=[wt;wt];
AssetProp=CalculateHistoricAssetProportionOfLastYear();
LiabilityProp=CalculateHistoricLiabilityProportionOfLastYear();
EquityProp=CalculateHistoricEquityProportionOfLastYear();
lb=zeros(2*(na+nl+ne),1);
%each items increase by no higher than 30% of the whole balance sheet amount
ubp=0.3*ones(1,na+nl+ne);
%reduce by no higher than the original proportion
ubn=[AssetProp,LiabilityProp,EquityProp];
ub=[ubp,ubn]';
nonlinCon=@NonlinearConstraint;
fun=@Disutility;
x0=zeros(2*(na+nl+ne),1);%initial point 0
options = optimoptions('fmincon','Display','iter',...
    'Algorithm','sqp','PlotFcn',@optimplotx);
[x] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlinCon,options);
%total net change is increase minus reduce
dx=x(1:na+ne+nl,1)-x(na+nl+ne+1:2*(na+nl+ne),1);
end