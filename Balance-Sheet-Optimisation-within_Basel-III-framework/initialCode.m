function [year,na,nl,ne]=initialCode( )
Asset=xlsread('Asset.xls');
[~,na]=size(Asset);
Liability=xlsread('Liability.xls');
[~,nl]=size(Liability);
Equity=xlsread('Equity.xls');
[year,ne]=size(Equity);
end