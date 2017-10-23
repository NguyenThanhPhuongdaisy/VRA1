function BT019()
    figure;
    imgI=imread('E:\CONG NGHE THONG TIN\Cao hoc\Nhan dang thi giac va ung dung\Thuc hanh\cameraman.tif');
    arrPointI=detectSURFFeatures(imgI);
    [arrfeatureI, arrValidPointI]=extractFeatures(imgI,arrPointI);
    figure;   
    imshow(imgI);
    arrSubValidPointI=arrValidPointI.selectStrongest(20);
    hold on;
    plot(arrSubValidPointI);

end