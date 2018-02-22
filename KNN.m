function [ Confusion_matrix ] = KNN( K , Sorted_Matrix,Testing_matrix )
Confusion_matrix=zeros(5,5);
[h w z]=size(Testing_matrix);
for i=1 :h
    freq=zeros(5);
    d1=Sorted_Matrix{i,1};
    d1=d1(1);
    dk=Sorted_Matrix{i,K};
    dk=dk(1);
    if(K==1)
        res=Sorted_Matrix{i,1};
        Confusion_matrix(Testing_matrix(i,w),res(2))=Confusion_matrix(Testing_matrix(i,w),res(2))+1;
        continue;
    end
    for j=1 :K
        x=Sorted_Matrix{i,j};
        freq(x(2))=freq(x(2))+((dk-x(1))/(dk-d1));
    end
    mx=0;
    res=0;
    for j=1 :5
        if(freq(j)>mx)
            mx=freq(j);
            res=j;
        end
    end
    Confusion_matrix(Testing_matrix(i,w),res)=Confusion_matrix(Testing_matrix(i,w),res)+1;
end
end