#5장

iris

stat.x77

matrix(1:20,nrow=4,byrow=T)

matrix(21:40)

matrix(c(100,78,80,80,50,65),nrow=2,byrow=T)
score=c(100,78,80,80,50,65)
names(score)=c('국','영','수','사','과','영','체')
score

matrix(score,ncol=3,byrow=T)

al=seq(5,60,by=5)
a=matrix(al,nrow=3)
a
rownames(a)=c('국','영','수')
a
colnames(a)=c('1학년','2학년','3학년')
a

burger_data=c(514,917,11,
              533,853,13,
              566,888,19)
burger=matrix(burger_data,nrow=3,byrow=T)

#2 매트릭스 이름 정의
colnames(burger)=c('kcal','na','fat')
row.names(burger)=c('M','L','B')
burger

burger['M','na']
burger[1,]
burger['M',]
burger[,'kcal']


kcal=c(514,533,566)
na=c(917,853,888)
fat=c(11,13,10)
menu=c('새우','불고기','치킨')

burger_df=data.frame(kcal,na,fat,menu)
burger_df

kcal=c(514,533,566)
na=c(917,853,888)
fat=c(11,13,10)
menu=c('새우','불고기','치킨')

burger=data.frame(kcal,na,fat,menu)

rownames(burger)=c('M','L','B')
burger

burger['M','na']
burger['M',]
burger[,'kcal']
burger[c('M','B'),'menu']
