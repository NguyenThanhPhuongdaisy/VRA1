function displayimage(n)
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    Mdl=fitcknn(imgTrainAll',lblTrainAll); 
    
    nTrainImages=size(imgTrainAll,2);
    
    img=imgTrainAll(:,n);
    img2D=reshape(img,28,28);
    strLabelImage=num2str(lblTrainAll(n));
    strLabelImage=[strLabelImage,'(',num2str(n),')'];
    imshow(img2D);
    title(strLabelImage);


end

