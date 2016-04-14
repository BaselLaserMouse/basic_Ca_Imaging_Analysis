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

%% - 