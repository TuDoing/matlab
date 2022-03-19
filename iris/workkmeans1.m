clear all;close all;clc;

%��һ������
mu1=[0 0 0];  %��ֵ
S1=[0.3 0 0;0 0.35 0;0 0 0.3];  %Э����
data1=mvnrnd(mu1,S1,100);   %������˹�ֲ�����

%�ڶ�������
mu2=[1.25 1.25 1.25];
S2=[0.3 0 0;0 0.35 0;0 0 0.3];
data2=mvnrnd(mu2,S2,100);

%����������
mu3=[-1.25 1.25 -1.25];
S3=[0.3 0 0;0 0.35 0;0 0 0.3];
data3=mvnrnd(mu3,S3,100);

%��ʾ����(�������ݻ���һ����ά�����
plot3(data1(:,1),data1(:,2),data1(:,3),'b+');
hold on;
plot3(data2(:,1),data2(:,2),data2(:,3),'r+');
plot3(data3(:,1),data3(:,2),data3(:,3),'g+');
grid on;

%�������ݺϳ����ݼ�
data=[data1;data2;data3];  %�����data�ǲ�����ŵ� 

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