% THONG KE ANH TEST

function TH4_Q4(n)

    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu Train');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    
    nTestLabels = size(lblTestLabelsAll);
    lblnum = unique(lblTestLabelsAll(1,:)) % 40 nhãn.
    lblnum = size(lblnum',1)   

    nResult = zeros(lblnum,2);
    for i = 1 : nTestLabels
        k = lblTestLabelsAll(i);
        nResult(k+1,1) = nResult(k+1,1) + 1;  %nResult(k+1,1) = nResult(k+1,1) + 1; 
    end

    fprintf('Thong ke:\n');
    for i = 1:(lblnum+1)
        x = i - 1;
        nResult(i,1) = x;
        nResult(i,2) = sum(lblTestLabelsAll == x);
        fprintf('So anh co nhan %d: %d\n', i-1, nResult(i,2));
    end
    
    disp(nResult); % Trinh bay noi dung cua bien ra man hinh.
    
    % luu file csv
    strFileName = ['E:\TH4_Q4', '.csv'];
    csvwrite(strFileName, nResult);
    
end
