function [ res ] = extractClass(classNumber,Training_matrix)
 [h w z]=size(Training_matrix);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
indx=1;
res=[];
for i=1 :h
if(Training_matrix(i,w)==classNumber)
   res(indx,:)= Training_matrix(i,1:w-1);
   indx=indx+1;
end
end

end

