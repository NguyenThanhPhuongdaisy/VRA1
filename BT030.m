function BT030()
    strFolderDataTrain=fullfile('DataTrain');
    categories={'0','1','2','3','4','5','6','7','8','9'}; % train 10 model, upline t?ng model --> t dài.
    imdsDataTrain=imageDatastore(fullfile(strFolderDataTrain,categories),'LabelSource','foldernames');
    imdsDataTrain.ReadFcn=@(filename)readAndPrepprocessImage(filename);
    net = alexnet();
    featureLayer='fc7'; % fc6: 6,7 layer
    featuresDataTrain=activations(net,imdsDataTrain, featureLayer,'MiniBatchSize',32,'OutputAs','columns');
    lblDataTrain=imdsDataTrain.Labels;
    classifier=fitcknn(featuresDataTrain,lblDataTrain,'Learners','Linear','Coding','onevsall','ObservationsIn','columns');
    
    
    strFolderDataTest=fullfile('DataTest');
    categories={'0','1','2','3','4','5','6','7','8','9'};
    imdsDataTest=imageDatastore(fullfile(strFolderDataTest,categories),'LabelSource','foldernames');
    imdsDataTest.ReadFcn=@(filename)readAndPrepprocessImage(filename);
    featuresDataTest=activations(net,imdsDataTest, featureLayer,'MiniBatchSize',32);
    lblActualDataTest=imdsDataTest.Labels;
    lblResult=predict(classifier,featuresDataTest);
    nResult=(lblActualDataTest==lblResult);
    nCount=sum(nResult);
    fprintf('\n So luong mau dung: %d\',nCount);
    

end