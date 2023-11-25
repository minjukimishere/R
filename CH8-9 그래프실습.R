#CH8~9 기본 그래프 작성

#1) 막대그래프 [계절 선호도]

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER','FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING') 
ds <- table(favorite)

barplot(ds,
        main='선호 계절 분포도',
        col = cm.colors(4),
        xlab = '계절',
        ylab = '빈도수'
        # 다양한 속성 추가!!!
        ) #f1키 눌러서 관련 속성 넣으면 됨

#2) 중첩 막대 그래프 [연도별 인구 추정 통계]
age.A <- c(13709, 10974, 7979, 5000, 4250)
age.B <- c(17540, 29701, 36209, 33947, 24487)
age.C <- c(991, 2195, 5366, 12980, 19007)

ds <- rbind(age.A, age.B, age.C)
colnames(ds) <- c('1970','1990','2010','2030','2050')
ds

barplot(ds,main='인구추정',
        col = rainbow(3),
        beside = T,
        legend.text=c('0~14세','15~64세','65세 이상')
        )

#3) 히스토그램 [자동차 제동거리]
head(mtcars)
hist(mtcars$mpg,
     breaks=seq(10,40,by=5))

result=hist(cars$dist, main='히스토그램 : 제동거리',  
     xlab='제동거리',
     ylab='빈도수',
     border = 'blue',
     col='red',
     las=1,
     breaks =10
)
result #하나의 변수 처리로 정보를 볼 수 있다.

#LAB. 다이아몬드 시세 파악하기
install.packages('Stat2Data')
library(Stat2Data)

data("Diamonds")  #351개 다이아몬드 샘플의 가격과 특성
str(Diamonds)

colors()

price_col=rep('pink2',9)
price_col[3]='red'

hist(Diamonds$PricePerCt, main = '캐럿당 가격 분포',
     xlab = '캐럿당 가격($)',
     ylab = '빈도수',
     #  속성추가
    col = price_col,
    border='tan3',
    breaks=9,
    las=1
     )


#4) 원그래프/3차원 원그래프

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER','FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING') 
ds <- table(favorite)

pie(ds, main='선호 계절',
    radius=1,
    col=rainbow(4),
    #  속성추가
    init.angle=90,
    clockwise=T
    )


install.packages('plotrix')
library(plotrix)

pie3D(ds, main='선호 계절',
      #속성추가
      labels=names(ds),
      lavelcex=1.0,
      explode = 0.1,
      radius = 1.5,
      col=c('brown','green','red','yellow')
      )

#5) 선 그래프

month <- seq(1,12, by=1) 			 #month <- 1:12
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)    	 

plot(month, 			 
     late, 			   
     main='지각생 통계',
     xlab='Month', 		 
     ylab='Late cnt',
     #속성추가(그래프의 종류, 선의종류, 굵기)
     type='l',
     lty=2,
     lwd=2
)

# 다중 선그래프
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)
lines(month,late2,
      col='blue') 

late3 <- c(5,6,5,6,5,6,5,6,5,6,5,6)
lines(late3,
      type="s",
      col='red')


#6) 상자그림
cars$speed

boxplot(cars$dist, 
        main='자동차 제동거리',
        col='red')
boxplot.stats(car$dist)

str(iris)

boxplot( #그룹정보가 있는 데이터
        #Petal.Length~Species,data=iris,
        iris$Petal.Length ~iris$Species,
        main='품종별 꽃잎의 길이',
        col=c('green','yellow','blue')) 


#7) 산점도
str(mtcars)

plot( #데이터 입력: x,y축
    mtcars$wt,mtcars$mpg,  
     main='중량-연비 그래프', 
     xlab='중량', 	
     ylab='연비(MPG)', 	
     col='red', 	
    pch=14
                          #point의 종류 
     ) 		


#다중산점도
vars <- c('mpg','disp','drat','wt')
target <- mtcars[,vars]
plot(target)
