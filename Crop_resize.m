function [Out,Boundary] = Crop_resize (Original_img,img)
Img_0_1=rgb2gray(img);
T = adaptthresh(Img_0_1);
Img_0_1=imbinarize(Img_0_1,T);
bounds = regionprops(Img_0_1, 'BoundingBox', 'Area' );
    [area, Index] = max([bounds.Area]);
    if(area>300)
    Final=imcrop(Original_img,[bounds(Index).BoundingBox(1),bounds(Index).BoundingBox(2),bounds(Index).BoundingBox(3),bounds(Index).BoundingBox(4)]); 
    Boundary=bounds(Index);
    Out = Final;
    else 
        Out=0;
        Boundary=0;
    end
  %  imshow(Out);
end