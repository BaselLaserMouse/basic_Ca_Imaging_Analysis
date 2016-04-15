function vfMeanResp = makePolarPlot(mfResponse)

% 'mfResponse' is a variable with dimensions (num_stimuli, frames_per_stimulus)
% You will compute the average response for each stimulus, and return it in
% a variable 'vfMeanResp', which has one value per stimulus. You will also
% create a polar plot of the responses.

% Make a window of five frames that you think should encompass the peak
% response. Hint: (1:5) creates a vector of the numbers 1 2 3 4 5
vnPeakWindow = 

% Compute the mean response for each stimulus. Hint: take the mean of
% 'mfResponse' along the frames dimension.
vfMeanResp = 

% To make the polar plot, you need to know the orientation in radians for
% each stimulus. Hint: 'pi' returns the value of pi; 'linspace' creates a
% vector of equally spaced numbers between two values.
vfStimOri = 

% Create a polar plot using the command 'polar'
polar