function Reconition002_digits()
    fprintf('\n Load du lieu train');
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    fprintf('\n Load du lieu test');
    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    
    nTrainImages=size(imgTrainAll,2);
    nTrainLabels=size(lblTrainAll,1);
    
    nTestImages=size(imgTestAll,2);
    nTestLabels=size(lblTestAll,1);
    
    nSizeofImage=size(imgTrainAll,1);
    
    fprintf('\n So luong anh train: [%d].',nTrainImages);
    fprintf('\n So luong nhan train: [%d].',nTrainLabels);
    fprintf('\n So luong anh test: [%d].',nTestImages);
    fprintf('\n So luong nhan test: [%d].',nTestLabels);
    fprintf('\n Kich thuoc cua mot anh: [%d].',nSizeofImage);
    
end    