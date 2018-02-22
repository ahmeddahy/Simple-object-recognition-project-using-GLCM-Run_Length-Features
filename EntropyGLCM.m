function [result] = EntropyGLCM(matrix)
[h w]=size(matrix);
sum=[0];
for i =1:h
  for j=1:w
      if(matrix(i,j)~=0)
  z=matrix(i,j)*log2(matrix(i,j));
  sum(1,1)=sum(1,1)+z;
      end
  end
end
result=sum(1,1)*-1;
end

