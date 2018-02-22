function [result] = EnergyGLCM(matrix)
[h w]=size(matrix);
sum=[0];
for i =1:h
  for j=1:w
  z=matrix(i,j)*matrix(i,j);
  sum(1,1)=sum(1,1)+z;
  end
end
result=sum(1,1);


end

