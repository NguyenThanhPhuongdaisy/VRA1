function BT022()
    figure;
    imgI=imread('E:\CONG NGHE THONG TIN\Cao hoc\Nhan dang thi giac va ung dung\Thuc hanh\cameraman.tif');
    arrPointI=detectHarrisFeatures(imgI);
    imgJ=imread('E:\CONG NGHE THONG TIN\Cao hoc\Nhan dang thi giac va ung dung\Thuc hanh\cameraman30.tif');
    arrPointJ=detectHarrisFeatures(imgJ);
    
    [arrfeatureI, arrValidPointI]=extractFeatures(imgI,arrPointI);
    [arrfeatureJ, arrValidPointJ]=extractFeatures(imgJ,arrPointJ);
    
    arrIndexPair=matchFeatures(arrfeatureI,arrfeatureJ);
    
    arrMatchedPointI=arrValidPointI(arrIndexPair(:,1),:);
    arrMatchedPointJ=arrValidPointJ(arrIndexPair(:,2),:);
    
    figure;   
    
    ax=axes;
    showMatchedFeatures(imgI,imgJ,arrMatchedPointI,arrMatchedPointJ,'montage','Parent',ax);
    
    title(ax,'Candidate point matches');
    legend(ax, 'Matched points I','Matched points J');
    
    
    
end