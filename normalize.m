function [ Testing_ Training_ ] = normalize( Testing,Training )
[h w z]=size(Training);
[a b c]=size(Testing);
for i=1:b-1
    mx=-1e9;
    mn=1e9;
    avg=0;
    for j=1:h
        avg=avg+Training(j,i);
        if mx<Training(j,i)
            mx=Training(j,i);
        end
        if(mn>Training(j,i))
            mn=Training(j,i);
        end
    end
    avg=avg/h;
    for j=1:a
        if(mx-mn~=0)
        Testing(j,i)=(Testing(j,i)-avg)/(mx-mn);
        end
    end
    for j=1:h
        if(mx-mn~=0)
        Training(j,i)=(Training(j,i)-avg)/(mx-mn);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [h w z]=size(Training_matrix);
% [a b c]=size(Testing_matrix);
% for i=1:b-1
%     mx=-1e9;
%     mn=1e9;
%     avg=0;
%     for j=1:a
%         avg=avg+Testing_matrix(j,i);
%         if mx<Testing_matrix(j,i)
%             mx=Testing_matrix(j,i);
%         end
%         if(mn>Testing_matrix(j,i))
%             mn=Testing_matrix(j,i);
%         end
%     end
%     avg=avg/a;
%     for j=1:a
%         if(mx-mn~=0)
%         Testing_matrix(j,i)=(Testing_matrix(j,i)-avg)/(mx-mn);
%         end
%     end
% end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% for i=1:w-1
%     mx=-1e9;
%     mn=1e9;
%     avg=0;
%     for j=1:h
%         avg=avg+Training_matrix(j,i);
%         if mx<Training_matrix(j,i)
%             mx=Training_matrix(j,i);
%         end
%         if(mn>Training_matrix(j,i))
%             mn=Training_matrix(j,i);
%         end
%     end
%     avg=avg/h;
%     for j=1:h
%         if(mx-mn~=0)
%         Training_matrix(j,i)=(Training_matrix(j,i)-avg)/(mx-mn);
%         end
%     end
% end
Training_=Training;
Testing_=Testing;
end

