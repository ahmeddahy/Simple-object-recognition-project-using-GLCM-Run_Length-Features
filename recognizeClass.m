function [ res ] = recognizeClass( classN )
if(classN==1)
res='cat';
elseif(classN==2)
res='Laptop';
elseif(classN==3)
res='apple';
elseif(classN==4) 
res='car';
else 
res='plane';
end
end

