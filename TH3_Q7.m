function TH3_Q7(n)
    strData='train-images.idx3-ubyte';
    strDataLabel='train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain]=loadData(strData,strDataLabel);

    strData='t10k-images.idx3-ubyte';
    strDataLabel='t10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest]=loadData(strData,strDataLabel);

       
    Mdl=fitcknn(imgDataTrain',lblDataTrain); %ClassNames: [0 1 2 3 4 5 6 7 8 9].
    
    x=size(imgDataTest,2); % 10.000 anh test, so luong anh Test.
    y = []; % Mang chua so luong anh Test.
    for i = 1:x
       if (lblDataTest(i) == n)
          y = [y, imgDataTest(:, i)];
       end
    end
    
    countFail = 0;
    for i = 1:size(y,2)
        imgTest = y(:, i);
        lblPredictTest = predict(Mdl, imgTest');
        if (lblPredictTest ~= n)
            countFail = countFail + 1;
        end
    end
    fprintf('So anh co nhan %d bi nhan dang sai la %d\n', n, countFail);
  
end