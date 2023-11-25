#(그래프작성)과제
#1) 제목에 학번, 이름 작성
#2) 속성, 색상 자유롭게
#3) 제시된 데이터 사용
#4) 소스와 그래프를 그림으로 추가

#--------------------------------------
#---1. 10명의 혈액형 정보에 분포를 나타내는
#---   막대 그래프를 다양하게 그리시오.

blood<- c('A형', 'B형', 'B형', 'AB형', 'O형', 'A형', 'O형', 'A형', 'B형', 'A형')

ds=table(blood)
barplot(ds,
        main="20212130, 김민주",
        col=heat.colors(4),
        xlab='혈액형 빈도수',
        horiz=TRUE,
        las=1)

#-------------------------------------------
#---2. 한 과일 가게의 최근 5일간 판매량을 기록한
#---   정보이며, 이를 이용한 막대 그래프를 그리시오
    
m1 <- c(62, 68, 60, 65, 71) # 수박 판매량
m2 <- c(41, 32, 44, 48, 45) # 포도 판매량
m3 <- c(28, 30, 36, 24, 21) # 참외 판매량

ds=rbind(m1,m2,m3)
colnames(ds)=c('1일','2일','3일','4일','5일')
ds

par(mfrow=c(1,1), mar=c(4,4,8,4))

barplot(ds,main="20212130,김민주",
        col=c('green','purple','yellow'),
        beside=TRUE,
        legend.text=c('수박판매량','포도판매량','참외판매량'),
        args.legend = list(x='topright',bty='n',inset=c(-0.15,-0.4)))

#-------------------------------------------
#---3. R의 기본 패키지의 trees 데이터셋의 Grith열을
#---  이용하여 히스토그램을 그리시오.

head(trees)
dist=trees[,1]
dist

hist(dist,
     main='20212130,김민주',
     xlab='지름',
     ylab='빈도수',
     border='red',
     col='orange',
     las=1,
     nclass=4)    
    
#-------------------------------------------
#---4. 4개의 라면 브랜드 A,B,C,D에 대한 선호도를 15명에 대해서 조사한 결과이다. 브랜드 선호도를 원그래프, 3차원 원그래프로 나타내시오.

brand<-c('A', 'C', 'A', 'D', 'B',  'D', 'C', 'A', 'D', 'A', 'C', 'C', 'A', 'B', 'A')

ds=table(brand)
ds    

pie(ds,main='학번:20212130',
      radius=1,
      col=terrain.colors(4))

install.packages('plotrix')
library(plotrix)

pie3D(ds,main='이름: 김민주',
      labels=names(ds),
      labelcex=1.0,
      explode=0.1,
      radius=1,
    col=terrain.colors(4))    
    

#-------------------------------------------
#---5. R에서 제공하는 ChickWeight데이터셋은 다이어트 방법에 따른 병아리의 체중 변화를 일정 시간 간격으로 측정한 데이터이다. 1번 병아리와 21번 병아리의 체중 변화를 선그래프로 작성하시오 – Chick 열 : 병아리번호,  Time 열 : 측정시간, Weight 열 : 병아리 체중

c1 <- subset(ChickWeight, Chick==1)
c21 <- subset(ChickWeight, Chick==21)
    
head(ChickWeight)
c1
c21
plot(c21$Time,
     c21$weight,
     main='20212130,김민주',
     type='b',
     lty=1,
     col='red',
     xlab='time',
     ylab='Weight')  

lines(c1$Time,
      c1$weight,
      type='b',
      col='blue')











