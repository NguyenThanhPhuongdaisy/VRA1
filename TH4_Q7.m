function TH4_Q7(n)
    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu \n ');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll);

       
    Mdl = fitcknn(double(imgTrainImagesAll'), lblTrainLabelsAll); 
    nTestImgs = size(imgTestImagesAll,2);
    
    x=size(imgTestImagesAll,2); % 10.000 anh test, so luong anh Test.
    y = []; % Mang chua so luong anh Test.
    for i = 1:x
       if (lblTestLabelsAll(i) == n)
          y = [y, imgTestImagesAll(:, i)];
       end
    end
    
    countFail = 0;
    for i = 1:size(y,2)
        imgTest = y(:, i);
        lblPredictTest = predict(Mdl, double(imgTest'));
        if (lblPredictTest ~= n)
            countFail = countFail + 1;
        end
    end
    fprintf('So anh co nhan %d bi nhan dang sai la %d\n', n, countFail);
  
end