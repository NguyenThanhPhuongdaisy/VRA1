function TH3_Q7x()
    strData='train-images.idx3-ubyte';
    strDataLabel='train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain]=loadData(strData,strDataLabel);

    strData='t10k-images.idx3-ubyte';
    strDataLabel='t10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest]=loadData(strData,strDataLabel);

       
    Mdl=fitcknn(imgDataTrain',lblDataTrain); %ClassNames: [0 1 2 3 4 5 6 7 8 9].
    
    x=size(imgDataTest,2); % 10.000 anh test, so luong anh Test.
    
    A=zeros(10,10);

    for i=1:x
        lbla = lblDataTest(i);
        imga = imgDataTest(:, i);
        lblPredicta = predict(Mdl, imga');
        A(lbla + 1, lblPredicta + 1) = A(lbla + 1, lblPredicta + 1) + 1;
    end
    disp(A); % Trinh bay noi dung cua bien A ra man hinh.
    
    % write csv file
    strFileName = ['E:\Q7x', '.csv'];
    csvwrite(strFileName, A);
end