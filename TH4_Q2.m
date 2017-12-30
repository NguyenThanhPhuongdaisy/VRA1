function TH4_Q2(n)
    imgTrainImagesAll = './imgTrainImagesAll.mat';  %280
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';  %120
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu Test');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    figure;
    img = imgTestImagesAll(:, n);
    img2D = reshape(img, 112, 92); 
    strLabelImage = ['Label:', num2str(lblTestLabelsAll(n))];
    imshow(img2D); 
    title(strLabelImage);
    
end

