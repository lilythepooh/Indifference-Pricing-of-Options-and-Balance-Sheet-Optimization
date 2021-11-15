function [pd]=ValidateLogReturnIndex()
y=GenerateLogReturnIndex();
x=y.';
pd=fitdist(x,'tLocationScale');
end