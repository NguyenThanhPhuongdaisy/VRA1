function TH4_Q7x()

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
    x = size(imgTestImagesAll,2);

      
    A=zeros(40,40);

    for i=1:x
        lbla = lblTestLabelsAll(i);
        imga = imgTestImagesAll(:, i);
        lblPredicta = predict(Mdl,double(imga'));
        A(lbla, lblPredicta) = A(lbla, lblPredicta) + 1;
        
        %A(lbla + 1, lblPredicta + 1) = A(lbla + 1, lblPredicta + 1) + 1;
    end
    disp(A); % Trinh bay noi dung cua bien A ra man hinh.
    
    % write csv file
    strFileName = ['E:\TH4_Q7x', '.csv'];
    csvwrite(strFileName, A);
end