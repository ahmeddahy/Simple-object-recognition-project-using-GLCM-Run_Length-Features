function [ img ] = Recognize( original,segmented,excell_train,classifier )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
[Objects Boundaries] = SegmentationTest(original,segmented);
[h w]=size(Objects);
for i=1:w
    features=Extract_Features_image(Objects{i},excell_train);
    class=0;
    if strcmp(classifier,'MKNN')
        class=MKNN_recognize(features,excell_train);
    end
    if strcmp(classifier,'RNN')
        class=RNN_recognize(features,excell_train);
    end
    if strcmp(classifier,'SVM')
        class=determineObjectClassSvm(excell_train,features);
    end
    mnx=Boundaries{i}.BoundingBox(1);
    mny=Boundaries{i}.BoundingBox(2);
    width=Boundaries{i}.BoundingBox(3);
    height=Boundaries{i}.BoundingBox(4);
 pos_rect =[mnx mny+height mnx mny mnx+width mny mnx+width mny+height];
 original = insertShape(original,'Polygon',pos_rect,'Color', 'red','Opacity',0.9);
 position=[mnx mny];
 text=recognizeClass(class);
 original = insertText(original,position,text,'FontSize',18,'BoxColor','red','BoxOpacity',0.4,'TextColor','white');
end
img=original;
end

