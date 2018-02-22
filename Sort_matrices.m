function [ Sorted_matrix ] = Sort_matrices( Training_matrix , Testing_matrix )
[a b L] = size(Training_matrix);
[x y S] = size(Testing_matrix);
for i=1 :x
    for j=1 :a
        m=0;
        for n=1 :b-1
          m=m+((Testing_matrix(i,n)-Training_matrix(j,n))*(Testing_matrix(i,n)-Training_matrix(j,n)));
        end
        Sorted_matrix{i,j}=[sqrt(m),Training_matrix(j,b)];
    end
    for j=1 :a-1
        q=j;
        for n=j+1 :a
            x=Sorted_matrix{i,q};
            y=Sorted_matrix{i,n};
            if x(1)>y(1)
                q=n;
            end
        end
        g=Sorted_matrix{i,q};        
        Sorted_matrix{i,q}=Sorted_matrix{i,j};
        Sorted_matrix{i,j}=g;
    end
end
end