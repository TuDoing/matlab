
clear all;close all;clc;
%%��������
%Iris-setosa--0
%Iris-versicolor--1
%Iris-virginica--2
data=importdata('iris.csv');
%���β����ά���Խ���ά
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

%k-means���࣬����kmeans2
%ldx��ÿһ�����ݵķ����ǩ
%data������Ĳ��������ŵ�����
%c:ÿһ���������ĵ�λ��
%d:������е���������ĵ����֮��
%re������������ŵ����ݣ�������������ݵ������˼���������ټ�һά��
[ldx,c,d]=kmeans2(data,3); 
re=[data ldx];
[m n]=size(re);

%��ʾ����������(��������label����
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