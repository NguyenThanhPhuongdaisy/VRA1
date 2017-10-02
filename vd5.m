function Reconition005_Digits_kNN()
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    
    Mdl=fitcknn(imgTrainAll',lblTrainAll); % k m?c ??nh b?ng 1. Kho?ng cách eclipse=?
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTestImgs=size(imgTestAll,2);
    nNumber=randi([1 nTestImgs]);
    imgTest=imgTestAll(:,nNumber);
    lblPredictTest=predict(Mdl,imgTest'); %L?u ý ch? này. ': ma tr?n chuy?n v?, chuy?n ?nh trên 1 dòng.
    lblImageTest=lblTestAll(nNumber);
    figure;
    
    img2D=reshape(imgTest,28,28);
    imshow(img2D);
    
    strLabelImage='Ban dau';
    strLabelImage=[strLabelImage,num2str(lblTestAll(nNumber)),'.']; %L?u ý ch? này.
    strLabelImage=[strLabelImage,'Du doan: '];
    strLabelImage=[strLabelImage,num2str(lblPredictTest),'.'];
    
    if(lblPredictTest==lblImageTest)
        strLabelImage=[strLabelImage,'Ket qua dung '];
    else
        strLabelImage=[strLabelImage,'Ket qua sai '];
end