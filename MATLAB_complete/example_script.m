% - Load the imaging data
tfStack = double(TIFFStack('../MATLAB_exercises/Calcium_imaging_data_int8.tif'));

%% - Compute and display the mean image
meanIM = mean(tfStack, 3);
figure;
imagesc(meanIM);

%% - Show a video of the stack

PlayStack(tfStack);

%% - Use the ROI selection tool to draw a ROI and export the time trace

mbROIMask = false(size(meanIM));
mbROIMask(207:219, 106:119) = true;

tfStack = reshape(tfStack, 256*256, []);
mfROIPixels = tfStack(reshape(mbROIMask, 256*256, []), :);

vfTrace = mean(mfROIPixels);

%% - Compute dF/F0

fF0 = median(vfTrace);
vfTrace_dFF0 = (vfTrace - fF0) ./ fF0;

%% - Load data describing orientation stimuli

load('../MATLAB_exercises/ori_stimuli.mat');

%% - Extract responses for each orientation

nNumStimuli = 16;
nNumTrials = 3;
nTotalStimuli = nNumStimuli * nNumTrials;
tBlankDuration = 3.5; % seconds
tStimDuration = 1.5;  % seconds
tTotalStimDuration = tBlankDuration + tStimDuration;

tFrameRate = numel(vfTrace_dFF0) ./ (nTotalStimuli * tTotalStimDuration);

nTotalStimFrames = tTotalStimDuration .* tFrameRate;

% - Preallocate response matrix
mfResponse = nan(nNumStimuli, nTotalStimFrames, nNumTrials);

% - Loop over presentations
vnStimTrialIndex = ones(nNumStimuli, 1);
for (nPresentation = 1:nTotalStimuli)
   % - Create window for frames for this stimulus presentation
   vnWindow = (1:nTotalStimFrames) + (nPresentation-1) * nTotalStimFrames; %#ok<BDSCI>
   
   % - Which orientation was presented?
   fThisOri = Orientation(vnWindow(1));
   nThisOriIndex = fThisOri / 360 * nNumStimuli;
   
   % - Insert these frames into the response matrix
   mfResponse(nThisOriIndex, :, vnStimTrialIndex(nThisOriIndex)) = vfTrace_dFF0(vnWindow);
   
   % - Increment the trial index counter
   vnStimTrialIndex(nThisOriIndex) = vnStimTrialIndex(nThisOriIndex) + 1;
end


%% - Plot the responses

% - Trial-averaged responses
figure;
plot(mean(mfResponse, 3)');

% - Global average response
figure;
plot(mean(mean(mfResponse, 3), 1));


%% - Compute stimulus trial peak and mean responses, make polar plot

vnPeakWindow = 17:21;

vfMeanResp = mean(mean(mfResponse(:, vnPeakWindow, :), 2), 3);

vfStimOri = linspace(0, 2*pi, nNumStimuli+1);
vfStimOri = vfStimOri(2:end)';
figure;
polar(vfStimOri([1:end 1]), vfMeanResp([1:end 1]));


%% - Determine preferred and orthogonal responses

[~, vnPreferredOri] = max(vfMeanResp);
vnPreferredOri(2) = mod(vnPreferredOri + nNumStimuli/2, nNumStimuli);
vnOrthogonalOri = mod(vnPreferredOri + nNumStimuli/4, nNumStimuli);

fPreferredResp = mean(vfMeanResp(vnPreferredOri));
fOrthogonalResp = mean(vfMeanResp(vnOrthogonalOri));

fOSI = (fPreferredResp - fOrthogonalResp) ./ (fPreferredResp + fOrthogonalResp);

