function [  ] = readimage(path,excellsheet)
saveinexcell=[];
for j=1:5
    tmp=path;
    tmp=strcat(tmp,'\');
    tmp=strcat(tmp,num2str(j));
filenames = dir(fullfile(tmp, '*.jpg'));
num_images = length(filenames);
for i=1:num_images  
    filename=fullfile(tmp,filenames(i).name);
    img = imread(filename);
    feature=[];
    %feature=Run_Length(img);
    feature1=GLCM_Features(img ,[1 0]);
    feature2=GLCM_Features(img ,[0 1]);
    feature3=GLCM_Features(img ,[1 1]);
    final=(feature1+feature2+feature3)/3;
    feature=[final  j];
    saveinexcell=[saveinexcell;feature];
end
end
xlswrite(excellsheet,saveinexcell);
end