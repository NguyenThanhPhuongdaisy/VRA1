%https://www.mathworks.com/help/stats/classificationknn-class.html
%% Mdl = fitcknn(X,Y,'NumNeighbors',5,'Standardize',1)
% Y — Class labels
% numeric vector | categorical vector | logical vector | character array | cell array of character vectors
% X — Predictor data
% numeric matrix
% X = meas;
% Y = species;
% Mdl = fitcknn(X,Y,'NumNeighbors',4);
%% Methods
% compareHoldout	Compare accuracies of two models using new data
% crossval	Cross-validated k-nearest neighbor classifier
% edge	Edge of k-nearest neighbor classifier
% loss	Loss of k-nearest neighbor classifier
% margin	Margin of k-nearest neighbor classifier
% predict	Predict labels using k-nearest neighbor classification model
% resubEdge	Edge of k-nearest neighbor classifier by resubstitution
% resubLoss	Loss of k-nearest neighbor classifier by resubstitution
% resubMargin	Margin of k-nearest neighbor classifier by resubstitution
% resubPredict	Predict resubstitution response of k-nearest neighbor classifier
%% Value	Description
% 'cityblock'	City block distance.
% 'chebychev'	Chebychev distance (maximum coordinate difference).
% 'correlation'	One minus the sample linear correlation between observations (treated as sequences of values).
% 'cosine'	One minus the cosine of the included angle between observations (treated as vectors).
% 'euclidean'	Euclidean distance.
% 'hamming'	Hamming distance, percentage of coordinates that differ.
% 'jaccard'	One minus the Jaccard coefficient, the percentage of nonzero coordinates that differ.
% 'mahalanobis'	Mahalanobis distance, computed using a positive definite covariance matrix C. The default value of C is the sample covariance matrix of X, as computed by nancov(X). To specify a different value for C, set the DistParameter property of mdl using dot notation.
% 'minkowski'	Minkowski distance. The default exponent is 2. To specify a different exponent, set the DistParameter property of mdl using dot notation.
% 'seuclidean'	Standardized Euclidean distance. Each coordinate difference between X and a query point is scaled, meaning divided by a scale value S. The default value of S is the standard deviation computed from X, S = nanstd(X). To specify another value for S, set the DistParameter property of mdl using dot notation.
% 'spearman'	One minus the sample Spearman's rank correlation between observations (treated as sequences of values).
% 
%% NumNeighbors=n; Distance=d;

function TH4_Q8(n, d)

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
    end
    x=0;
    
    for i=1:40
        x = x + A(i, i);
    end
    
    nCount=sum(x)
    fprintf('\n So luong mau khop dung: %d\n',nCount);
    a=size(lblTestLabelsAll',1)
    k=(nCount/a)*100  
end



