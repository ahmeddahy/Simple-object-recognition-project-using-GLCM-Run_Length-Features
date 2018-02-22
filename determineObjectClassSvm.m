function [ classNumber ] = determineObjectClassSvm( excel_train,testFeatures )
training=readImagesFeatures(excel_train);
[testing training]=normalize(testFeatures ,training);
catClass=extractClass(1,training);
labClass=extractClass(2,training);
appleClass=extractClass(3,training);
carClass=extractClass(4,training);
planeClass=extractClass(5,training);
[hTest wTest]=size(testing);
testingData=testing(:,1:wTest-1);
testingLabel=[];
finalResult=[];
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
[h w]=size(finalResult);
frequency=zeros(1,10);
classNumber=4;
for j=1 : w 
    frequency(1,finalResult(1,j))=frequency(1,finalResult(1,j))+1;
end
maxFreq=max(frequency);
for j=1 : w 
    if(maxFreq(1)==frequency(1,finalResult(1,j)))
        classNumber=finalResult(1,j);
        break;
    end
end
end

