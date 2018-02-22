function [result] = ContrastGLCM(matrix)
[h w]=size(matrix);
sum=[0];
for i =1:h
  for j=1:w
  x=i-j;
  y=x*x;
  z=y*matrix(i,j);
  sum(1,1)=sum(1,1)+z;
  end
end
result=sum(1,1);
end

