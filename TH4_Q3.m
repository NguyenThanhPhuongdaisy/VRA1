% THONG KE ANH TRAIN

function TH4_Q3(n)

    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu Train');
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll);
    
    nTrainLabels = size(lblTrainLabelsAll);
    lblnum = unique(lblTrainLabelsAll(1,:)) % 40 nhãn.
    lblnum = size(lblnum',1)   

    nResult = zeros(lblnum,2);
    for i = 1 : nTrainLabels
        k = lblTrainLabelsAll(i);
        nResult(k+1,1) = nResult(k+1,1) + 1;  %nResult(k+1,1) = nResult(k+1,1) + 1; 
    end

    fprintf('Thong ke:\n');
    for i = 1:(lblnum+1)
        x = i - 1;
        nResult(i,1) = x;
        nResult(i,2) = sum(lblTrainLabelsAll == x);
        fprintf('So anh co nhan %d: %d\n', i-1, nResult(i,2));
    end
    
    disp(nResult); % Trinh bay noi dung cua bien ra man hinh.
    
    % luu file csv
    strFileName = ['E:\TH4_Q3', '.csv'];
    csvwrite(strFileName, nResult);
    
end
