function [ class ] = RNN_recognize( features,excelltrain )
training=readImagesFeatures(excelltrain);
[features training]=normalize(features,training);
r=0.0;
if strcmp(excelltrain,'Training_Features.xls')
    r=0.51;
end
if strcmp(excelltrain,'Training_Features(GLCM).xls')
    r=0.16;
end
if strcmp(excelltrain,'Training_Features(RL).xls')
    r=0.46;
end
class=RNN_Class(r,training,features);
end

