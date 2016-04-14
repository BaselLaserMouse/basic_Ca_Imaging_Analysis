function dff=calc_dF_F(data)
% function calc_dF_F(data)	
%
% Calculate df/f from data matrix (first col orientation and second col signal)
%


f0 = median(data(:,2));
dff=(data(:,2)-f0)/f0;