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
nNumStimuli = 

% How many trials were there for each stimulus?
nNumTrials = 

% How many total stimulus presentations were there (use variable names not numbers)?
nTotalStimuli = 

% What was the duration of the "blank" stimulus?
tBlankDuration = 

% What was the duration of the "real" stimulus?
tStimDuration = 

% What was the total duration of each stimulus presentation (blank + stim)? (use variable names not numbers)
tTotalStimDuration = 

% Estimate the frame rate of imaging. Hint: The function 'numel' returns
% how many elements there are in a vector. (use variable names not numbers)
tFrameRate = 

% How many frames were there in each stimulus presentation?
%(use variable names not numbers)
nTotalStimFrames = 

% Allocate the return variable 'mfResponse', which should be an empty matrix of zeros.
% Each row will eventually contain the average data of all triels from one stimulus.
% Each column will correspond to data from one time point with respect to the start of the stimulus
% Hint: the function 'zeros' and think how many frames per stimulus and how many stimuli
% creates a variable of specified dimensions. (use variable names not numbers)
mfResponse = 

% Loop over presentations
for nPresentation = 1:nTotalStimuli

   % ONE: 
   % You first need to create a set of index values that will pull out the frames
   % from 'vfTrace_dFF0' that correspond to this stimulus presentation. So the first
   % pass through the loop this will be 1:nTotalStimFrames, the second pass through the loop
   % it will 1+nTotalStimFrames:nTotalStimFrames*2  and so on
   %  Hint: (1:N) creates a vector of numbers that goes 1 2 3 ... N
   %  Remember that this will need to increment to the right value on each pass through the loop
   vnWindow = 
   
   % TWO:
   % Find the stimulus direction that was presented and assign this to fThisOri
   % The stimulus direction is in the Orientation vector. 
   % hint: You already know which indexes correspond to this orientation from vnWindow
   fThisOri = 

   % THREE:
   % Your variable mfResponse is a matrix in which each row comprises data from one stimulus. 
   % we need to figure out into which which row data from this orientation will go. To do this,
   % you now need to convert fThisOr (the orientation value) to an index that has a value between 1 and nNumStimuli 
   % Hint: The directions span 360 degrees, and there are 16 of them. 
   nThisOriIndex = 
   
   % FOUR:
   % - Add the dF/F data from 'vfTrace_dFF0' into the matrix 'mfResponse'. You will need
   % to use the stimulus index for 'mfResponse' and the window you made for
   % 'vfTrace_dFF0'. Hint: mfResponse(nIndex, :) assigns something to all
   % the entries along the dimension with the ':'.
   
end

% - Convert 'mfResponse' to an average by dividing by the number of trials
mfResponse = 
