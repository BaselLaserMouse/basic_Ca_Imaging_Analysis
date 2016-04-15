function vfTrace = get_roi_trace(tfStack)

disp('Draw an ellipse, then double-click to extract the trace');

imtool(mean(tfStack, 3), [0 5]);
h = imellipse(imgca());
maskPos = wait(h);
if ~isempty(maskPos)
    mbROIMask = createMask(h);
else
    disp('Hey, you have to select a ROI!')
    mbROIMask = [];
end
close(imgcf());

% - extract ROI trace
tfStackStretch = reshape(tfStack, 256*256, []);
mfROIPixels = tfStackStretch(reshape(mbROIMask, 256*256, []), :);

vfTrace = mean(mfROIPixels);
