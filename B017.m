function BT017()
    figure;
    imgI=imread('E:\CONG NGHE THONG TIN\Cao hoc\Nhan dang thi giac va ung dung\Thuc hanh\cameraman.tif');
    imshow(imgI);
    points=detectSURFFeatures(imgI);
    hold on;
    subpoints=points.selectStrongest(20);
    plot(subpoints);
    

end