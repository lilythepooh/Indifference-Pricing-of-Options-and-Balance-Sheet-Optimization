function [r]=GenerateARIMA(data)
Model = arima(1,1,1);
fit = estimate(Model,data);
r= simulate(fit,1,'NumPaths',10000,'Y0',data);
end