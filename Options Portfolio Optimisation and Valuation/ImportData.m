function [data]=ImportData( )
filename='20171115T160000.xlsx';
data=xlsread(filename,'B2:H397');
end