function [ res ] = KNN_Class(K , Sorted_Matrix,Testing_matrix)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[h w z]=size(Testing_matrix);
for i=1 :h
    freq=zeros(5);
    d1=Sorted_Matrix{i,1};
    d1=d1(1);
    dk=Sorted_Matrix{i,K};
    dk=dk(1);
    if(K==1)
        res=Sorted_Matrix{i,1};
        res=res(2);
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
end
end