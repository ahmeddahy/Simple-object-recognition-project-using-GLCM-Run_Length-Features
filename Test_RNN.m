function [ output_args ] = Test_RNN(excel_train,excel_test)
Training_matrix=readImagesFeatures(excel_train);
Testing_matrix=readImagesFeatures(excel_test);
[Testing_matrix Training_matrix]=normalize(Testing_matrix,Training_matrix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=1000;
RvsAcuracy=zeros(h+1,2,'double');
Errors=zeros(h,'double');
R=zeros(h);
bestaccuracy=0;
mxr=0;
r=0;
con=[];
for i=1 :h
    Confusion_matrix=RNN(r,Training_matrix,Testing_matrix);
    RvsAcuracy(i,1)=r;
    RvsAcuracy(i,2)=100*sum(diag(Confusion_matrix))/sum(sum(Confusion_matrix));
    R(i)=r;
    if(RvsAcuracy(i,2)>bestaccuracy)
        bestaccuracy=RvsAcuracy(i,2);
        mxr=r;
        con=Confusion_matrix;
    end
    Errors(i)=100*(sum(sum(Confusion_matrix))-sum(diag(Confusion_matrix)))/sum(sum(Confusion_matrix));
    r=r+0.01;
end
RvsAcuracy(h+1,1)=mxr;
RvsAcuracy(h+1,2)=bestaccuracy;
txt='Best R = ';
txt=strcat(txt,num2str(mxr));
txt=strcat(txt,' ,Accuracy = ');
txt=strcat(txt,num2str(round(bestaccuracy)));
figure
plot(R,Errors);
text(5,5,txt);
txt='';
txt=strcat(txt,num2str(round(con)));
text(5,30,txt);
output_args=RvsAcuracy;
end

