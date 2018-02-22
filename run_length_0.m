function [ out ] = run_length_0( img )
graylevelimg=rgb2gray(img);
[h w]=size(graylevelimg);
graylevelimg=mod(graylevelimg,6);
out=zeros(6,70000);
for i=1:h
    com=[];
    for j=1:w
    com=[com graylevelimg(i,j)];   
    end
    com=[com 6];
    [a b]=size(com);
    len=1;
    for j=1:b-1
        if(com(1,j)~=com(1,j+1))
           out(com(1,j)+1,len)=out(com(1,j)+1,len)+1;
           len=1;
        else 
           len=len+1;
        end 
    end
end
end