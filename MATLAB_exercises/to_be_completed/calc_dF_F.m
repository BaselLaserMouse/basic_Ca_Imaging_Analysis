function vfTrace_dFF0 = calc_dF_F(vfTrace)

% 'vfTrace' is a vector of raw fluorescence values for each frame. Compute
% the 'F0' value, which is the median of the trace. Then compute (F-F0)/F0,
% and return the result in a variable 'vfTrace_dFF0'.