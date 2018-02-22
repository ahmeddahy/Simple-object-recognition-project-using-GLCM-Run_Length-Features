function [ result ] = normalizeTesting(Testing_matrix)
[a b c]=size(Testing_matrix);
for i=1:b
    mx=-1e9;
    mn=1e9;
    avg=0;
    for j=1:a
        avg=avg+Testing_matrix(j,i);
        if mx<Testing_matrix(j,i)
            mx=Testing_matrix(j,i);
        end
        if(mn>Testing_matrix(j,i))
            mn=Testing_matrix(j,i);
        end
    end
    avg=avg/a;
    for j=1:a
        if(mx-mn~=0)
         Testing_matrix(j,i)=(Testing_matrix(j,i)-mn)/(mx-mn);
        end
    end
end
    result=Testing_matrix;
end

