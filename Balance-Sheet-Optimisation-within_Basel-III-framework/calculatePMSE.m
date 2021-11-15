function [pmse]=calculatePMSE(data)
Model = arima(1,1,1);
fit = estimate(Model,data);
res = infer(fit,data);
pmse=mean(res.^2);
end