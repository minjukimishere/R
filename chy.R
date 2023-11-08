getwd()
setwd('C:/Users/1105k/Desktop/CH6')
getwd()

#csv파일
air=read.csv('airquality.csv',header = TRUE) #header는 제목줄의 존재 여부

str(air)#데이터셋 구조 확인
head(air)#첫 여섯줄

#데이터 가져오고 확인하기
hist(air$Wind,col='red')
barplot(air$Solar.R)
mean(air$Wind)
View(air) #표로 보고 싶을 때
names(air)

#필요한 것 추출하기
my_air=subset(air,Solar.R>=300&Wind>=mean(air$Wind))
View(my_air)

#사용, 저장
write.csv(my_air,'new-air.csv',row.names=F)

#iris 데이터셋에서 setosa 품종의 행들만 추출하여 임의의 파일로 저장
str(iris)#이런 구조가 있구나
summary(iris)#요약해보니 이렇구나
head(iris,3)#이렇게 생겼구나

#추출
my_iris=subset(iris,Species=='setosa'&Sepal.Length>=5) #setosa 데이터만 가져와
#사용
write.csv(my_iris,'my_iris.csv',row.names=F)
read.csv('my_iris.csv')

#---------------------------------------
#R내장 데이터셋 mtcars에서
#기어(gear)가 4개이고, 실린더(cyl)가 6개인 행들만 추출해 test.csv로 저장한 후,
#저장한 파일을 불러와 변수 new.mtcars1에 저장하시오.
#----------------------------------------------------
str(mtcars)
summary(mtcars)
head(iris,3)

my_mtcars=subset(mtcars,gear==4&cyl==6)
write.csv(my_mtcars,'new.mtcars1')
read.csv('new.mtcars1')

#-------------------------------
#txt 읽고 추출하고 쓰기
#-------------------------------
air=read.table('airquality.txt',header=T,sep='')
head(air,3)

my_mtcars2=subset(mtcars,mpg>=20)
write.table(air,'text.txt',row.names=F) #파일쓰기
new.mtcars3=read.table('text.txt',header=T,sep='\t')

#-------------------------------
#xlsx 읽고 추출하고 쓰기
#-------------------------------

install.packages('xlsx')
library(xlsx)

air=read.xlsx('airquality.xlsx',header = T,sheetIndex=1)
#header=T: 파일의 첫번째 행은 데이터 값이 아닌 열 이름이다.
#sheetIndex=1: 엑셀 파일의 첫 번째 시트를 읽으시오
head(air)

test_xlsx=subset(mtcars,cyl>=6&disp>=400)
write.xlsx(air_excel,'text.xlsx')





