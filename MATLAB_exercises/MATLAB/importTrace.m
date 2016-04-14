function data=importTrace(fname)
% function data=importTrace(fname)
%
% Import an Excel file, fname, created by ImageJ ROI 
% 
% Inputs
% fname - the relative path to an Excel file. The second column
% of the file contains the time series data. 


%READ CONTENTS OF FNAME INTO THE VARIABLE data USING THE COMMAND xlsread
data = %YOUR CODE HERE

%read orientation data from spreadsheet (AS ABOVE)
orientations = %YOUR CODE HERE

%replace frist column of data matrix with orientations
data(:,1) = %YOUR CODE HERE
    
