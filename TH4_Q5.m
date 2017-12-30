function TH4_Q5(n)
    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu \n ');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll);
    
    nTestImgs = size(imgTestImagesAll);

    
   Mdl = fitcknn(double(imgTrainImagesAll'), lblTrainLabelsAll);
    
    imgTest = imgTestImagesAll(:,n);
    lblPredictTest = predict(Mdl, double(imgTest'));
    
    figure;
    img2D=reshape(imgTest,112,92);
    imshow(img2D);
    
    strLabelImage=num2str(lblPredictTest);
    strLabelImage=[strLabelImage,'(n=',num2str(n),')'];
    title(strLabelImage);
    
    
    fprintf('Anh test thu: %d\nDuoc du doan la face so: %d.\n',n,lblPredictTest);

end
