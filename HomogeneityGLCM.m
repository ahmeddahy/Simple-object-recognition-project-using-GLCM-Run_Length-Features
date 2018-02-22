function [result] = HomogeneityGLCM(matrix)
[h w]=size(matrix);
sum=[0];
for i =1:h
  for j=1:w
  x=1+abs(i-j);
  z=matrix(i,j)/x;
  sum(1,1)=sum(1,1)+z;
  end
end
result=sum(1,1);
end

