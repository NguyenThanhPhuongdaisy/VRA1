function TH4_Q1(n)

    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu Train');
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll);
    figure;
    img = imgTrainImagesAll(:, n);
    img2D = reshape(img, 112, 92); 
    strLabelImage = ['Label:', num2str(lblTrainLabelsAll(n))];
    imshow(img2D); 
    title(strLabelImage);
end

