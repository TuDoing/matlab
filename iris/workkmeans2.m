
clear all;close all;clc;
%%读入数据
%Iris-setosa--0
%Iris-versicolor--1
%Iris-virginica--2
data=importdata('iris.csv');
%将鸢尾花四维属性降二维
[data, mapping] = lda(data(:,1:4), data(:,5), 2); 
[m n]=size(data)
% for i=1:m 
%     if data(i,5)==1   
%          plot(data(i,1),data(i,2),'b+'); 
%          hold on;
%     elseif data(i,5)==2
%          plot(data(i,1),data(i,2),'r+'); 
%          hold on;
%     else 
%          plot(data(i,1),data(i,2),'g+'); 
%          hold on;
%     end
% end

%k-means聚类，调用kmeans2
%ldx：每一类数据的分类标签
%data：输入的不带分类标号的数据
%c:每一个聚类中心的位置
%d:类间所有点与该类质心点距离之和
%re：最后产生带标号的数据，标号在所有数据的最后，意思就是数据再加一维度
[ldx,c,d]=kmeans2(data,3); 
re=[data ldx];
[m n]=size(re);

%显示聚类后的数据(按聚类后的label画）
figure(2);
grid on;
for i=1:m 
    if re(i,3)==1   
         plot(re(i,1),re(i,2),'b+'); 
         hold on;
    elseif re(i,3)==2
         plot(re(i,1),re(i,2),'r+'); 
         hold on;
    else 
         plot(re(i,1),re(i,2),'g+'); 
         hold on;
    end
end
plot(c(1,1),c(1,2),'bo','MarkerFaceColor','black');
hold on;
plot(c(2,1),c(2,2),'ro','MarkerFaceColor','black');
plot(c(3,1),c(3,2),'go','MarkerFaceColor','black');
grid on;