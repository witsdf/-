%I = imread('Coronary_MPR.jpg');  
I =  imread('t2.jpg');  
% 转化为双精度型  
%I = im2double(I);   
% 若为彩色，转化为灰度  
if(size(I,3)==3), I=rgb2gray(I); end  
figure(1),imshow(I);  
%---------------------------  
%        高斯滤波  
%---------------------------  
sigma=1.0;  
% 创建特定形式的二维高斯滤波器H  
H = fspecial('gaussian',ceil(3*sigma), sigma);  
% 对图像进行高斯滤波,返回和I等大小矩阵  
Igs = filter2(H,I,'same');  
%---------------------------  
%      获取Snake的点坐标  
%---------------------------  
figure(2),imshow(Igs);  
x=[];y=[];c=1;N=100; %定义取点个数c,上限N  
% 获取User手动取点的坐标  
% [x,y]=getpts  
while c<N  
    [xi,yi,button]=ginput(1);  
    % 获取坐标向量  
    x=[x xi];  
    y=[y yi];  
    hold on  % 用来保持要画的图坐标不变
    % text(xi,yi,'o','FontSize',10,'Color','red');  
    plot(xi,yi,'ro');  
    % 若为右击，则停止循环  
    if(button==3), break; end  
    c=c+1;  
end  
  