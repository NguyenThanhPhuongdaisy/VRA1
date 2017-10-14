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

function TH3_Q8(n, d)

    strData='train-images.idx3-ubyte';
    strDataLabel='train-labels.idx1-ubyte';
    [imgDataTrain,lblDataTrain]=loadData(strData,strDataLabel);

    strData='t10k-images.idx3-ubyte';
    strDataLabel='t10k-labels.idx1-ubyte';
    [imgDataTest, lblDataTest]=loadData(strData,strDataLabel);

       
    Mdl=fitcknn(imgDataTrain',lblDataTrain, 'NumNeighbors', n,'Distance', d); 
    %ClassNames: [0 1 2 3 4 5 6 7 8 9].

    x=size(imgDataTest,2); % 10.000 anh test, so luong anh Test.
    
    A=zeros(10,10);

    for i=1:x
        lbla = lblDataTest(i);
        imga = imgDataTest(:, i);
        lblPredicta = predict(Mdl, imga');
        A(lbla + 1, lblPredicta + 1) = A(lbla + 1, lblPredicta + 1) + 1;
    end
    
    countTrue=0;
    countTrue= sum(lblPredicta==lblDataTest);
    rateTrue= countTrue/x*100;


end



