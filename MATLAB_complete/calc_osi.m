function fOSI = calc_osi(vfMeanResp)

% 'vfMeanResp' is a vector containing the average response for each
% stimulus direction, with dimensions (1, stim). You must calculate the
% orientation selectivity index (OSI), as described in the handout.

nNumStimuli = 16;

% Find the preferred stimulus direction. Hint: The 'max' command also
% returns the index of the maximum value.
[~, vnPreferredOri] = max(vfMeanResp);

% Find the index of the stimulus 180º off from preferred. Hint: the 'mod'
% command will be helpful here.
vnPreferredOri(2) = mod(vnPreferredOri + nNumStimuli/2, nNumStimuli);

% Find the indices of the two stimuli orthogonal to the preferred stimulus
vnOrthogonalOri = mod(vnPreferredOri + nNumStimuli/4, nNumStimuli);

% Compute the averages of the "preferred" and "orthogonal" stimuli responses
fPreferredResp = mean(vfMeanResp(vnPreferredOri));
fOrthogonalResp = mean(vfMeanResp(vnOrthogonalOri));

% Compute the OSI using the preferred and orthogonal responses
fOSI = (fPreferredResp - fOrthogonalResp) ./ (fPreferredResp + fOrthogonalResp);
