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
tFrameRate =  numel(vfTrace_dFF0) ./ ( FILL_IN_THIS )

% How many frames were there in each trial (i.e. the blank and stim periods)?
%(use variable names not numbers)
nTotalTrialFrames = 

% Allocate the return variable 'mfResponse', which should be an empty
% matrix of zeros. You need to work out how big this matrix should be, and
% create it using the function 'zeros'.
% * Each row should be the correct size to contain the response to one
% stimulus, averaged over all trials.
% * Each column will correspond to data from one imaging frame, for a time
% point relative to the start of the stimulus.
% * Hint: Read "help zeros". Think how many frames there are per stimulus,
% and how many stimuli there are. Use variable names not numbers.
mfResponse = 



% Loop over presentations
%
% This bit is hard. 
% First read through all four steps below so you get an overview of what you're trying to do.
% Then fill in the four steps. 

for nPresentation = 1:nTotalStimuli % Use for loop to process each stimulus at a time

   % ONE: 
   % We will fill in the first line for you, but you need to understand what it does and why. 
   % The variable vnWindow is used to "index" (i.e. obtain) values (imaging frames) from
   % variable 'vfTrace_dFF0' that correspond to a single stimulus presentation. The stimulus
   % presentation is incremented (moved to the next one along) on each pass through the for loop.
   % So on the first pass through the loop, vnWindow equals 1:nTotalStimFrames, on the second 
   % pass through the loop it will be 1+nTotalStimFrames:nTotalStimFrames*2  and so on.
   % Remember that (1:N) creates a vector of numbers that goes 1 2 3 ... to N
   % You will use the variable vnWindow when you fill in the remaining lines.
   vnWindow = (1:nTotalTrialFrames) + (nPresentation-1) * nTotalTrialFrames;
    
   % TWO:
   % Find the stimulus direction that was presented and assign this to fThisOri
   % The stimulus direction is in the Orientation vector. 
   % hint: You already know which indexes correspond to this orientation from vnWindow
   firstIndexValue = %COMPLETE THIE LINE
   fThisOri = Orientation(firstIndexValue); %Do not edit this line

   % THREE:
   % The variable we are trying to build, mfResponse, will be a matrix in which each row 
   % comprises data from one stimulus. We need to figure out into which row data from the 
   % current orientation will go. To do this, you now need to convert fThisOri (the orientation 
   % value) to an index that has a value between 1 and nNumStimuli 
   % Hint: The directions span 360 degrees, and there are 16 of them. 
   nThisOriIndex = (fThisOri / FILL_IN_THIS) * FILL_IN_THIS  %COMPLETE THIS LINE
   
   % FOUR:
   % - Add the dF/F data from 'vfTrace_dFF0' into the matrix 'mfResponse'. You will need
   % to use the stimulus index for 'mfResponse' and the window you made for
   % 'vfTrace_dFF0'. Hint: mfResponse(nIndex, :) assigns something to all
   % the entries along the dimension with the ':'.
   % Remember that your task here is for each row to contain the average response to one stimulus.
   % So think what to enter here. HINT: look wht happens after the loop ends. 
   mfResponse(nThisOriIndex, :) = % COMPLETE THIS LINE
end

% - Convert 'mfResponse' to an average by dividing by the number of trials
mfResponse = mfResponse ./ FILL_IN_THIS % COMPLETE THIS LINE
