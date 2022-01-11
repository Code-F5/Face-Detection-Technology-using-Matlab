function  skin_detect1(f)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
f=imresize(f,[160,120]);
r=f(:,:,1);
g=f(:,:,2);
b=f(:,:,3);
[m,n]=size(r);
k=zeros([m,n]);
for i=1:m
    for j=1:n
        if(r(i,j)>95 && g(i,j)>60 && b(i,j)>20 && max([r(i,j),g(i,j),b(i,j)])-min([r(i,j),g(i,j),b(i,j)])>15 && abs(r(i,j)-g(i,j))>15 && r(i,j)>g(i,j) && r(i,j)>b(i,j))
            k(i,j)=0;
        else
            k(i,j)=1;
        end
    end
end
k1=medfilt2(k);
k2=edge(k1,'canny');
q=[1,0,1;1,0,1;1,0,1];
k4=imclose(k2,q);
k3=imfill(k4,'holes');
B = bwboundaries(k3);
figure(2),
imshow(f);
hold on
for k = 1:length(B)
 boundary = B{k};
 plot(boundary(:,2), boundary(:,1), 'g', 'LineWidth', 0.2);
end
title('Based on Skin Colour');
end

