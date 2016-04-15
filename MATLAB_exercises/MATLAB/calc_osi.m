function fOSI = calc_osi(vfMeanResp)

nNumStimuli = 16;

[~, vnPreferredOri] = max(vfMeanResp);
vnPreferredOri(2) = mod(vnPreferredOri + nNumStimuli/2, nNumStimuli);
vnOrthogonalOri = mod(vnPreferredOri + nNumStimuli/4, nNumStimuli);

fPreferredResp = mean(vfMeanResp(vnPreferredOri));
fOrthogonalResp = mean(vfMeanResp(vnOrthogonalOri));

fOSI = (fPreferredResp - fOrthogonalResp) ./ (fPreferredResp + fOrthogonalResp);
