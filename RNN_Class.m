function [ res ] = RNN_Class( R, Training_matrix , Testing_matrix  )

[a b] = size(Training_matrix);
[x y] = size(Testing_matrix);
for i=1:x
    freq=zeros(5);
    for j=1:a
        m=0;
        for n=1 :b-1
            m=m+((Testing_matrix(i,n)-Training_matrix(j,n))*(Testing_matrix(i,n)-Training_matrix(j,n)));
        end
        if m<=R*R
            freq(Training_matrix(j,b))=freq(Training_matrix(j,b))+1;
        end
    end
    mx=0;
    res=0;
    for j=1:5
        if(freq(j)>=mx)
            mx=freq(j);
            res=j;
        end
    end
end
end

