function BT028()
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    nBins=144; % note
    
    nTrainImages=size(imgTrainAll,2);
    imgTrainAll_hist=zeros(nBins,nTrainImages);
    for i=1:nTrainImages
        imgI=imgTrainAll(:,i);
        img2D=reshape(imgI,28,28);
        [featureVector, hogVisualization]=extractHOGFeatures(img2D);
        imgTrainAll_hist(:,i)=featureVector;
    end
        
    Mdl=fitcecoc(imgTrainAll',lblTrainAll);
    
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    nTestImages=size(imgTestAll,2);
    imgTestAll_hist=zeros(nBins,nTestImages);
    for i=1:nTestImages
        imgI=imgTestAll(:,i);
        img2D=reshape(imgI,28,28);
        imgTestAll_hist(:,i)=extractHOGFeatures(img2D);
    end
        
    lblResult=predict(Mdl,imgTestAll_hist');
    nResult=(lblResult==lblTestAll);
    nCount=sum(nResult);
    fprintf('\n So luong mau dung: %d\',nCount);
end