clear all;close all;clc;

%第一类数据
mu1=[0 0 0];  %均值
S1=[0.3 0 0;0 0.35 0;0 0 0.3];  %协方差
data1=mvnrnd(mu1,S1,100);   %产生高斯分布数据

%第二类数据
mu2=[1.25 1.25 1.25];
S2=[0.3 0 0;0 0.35 0;0 0 0.3];
data2=mvnrnd(mu2,S2,100);

%第三类数据
mu3=[-1.25 1.25 -1.25];
S3=[0.3 0 0;0 0.35 0;0 0 0.3];
data3=mvnrnd(mu3,S3,100);

%显示数据(三类数据画在一个三维坐标里）
plot3(data1(:,1),data1(:,2),data1(:,3),'b+');
hold on;
plot3(data2(:,1),data2(:,2),data2(:,3),'r+');
plot3(data3(:,1),data3(:,2),data3(:,3),'g+');
grid on;

%三类数据合成数据集
data=[data1;data2;data3];  %这里的data是不带标号的 

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
    if re(i,4)==1   
         plot3(re(i,1),re(i,2),re(i,3),'b+'); 
         hold on;
    elseif re(i,4)==2
         plot3(re(i,1),re(i,2),re(i,3),'r+'); 
         hold on;
    else 
         plot3(re(i,1),re(i,2),re(i,3),'g+'); 
         hold on;
    end
end
plot3(c(1,1),c(1,2),c(1,3),'bo','MarkerFaceColor','black');
hold on;
plot3(c(2,1),c(2,2),c(2,3),'ro','MarkerFaceColor','black');
plot3(c(3,1),c(3,2),c(3,3),'go','MarkerFaceColor','black');
grid on;