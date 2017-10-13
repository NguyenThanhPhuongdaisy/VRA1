function TH3_Q6(n)
    strData='train-images.idx3-ubyte';
    strDataLabel='train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain]=loadData(strData,strDataLabel);

    strData='t10k-images.idx3-ubyte';
    strDataLabel='t10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest]=loadData(strData,strDataLabel);

       
    Mdl=fitcknn(imgDataTrain',lblDataTrain); 
    
    nTestImgs=size(imgDataTest,2); % 10.000 anh test.
    nNumber=n;
    imgTest=imgDataTest(:,nNumber);
    
    lblPredictTest=predict(Mdl,imgTest'); %Ma tran chuyen vi, chuyen anh tren 1 dong.
    lblImageTest = lblDataTest(n);
    figure;
    
    img2D=reshape(imgTest,28,28);
    imshow(img2D);
    
   
    strLabelImage='Frist: ';
    strLabelImage=[strLabelImage,num2str(lblImageTest)]; %Luu y
    strLabelImage=[strLabelImage,'(',num2str(n),')','-']; % Thu tu
    strLabelImage=[strLabelImage,'Predict: '];
    strLabelImage=[strLabelImage,num2str(lblPredictTest),'.'];
    
      
    if(lblPredictTest==lblImageTest)
        strLabelImage=[strLabelImage,'True '];
    else
        strLabelImage=[strLabelImage,'False '];
    end
    
    title(strLabelImage);
end