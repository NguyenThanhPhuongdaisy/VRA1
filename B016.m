function BT016()
    imgI=imread('E:\CONG NGHE THONG TIN\Cao hoc\Nhan dang thi giac va ung dung\Image\cameraman.jpg');
    imgI=rgb2gray(imgI);
    imwrite(imgI,'cameraman.tif');
    imgJ=imrotate(imgI,30);
    imwrite(imgJ,'cameraman30.tif');

end