function vfMeanResp = makePolarPlot(mfResponse)
% makePolarPlot
%
% makePolarPlot accepts a matrix of dF/F data for a range of orientation
% conditions and produces a polar plot of these. It also returns the average
% response for each orientation in the output variable "vfMeanResp"
%
% Input Arguments:
% 'mfResponse' is a variable with dimensions (num_stimuli, frames_per_stimulus)
% i.e. it has "num_stimuli" rows and "frames_per_stimulus" columns. Each row is
% averaged data from one orientation (multiple trial were averaged together). 
% Within each row, the columns are different time points. So if you were to plot 
% one row (e.g. plot(mfResponse(1,:)), you will see a line plot where the x axis 
% is time. If the cell responded to this plotted orientation, you would see a 
% peak corresponding to when the stimulus was was presented.
%
%
% Outputs
% 'vfMeanRes' is the mean evoked dF/F for each orientation. One value per orientation.
%
%



% Your task is to compute the average response for each stimulus, and return it in
% a variable 'vfMeanResp', which has one value per stimulus. You will also create 
% a polar plot of the responses.


% Make a window of five frames that you think should encompass the peak
% response. Hint: (1:5) creates a vector of the numbers 1 2 3 4 5
vnPeakWindow = 

% Compute the mean response for each stimulus. Hint: take the mean of
% 'mfResponse' along the frames dimension. vfMeanResp will automatically 
% be returned as an output of the function. 
vfMeanResp = 

% To make the polar plot, you need to know the orientation in radians for
% each stimulus (MATLAB thinks in radians not degrees). 
% Hints: a) 'pi' returns the value of pi and there are 2*pi radians in 360 degrees. 
%        b) 'linspace' creates a vector of equally spaced numbers between two values.
vfStimOri = 

% Create a polar plot using the command 'polar'
% Note: both input variables to polar should have the same size (they should both be row vectors or both be column vectors)
polar
