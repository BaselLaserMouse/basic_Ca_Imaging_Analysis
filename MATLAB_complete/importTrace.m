function data=importTrace(fname,option)
% function data=importTrace(fname,option)
%
% Import an Excel file, fname, created by ImageJ ROI timeseries
% 
% Inputs
% fname - the relative path to an Excel file. The second column
% of the file contains the time series data. 
%
% option - 1 is to use together with Icy
%          2 requires some excel pre-changes or some imageJ manipulation

if option == 1
	data = xlsread(fname); %read data from our cell

	%read orientation data from spreadsheet
	orientations = xlsread('Analysis_of_calcium_imaging_data.xlsx');

	%replace frist column of data matrix with orientations
	data(:,1) = orientations(:,1);
    


elseif option == 2
	data = xlsread(fname); %read data from the modified excel sheet
    
end




figure,plot(data)
hold on
yl=get(gca,'YLim');
for ii=1:10
    line(218*ii*[1 1],yl,'Color','r')
end