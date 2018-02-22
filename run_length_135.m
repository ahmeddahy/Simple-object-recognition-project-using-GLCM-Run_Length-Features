function [ out ] = run_length_135( img )
graylevelimg=rgb2gray(img);
[h w]=size(graylevelimg);
graylevelimg=mod(graylevelimg,6);
out=zeros(6,70000);
for i=1:h
    com=[];
    x=i;
    y=w;
    while(x>0&&y>0)
        com=[com graylevelimg(x,y)];
        x=x-1;
        y=y-1;
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
%%%%%%%%%%%%%%%
for i=1:w-1
    com=[];
    x=h;
    y=i;
    while(x>0&&y>0)
        com=[com graylevelimg(x,y)];
        x=x-1;
        y=y-1;
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