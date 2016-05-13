function [mfResponse] = meanTraces(vfTrace_dFF0, Orientation)

% 'vfTrace_dFF0' is a response trace, with one fluorescence value for each
% frame. 'Orientation' is a vector of values, with one entry for each frame
% in 'vfTrace_dFF0'; each entry indicates the stimulus drift direction used
% during that imaging frame, in degrees. The stimuli were presented in
% random order.

% This function has to use the stimulus information to de-randomise the
% response trace. You will create a variable 'mfResponse', which has
% dimensions (stimulus, frame_in_presentation).

% 'mfResponse' needs to contain the average response traces for each
% stimulus drift direction, averaged over three trials.

% How many stimuli were there?
nNumStimuli = 16;

% How many trials were there for each stimulus?
nNumTrials = 3;

% How many total stimulus presentations were there?
nTotalStimuli = nNumStimuli * nNumTrials;

% What was the duration of the "blank" stimulus?
tBlankDuration = 3.5; % seconds

% What was the duration of the "real" stimulus?
tStimDuration = 1.5;  % seconds

% What was the total duration of each stimulus presentation (blank + stim)?
tTotalStimDuration = tBlankDuration + tStimDuration;

% Estimate the frame rate of imaging. Hint: The function 'numel' returns
% how many elements there are in a vector.
tFrameRate = numel(vfTrace_dFF0) ./ (nTotalStimuli * tTotalStimDuration);

% How many frames were there in each stimulus presentation?
nTotalStimFrames = tTotalStimDuration .* tFrameRate;

% Allocate the return variable 'mfResponse'. Hint: the function 'zeros'
% creates a variable of specified dimensions.
mfResponse = zeros(nNumStimuli, nTotalStimFrames);

% Loop over presentations
for nPresentation = 1:nTotalStimuli
   % - Create a window for frames in 'vfTrace_dFF0' corresponding to this
   % stimulus presentation. Hint: (1:N) creates a vector of numbers
   % counting 1 2 3 ... N
   vnWindow = (1:nTotalStimFrames) + (nPresentation-1) * nTotalStimFrames; %#ok<BDSCI>
   
   % - Which stimulus direction was presented? This information is in
   % 'Orientation'. Convert it to an index into 'mfResponse'. Hint: The
   % directions span 360 degrees, and there are 16 of them.
   fThisOri = Orientation(vnWindow(1));
   nThisOriIndex = fThisOri / 360 * nNumStimuli;
   
   % - Add the frames from 'vfTrace_dFF0' into 'mfResponse'. You will need
   % to use the stimulus index for 'mfResponse' and the window you made for
   % 'vfTrace_dFF0'. Hint: mfResponse(nIndex, :) assigns something to all
   % the entries along the dimension with the ':'.
   mfResponse(nThisOriIndex, :) = mfResponse(nThisOriIndex, :) + vfTrace_dFF0(vnWindow);
end

% - Convert 'mfResponse' to an average by dividing by the number of trials
mfResponse = mfResponse ./ nNumTrials;
