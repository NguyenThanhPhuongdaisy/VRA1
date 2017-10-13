% THONG KE ANH TRAIN

function StatictisTrain(n)

    lblTrainAll=loadMNISTLabels('train-labels.idx1-ubyte');
    nTrainLabels = size(lblTrainAll);

    nResult = zeros(10,2);
    for i = 1 : nTrainLabels
        k = lblTrainAll(i);
        nResult(k+1,1) = nResult(k+1,1) + 1; 
    end

    fprintf('Thong ke:\n');
    for i = 1:10
        x = i - 1;
        nResult(i,1) = x;
        nResult(i,2) = sum(lblTrainAll == x);
        fprintf('So anh co nhan %d: %d\n', i-1, nResult(i,2));
    end
    
    disp(nResult); % Trinh bay noi dung cua bien ra man hinh.
    
    % luu file csv
    strFileName = ['E:\Q3', '.csv'];
    csvwrite(strFileName, nResult);
    
end
