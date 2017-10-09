% THONG KE ANH TRAIN

function StatictisTrain(n)

%   imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    nTrainLabels = size(lblTrainAll);

    nResult = zeros(10);

    for i = 1 : nTrainLabels
        k = lblTrainAll(i);
        nResult(k+1) = nResult(k+1) + 1;
    end

    fprintf('Thong ke:\n');
    for i = 1:10
        fprintf('So anh co nhan %d: %d\n', i-1, nResult(i));
    end

end
