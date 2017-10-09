function TH3_Q5(n)
    imgTestAll = loadMNISTImages('t10k-images.idx3-ubyte');
    nTestImgs = size(imgTestAll);
    
    %n={5,500,900};
%     n=500;
%     for i=n
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    Mdl = fitcknn(imgTrainAll', lblTrainAll);
    imgTest = imgTestAll(:,n);
    imgPredict = predict(Mdl, imgTest');
    fprintf('Anh test thu: %d\nDuoc du doan la chu so: %d.\n',n,imgPredict);
%    end
end
