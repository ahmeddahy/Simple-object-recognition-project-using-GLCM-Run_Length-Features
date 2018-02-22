function [ svm_results ] = train2Classes( Class1,Class2,classNumber1,classNumber2 ,testingData,testingLabel,type)
[fH fW]=size(Class1);
[oH oW]=size(Class2);
trainingdata=[Class1;Class2];
Label1=zeros(fH);
for i = 1:fH
    Label1(i)=classNumber1;
end
Label2=zeros(oH);
for i = 1:oH
    Label2(i)=classNumber2;
end
Label1tmp=Label1(:,1);
Label2tmp=Label2(:,1);

trainingLabels=[Label1tmp;Label2tmp];
SVMStruct=[];

if strcmp(type,'Training_Features.xls')
SVMStruct = svmtrain(trainingdata,trainingLabels,'kernel_function','linear');
elseif strcmp(type,'Training_Features(GLCM).xls')
SVMStruct = svmtrain(trainingdata,trainingLabels,'kernel_function','quadratic');
else 
SVMStruct = svmtrain(trainingdata,trainingLabels,'kernel_function','rbf');    
end

svm_results=svmclassify(SVMStruct,testingData);

end

