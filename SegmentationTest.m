function [ allObjects,allBoundary ] = SegmentationTest(ActualImage,ColoredImage )
%UNTITLED Summary of this function goes here
% %   Detailed explanation goes here
cnt1=0;
ColoredImage=rgb2gray(ColoredImage);
[h w]=size(ColoredImage);
val=max(max(ColoredImage));
cnt=0;
while val>0
    cnt=cnt+1;
    tmp=zeros(h, w,3);
for x=1:h
    for y=1:w
     if val-ColoredImage(x,y)<2 
          tmp(x,y,:)=ActualImage(x,y,:);
          ColoredImage(x,y)=0;
        end
    end
end
val=max(max(ColoredImage));
[object,boundary]=Crop_resize(ActualImage,tmp);
if(object==0)
    continue
end
cnt1=cnt1+1;
allObjects{cnt1}=object;
allBoundary{cnt1}=boundary;
% imgname=strcat(num2str(cnt1),'.jpg');
% imgname=strcat('F:\sem1\Pattern\Tasks\FinalProject\Data set\MyTesting\',imgname);
% imwrite(object,imgname);
end
end

