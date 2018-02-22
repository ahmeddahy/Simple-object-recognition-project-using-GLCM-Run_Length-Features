function [ class ] = MKNN_recognize(features,excelltrain)
training=readImagesFeatures(excelltrain);
[features training]=normalize(features,training);
Sorted_matrix=Sort_matrices(training,features);
k=0;
if strcmp(excelltrain,'Training_Features.xls')
    k=7;
end
if strcmp(excelltrain,'Training_Features(GLCM).xls')
    k=9;
end
if strcmp(excelltrain,'Training_Features(RL).xls')
    k=10;
end
class=KNN_Class(k,Sorted_matrix,features);
end

