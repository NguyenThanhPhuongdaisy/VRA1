function BT013()
    strData='train-images.idx3-ubyte';
    strDataLabel='train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain]=loadData(strData,strDataLabel);
    
    featuresDataTrain=extractFeaturesLBP(imgDataTrain);
    
    Mdl=fitcknn(featuresDataTrain',lblDataTrain);
    
    %% Load Data Test
    strData='t10k-images.idx3-ubyte';
    strDataLabel='t10k-labels.idx1-ubyte';
    [imgDataTest, lblActualDataTest]=loadData(strData,strDataLabel);
    featuresDataTest=extractFeaturesLBP(imgDataTest);
    
    %% Save Result
    
    lblResult=predict(Mdl,featuresDataTest');
    nResult=(lblResult==lblActualDataTest);
    nCount=sum(nResult);
    fprintf('\n So luong mau khop dung: %d\n',nCount);
    a=size(lblActualDataTest);
    k=(nCount\a*100);
    fprintf('\n a: %d\n',a);
    fprintf('\n Ty le mau khop dung: %0.2f\n',k);


end