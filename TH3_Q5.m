function TH3_Q5(n)
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    nTestImgs = size(imgTestAll);

    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    imgTest = imgTestAll(:,n);
    lblPredictTest = predict(Mdl, imgTest');
    
    figure;
    img2D=reshape(imgTest,28,28);
    imshow(img2D);
    
    strLabelImage=num2str(lblPredictTest);
    strLabelImage=[strLabelImage,'(',num2str(n),')'];
    title(strLabelImage);
    
    
    fprintf('Anh test thu: %d\nDuoc du doan la chu so: %d.\n',n,lblPredictTest);

end
