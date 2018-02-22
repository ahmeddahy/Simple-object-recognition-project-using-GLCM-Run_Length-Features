function [ accuracy ] = TrainSVMandTest(excel_train,excel_test)
training=readImagesFeatures(excel_train);
testing=readImagesFeatures(excel_test);
[testing training]=normalize(testing ,training);
catClass=extractClass(1,training);
labClass=extractClass(2,training);
appleClass=extractClass(3,training);
carClass=extractClass(4,training);
planeClass=extractClass(5,training);
finalResult=[];
% testing=xlsread('Testing_Features.xls');
[hTest wTest]=size(testing);
testingData=testing(:,1:wTest-1);
% testingData=normalizeTesting(testingData);
testingLabel=testing(:,wTest);

%%%%%%%%%% cat with lab
result=train2Classes(catClass,labClass,1,2,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% cat with apple
result=train2Classes(catClass,appleClass,1,3,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% cat with car
result=train2Classes(catClass,carClass,1,4,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% cat with plane
result=train2Classes(catClass,planeClass,1,5,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% lab with apple
result=train2Classes(labClass,appleClass,2,3,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% lab with car
result=train2Classes(labClass,carClass,2,4,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% lab with plane
result=train2Classes(labClass,planeClass,2,5,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% apple with car
result=train2Classes(appleClass,carClass,3,4,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%% apple with plane
result=train2Classes(appleClass,planeClass,3,5,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%%%% car with plane
result=train2Classes(carClass,planeClass,4,5,testingData,testingLabel,excel_train);
finalResult=[finalResult result];
%%%%%%%%%%
%finalResult
[h w]=size(finalResult);

finalTesting=[];
for i=1 : h
   frequency=zeros(10); 
   for j=1: w
       frequency(finalResult(i,j))=frequency(finalResult(i,j))+1;
   end
    maxFreq=max(frequency);
    for j=1:w
       if(frequency(finalResult(i,j))==maxFreq(1))
           finalTesting=[finalTesting ; finalResult(i,j)];
           break;
       end
    end
end
correct=0.0;

for i = 1:length(finalTesting)
    if(finalTesting(i)==testingLabel(i))
        correct=correct+1.0;
    end 
end
accuracy=100.0*correct/length(finalTesting);
txt='Accuracy = ';
txt=strcat(txt,num2str(round(accuracy)));
figure
%plot([1 2 3 4 5 6 7 8 9 10],[1 2 3 4 5 6 7 8 9 10]);
text(0.2,0.2,txt);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% fakeFrames=xlsread('fakeTrain.xls');
% OriginalFrames=xlsread('originalTrain.xls');
% [fH fW]=size(fakeFrames);
% [oH oW]=size(OriginalFrames);
% trainingdata=[fakeFrames;OriginalFrames];
% testingData=xlsread('testingData.xls');
% fakeLabel=cell(fH,1);
% for i = 1:fH
%     fakeLabel{i}='fake';
% end
% originalLabel=cell(oH,1);
% for i = 1:oH
%     originalLabel{i}='original';
% end
% 
% trainingLabels=[fakeLabel;originalLabel];
% [~,~,testingLabels]=xlsread('testingLabel.xls');
% options.MaxIter = 100000;
% SVMStruct = svmtrain(trainingdata,trainingLabels, 'Options', options,'Kernel_Function', 'mlp');
% svm_results=svmclassify(SVMStruct,testingData);
% correct=0.0;
% for i = 1:length(svm_results)
%     if(strcmp(svm_results{i},testingLabels{i}));
%         correct=correct+1.0;
%     end 
% end
% accuracy=100.0*correct/length(svm_results);
% end
% 
