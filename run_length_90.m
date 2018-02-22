function [ out ] = run_length_90( img )
graylevelimg=rgb2gray(img);
[h w]=size(graylevelimg);
graylevelimg=mod(graylevelimg,6);
out=zeros(6,70000);
for i=1:w
    com=[];
    for j=1:h
    com=[com graylevelimg(j,i)];   
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