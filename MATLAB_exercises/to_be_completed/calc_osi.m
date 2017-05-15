function fOSI = calc_osi(vfMeanResp)

% 'vfMeanResp' is a vector containing the average response for each
% stimulus direction, with dimensions (1, stim). You must calculate the
% orientation selectivity index (OSI), as described in the handout.

nNumStimuli =

% Find the preferred stimulus direction. Hint: The 'max' command returns
% *two* values, one of which is the index of the maximum value.
vnPreferredOri(1) =

% Find the index of the stimulus 180 degrees off from preferred.
vnPreferredOri(2) = mod(vnPreferredOri + nNumStimuli/2 - 1, nNumStimuli) + 1;

% Find the indices of the two stimuli orthogonal to the preferred stimulus
vnOrthogonalOri = mod(vnPreferredOri + nNumStimuli/4 - 1, nNumStimuli) + 1;

% Compute the averages of the "preferred" and "orthogonal" stimuli responses
% Hint: use vnPreferredOri and vnOrthogonalOri to index vfMeanResp

% Compute the OSI using the preferred and orthogonal responses

