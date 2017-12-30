function TH4_Q6(n)
    imgTrainImagesAll = './imgTrainImagesAll.mat';
    lblTrainLabelsAll = './lblTrainLabelsAll.mat';
    imgTestImagesAll = './imgTestImagesAll.mat';
    lblTestLabelsAll = './lblTestLabelsAll.mat';

    fprintf('\n Load du lieu \n ');
    load(imgTestImagesAll);
    load(lblTestLabelsAll);
    load(imgTrainImagesAll);
    load(lblTrainLabelsAll)

       
    Mdl = fitcknn(double(imgTrainImagesAll'), lblTrainLabelsAll); 
    nTestImgs = size(imgTestImagesAll,2);
    
    nNumber=n;
    imgTest=imgTestImagesAll(:,nNumber);
    
    lblPredictTest=predict(Mdl,double(imgTest')); %Ma tran chuyen vi, chuyen anh tren 1 dong.
    lblImageTest = lblTestLabelsAll(n);
    figure;
    
    img2D=reshape(imgTest,112,92);
    imshow(img2D);
    
   
    strLabelImage='Frist: ';
    strLabelImage=[strLabelImage,num2str(lblImageTest)]; %Luu y
    strLabelImage=[strLabelImage,'(n=',num2str(n),')','-']; % Thu tu
    strLabelImage=[strLabelImage,'Predict: '];
    strLabelImage=[strLabelImage,num2str(lblPredictTest),'.'];
    
      
    if(lblPredictTest==lblImageTest)
        strLabelImage=[strLabelImage,'True '];
    else
        strLabelImage=[strLabelImage,'False '];
    end
    
    title(strLabelImage);
end