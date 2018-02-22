function [ features ] = Extract_Features_image(img,excell_train)
features=[];
if strcmp(excell_train,'Training_Features.xls')
    features=Run_Length(img);
    feature1=GLCM_Features(img ,[1 0]);
    feature2=GLCM_Features(img ,[0 1]);
    feature3=GLCM_Features(img ,[1 1]);
    final=(feature1+feature2+feature3)/3;
    features=[features final  100];
end
if strcmp(excell_train,'Training_Features(GLCM).xls')
    feature1=GLCM_Features(img ,[1 0]);
    feature2=GLCM_Features(img ,[0 1]);
    feature3=GLCM_Features(img ,[1 1]);
    final=(feature1+feature2+feature3)/3;
    features=[final  100];
end
if strcmp(excell_train,'Training_Features(RL).xls')
    features=Run_Length(img);
    features=[features  100];
end
end

