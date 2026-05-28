clear;

load D:\weizhongying\res-135\data\rea1_cer.mat
x_cer1=x_cer;
load D:\weizhongying\res-135\data\rea3_cer.mat
x_cer2=x_cer;
load D:\weizhongying\res-135\data\rea5_cer.mat
x_cer3=x_cer;
load D:\weizhongying\res-135\data\rea7_cer.mat
x_cer4=x_cer;
load D:\weizhongying\res-135\data\rea9_cer.mat
x_cer5=x_cer;
x_cer=[x_cer1 x_cer2 x_cer3 x_cer4 x_cer5];

p=10;q=1;m=3;d=5;N1=2004;N2=1728;


%% 3th

y=x_cer(1:N1,2);%%%%%%%
u=x_cer(1:N1,1);%%%%%
v=x_cer(1:N1,3);%%%%%
e=x_cer(1:N1,4);
g=x_cer(1:N1,5);

for nn=1:100

[Y_tes1(:,1),Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);

if (mean(abs(Y_tes1(:,1)-Y_forecast)./Y_tes1(:,1)))*100<20
def_pre_new(:,1)=Y_forecast;
 break
else
   nn=nn+1;
end
end


ya=x_cer(:,2);%%%%%
for k=2:10
    

Y_tes1(:,k)=x_cer(N2+k:N1-1+k,2);%%%%%%%
ya(N1-2+k,1)=new_data;
yb=ya(k:N1-1+k,1);
y=yb;

u=x_cer(k:N1-1+k,1);%%%%%%%%
v=x_cer(k:N1-1+k,3);%%%%%%%%%
e=x_cer(k:N1-1+k,4);
g=x_cer(k:N1-1+k,5);
for mm=1:100

[Y_tes,Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);
if (mean(abs(Y_tes1(:,k)-Y_forecast)./Y_tes1(:,k)))*100<70
def_pre_new(:,k)=Y_forecast;
break
else
   mm=mm+1;
end
end
end

save('D:\weizhongying\cer\Results\rea3_cer.mat','def_pre_new')

%% 5th

y=x_cer(1:N1,3);%%%%%%%
u=x_cer(1:N1,1);%%%%%
v=x_cer(1:N1,2);%%%%%
e=x_cer(1:N1,4);
g=x_cer(1:N1,5);

for nn=1:100

[Y_tes1(:,1),Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);

if (mean(abs(Y_tes1(:,1)-Y_forecast)./Y_tes1(:,1)))*100<20
def_pre_new(:,1)=Y_forecast;
 break
else
   nn=nn+1;
end
end




ya=x_cer(:,3);%%%%%
for k=2:10
    

Y_tes1(:,k)=x_cer(N2+k:N1-1+k,3);%%%%%%%
ya(N1-2+k,1)=new_data;
yb=ya(k:N1-1+k,1);
y=yb;

u=x_cer(k:N1-1+k,1);%%%%%%%%
v=x_cer(k:N1-1+k,2);%%%%%%%%%
e=x_cer(k:N1-1+k,4);
g=x_cer(k:N1-1+k,5);
for mm=1:100

[Y_tes,Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);
if (mean(abs(Y_tes1(:,k)-Y_forecast)./Y_tes1(:,k)))*100<70
def_pre_new(:,k)=Y_forecast;
break
else
   mm=mm+1;
end
end
end

save('D:\weizhongying\cer\Results\rea5_cer.mat','def_pre_new')

%% 7th

y=x_cer(1:N1,4);%%%%%%%
u=x_cer(1:N1,1);%%%%%
v=x_cer(1:N1,2);%%%%%
e=x_cer(1:N1,3);
g=x_cer(1:N1,5);

for nn=1:100

[Y_tes1(:,1),Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);

if (mean(abs(Y_tes1(:,1)-Y_forecast)./Y_tes1(:,1)))*100<20
def_pre_new(:,1)=Y_forecast;
 break
else
   nn=nn+1;
end
end




ya=x_cer(:,4);%%%%%
for k=2:10
    

Y_tes1(:,k)=x_cer(N2+k:N1-1+k,4);%%%%%%%
ya(N1-2+k,1)=new_data;
yb=ya(k:N1-1+k,1);
y=yb;

u=x_cer(k:N1-1+k,1);%%%%%%%%
v=x_cer(k:N1-1+k,2);%%%%%%%%%
e=x_cer(k:N1-1+k,3);
g=x_cer(k:N1-1+k,5);
for mm=1:100

[Y_tes,Y_forecast] = MIMO_FOUR_FUN(y,u,v,e,g,p,q,m,d,N1,N2);
new_data=Y_forecast(N1-N2,1);
if (mean(abs(Y_tes1(:,k)-Y_forecast)./Y_tes1(:,k)))*100<70
def_pre_new(:,k)=Y_forecast;
break
else
   mm=mm+1;
end
end
end

save('D:\weizhongying\cer\Results\rea7_cer.mat','def_pre_new')