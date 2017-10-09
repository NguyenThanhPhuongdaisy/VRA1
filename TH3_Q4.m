% THONG KE ANH TEST

function StatictisTest(n)

    imgTestAll=loadMNISTImages('t10k-images.idx3-ubyte');
    lblTestAll=loadMNISTLabels('t10k-labels.idx1-ubyte');
    nTestImgs=size(imgTestAll,2);
    
    nTestLabels = size(lblTestAll);
    
    nResult = zeros(10);

    for i = 1 : nTestLabels
        k = lblTestAll(i);
        nResult(k+1) = nResult(k+1) + 1;
    end

    fprintf('Thong ke:\n');

    for i = 1:10
        fprintf('So anh co nhan %d: %d\n', i-1, nResult(i));
    end

end
