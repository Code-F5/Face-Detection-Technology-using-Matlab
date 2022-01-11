function  detect21( image )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
c=image;
c=imresize(c,[160,120]);
FDetect = vision.CascadeObjectDetector;
BB = step(FDetect,c);
figure(1),
imshow(c); 
for i = 1:size(BB,1)
    rectangle('Position',BB(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','g');
end
title('Based on Viola-Jones Algorithm');
end


