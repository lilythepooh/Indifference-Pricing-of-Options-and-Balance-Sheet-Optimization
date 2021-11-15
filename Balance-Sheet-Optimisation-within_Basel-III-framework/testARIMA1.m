function [pmse]=testARIMA()
HistoricReturn=CalculateHistoricReturn( );
%check the predictive 
RealHistoricReturn=zeros(7,8);
RealHistoricReturn(:,1:3)=HistoricReturn(:,4:6);
RealHistoricReturn(:,4)=HistoricReturn(:,8);
RealHistoricReturn(:,5)=HistoricReturn(:,18);
RealHistoricReturn(:,6)=HistoricReturn(:,20);
RealHistoricReturn(:,7:8)=HistoricReturn(:,23:24);
pmse=zeros(1,8);
for i=1:8
pmse(1,i)=calculatePMSE(RealHistoricReturn(:,i));
end
plot(pmse,'o');
end
