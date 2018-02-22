function [ output_args ] = Test_KNN(excel_train,excel_test)
Training_matrix=readImagesFeatures(excel_train);
Testing_matrix=readImagesFeatures(excel_test);
[Testing_matrix Training_matrix]=normalize(Testing_matrix,Training_matrix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
[h w z]=size(Training_matrix);
[a b c]=size(Testing_matrix);
Sorted_matrix=Sort_matrices(Training_matrix,Testing_matrix);
KvsAcuracy=zeros(h+1,2,'double');
Errors=zeros(h,'double');
K=zeros(h);
bestaccuracy=0;
mxk=0;
con=[];
for i=1 :h
    Confusion_matrix=KNN(i,Sorted_matrix,Testing_matrix);
    KvsAcuracy(i,1)=i;
    K(i)=i;
    KvsAcuracy(i,2)=100*sum(diag(Confusion_matrix))/sum(sum(Confusion_matrix));
    if(KvsAcuracy(i,2)>bestaccuracy)
        bestaccuracy=KvsAcuracy(i,2);
        mxk=i;
        con=Confusion_matrix;
    end
    Errors(i)=100*(sum(sum(Confusion_matrix))-sum(diag(Confusion_matrix)))/sum(sum(Confusion_matrix));
end
KvsAcuracy(h+1,1)=mxk;
KvsAcuracy(h+1,2)=bestaccuracy;
txt='Best K = ';
txt=strcat(txt,num2str(mxk));
txt=strcat(txt,' ,Accuracy = ');
txt=strcat(txt,num2str(round(bestaccuracy)));
figure
plot(K,Errors);
text(5,5,txt);
txt='';
txt=strcat(txt,num2str(con));
text(10,30,txt);
output_args=KvsAcuracy;
end