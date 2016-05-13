function vfMeanResp = makePolarPlot(mfResponse)

% 'mfResponse' is a variable with dimensions (num_stimuli, frames_per_stimulus)
% You will compute the average response for each stimulus, and return it in
% a variable 'vfMeanResp', which has one value per stimulus. You will also
% create a polar plot of the responses.

% Make a window of five frames that you think should encompass the peak
% response. Hint: (1:5) creates a vector of the numbers 1 2 3 4 5
vnPeakWindow = 17:21;

% Compute the mean response for each stimulus. Hint: take the mean of
% 'mfResponse' along the frames dimension.
vfMeanResp = mean(mfResponse(:, vnPeakWindow), 2);

% To make the polar plot, you need to know the orientation in radians for
% each stimulus. Hint: 'pi' returns the value of pi; 'linspace' creates a
% vector of equally spaced numbers between two values.
nNumStimuli = 16;
vfStimOri = linspace(0, 2*pi, nNumStimuli+1);
vfStimOri = vfStimOri(2:end)';

% Create a polar plot using the command 'polar'
figure;
axis;
set(gca, 'FontSize', 32, 'LineWidth', 2);
h = polar(vfStimOri([1:end 1]), vfMeanResp([1:end 1]));
set(h, 'LineWidth', 2);
